/*
This is api provider
This page is used to get data from API
 */

import 'package:doctor_app/config/constant.dart';
import 'package:doctor_app/model/integration/login_model.dart';
import 'package:doctor_app/model/integration/product_grid_model.dart';
import 'package:doctor_app/model/integration/product_listview_model.dart';
import 'package:doctor_app/model/integration/student_model.dart';
import 'package:dio/dio.dart';

class ApiProvider {
  Dio dio = Dio();
  late Response response;
  String connErr = 'Please check your internet connection and try again';

  Future<Response> getConnect(url, apiToken) async {
    print('url : ' + url.toString());
    try {
      dio.options.headers['content-Type'] = 'application/x-www-form-urlencoded';
      dio.options.connectTimeout = 30000; //5s
      dio.options.receiveTimeout = 25000;

      return await dio.post(url, cancelToken: apiToken);
    } on DioError catch (e) {
      //print(e.toString()+' | '+url.toString());
      if (e.type == DioErrorType.response) {
        int? statusCode = e.response!.statusCode;
        if (statusCode == STATUS_NOT_FOUND) {
          throw "Api not found";
        } else if (statusCode == STATUS_INTERNAL_ERROR) {
          throw "Internal Server Error";
        } else {
          throw e.error.message.toString();
        }
      } else if (e.type == DioErrorType.connectTimeout) {
        throw e.message.toString();
      } else if (e.type == DioErrorType.cancel) {
        throw 'cancel';
      }
      throw connErr;
    } finally {
      dio.close();
    }
  }

  Future<Response> postConnect(url, data, apiToken) async {
    print('url : ' + url.toString());
    print('postData : ' + data.toString());
    try {
      dio.options.headers['content-Type'] = 'application/x-www-form-urlencoded';
      dio.options.connectTimeout = 30000; //5s
      dio.options.receiveTimeout = 25000;

      return await dio.post(url, data: data, cancelToken: apiToken);
    } on DioError catch (e) {
      //print(e.toString()+' | '+url.toString());
      if (e.type == DioErrorType.response) {
        int? statusCode = e.response!.statusCode;
        if (statusCode == STATUS_NOT_FOUND) {
          throw "Api not found";
        } else if (statusCode == STATUS_INTERNAL_ERROR) {
          throw "Internal Server Error";
        } else {
          throw e.error.message.toString();
        }
      } else if (e.type == DioErrorType.connectTimeout) {
        throw e.message.toString();
      } else if (e.type == DioErrorType.cancel) {
        throw 'cancel';
      }
      throw connErr;
    } finally {
      dio.close();
    }
  }

  Future<String> getExample(apiToken) async {
    response = await getConnect(SERVER_URL + '/example/getData', apiToken);
    print('res : ' + response.toString());
    return response.data.toString();
  }

  Future<String> postExample(String id, apiToken) async {
    var postData = {'id': id};
    response =
        await postConnect(SERVER_URL + '/example/postData', postData, apiToken);
    print('res : ' + response.toString());
    return response.data.toString();
  }

  Future<List<StudentModel>> getStudent(String sessionId, apiToken) async {
    var postData = {'session_id': sessionId};
    response = await postConnect(
        SERVER_URL + '/student/getStudent', postData, apiToken);
    if (response.data['status'] == STATUS_OK) {
      List responseList = response.data['data'];
      List<StudentModel> listData =
          responseList.map((f) => StudentModel.fromJson(f)).toList();
      return listData;
    } else {
      throw response.data['msg'];
    }
  }

  Future<List<dynamic>> addStudent(
      String sessionId,
      String studentName,
      String studentPhoneNumber,
      String studentGender,
      String studentAddress,
      apiToken) async {
    var postData = {
      'session_id': sessionId,
      'student_name': studentName,
      'student_phone_number': studentPhoneNumber,
      'student_gender': studentGender,
      'student_address': studentAddress,
    };
    response = await postConnect(
        SERVER_URL + '/student/addStudent', postData, apiToken);
    if (response.data['status'] == STATUS_OK) {
      List<dynamic> respList = [];
      respList.add(response.data['msg']);
      respList.add(response.data['data']['id']);
      return respList;
    } else {
      throw response.data['msg'];
    }
  }

  Future<String> editStudent(
      String sessionId,
      int studentId,
      String studentName,
      String studentPhoneNumber,
      String studentGender,
      String studentAddress,
      apiToken) async {
    var postData = {
      'session_id': sessionId,
      'student_id': studentId,
      'student_name': studentName,
      'student_phone_number': studentPhoneNumber,
      'student_gender': studentGender,
      'student_address': studentAddress,
    };
    response = await postConnect(
        SERVER_URL + '/student/editStudent', postData, apiToken);
    if (response.data['status'] == STATUS_OK) {
      return response.data['msg'];
    } else {
      throw response.data['msg'];
    }
  }

  Future<String> deleteStudent(
      String sessionId, int studentId, apiToken) async {
    var postData = {
      'session_id': sessionId,
      'student_id': studentId,
    };
    response = await postConnect(
        SERVER_URL + '/student/deleteStudent', postData, apiToken);
    if (response.data['status'] == STATUS_OK) {
      return response.data['msg'];
    } else {
      throw response.data['msg'];
    }
  }

  Future<List<LoginModel>> login(
      String email, String password, apiToken) async {
    var postData = {
      'email': email,
      'password': password,
    };
    response = await postConnect(LOGIN_API, postData, apiToken);
    if (response.data['status'] == STATUS_OK) {
      List responseList = response.data['data'];
      List<LoginModel> listData =
          responseList.map((f) => LoginModel.fromJson(f)).toList();
      return listData;
    } else {
      throw response.data['msg'];
    }
  }

  Future<List<ProductGridModel>> getProductGrid(
      String sessionId, String skip, String limit, apiToken) async {
    var postData = {'session_id': sessionId, 'skip': skip, 'limit': limit};
    response = await postConnect(PRODUCT_API, postData, apiToken);
    if (response.data['status'] == STATUS_OK) {
      List responseList = response.data['data'];
      //print('data : '+responseList.toString());
      List<ProductGridModel> listData =
          responseList.map((f) => ProductGridModel.fromJson(f)).toList();
      return listData;
    } else {
      throw response.data['msg'];
    }
  }

  Future<List<ProductListviewModel>> getProductListview(
      String sessionId, String skip, String limit, apiToken) async {
    var postData = {'session_id': sessionId, 'skip': skip, 'limit': limit};
    response = await postConnect(PRODUCT_API, postData, apiToken);
    if (response.data['status'] == STATUS_OK) {
      List responseList = response.data['data'];
      //print('data : '+responseList.toString());
      List<ProductListviewModel> listData =
          responseList.map((f) => ProductListviewModel.fromJson(f)).toList();
      return listData;
    } else {
      throw response.data['msg'];
    }
  }
}
