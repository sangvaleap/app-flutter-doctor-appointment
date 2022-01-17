import 'package:bloc/bloc.dart';
import 'package:doctor_app/model/integration/student_model.dart';
import 'package:doctor_app/network/api_provider.dart';
import './bloc.dart';

class StudentBloc extends Bloc<StudentEvent, StudentState> {
  StudentBloc() : super(InitialStudentState()) {
    on<GetStudent>(_getStudent);
    on<AddStudent>(_addStudent);
    on<EditStudent>(_editStudent);
    on<DeleteStudent>(_deleteStudent);
  }
}

void _getStudent(GetStudent event, Emitter<StudentState> emit) async {
  ApiProvider _apiProvider = ApiProvider();

  emit(GetStudentWaiting());
  try {
    List<StudentModel> data =
        await _apiProvider.getStudent(event.sessionId, event.apiToken);
    emit(GetStudentSuccess(studentData: data));
  } catch (ex) {
    if (ex != 'cancel') {
      emit(GetStudentError(errorMessage: ex.toString()));
    }
  }
}

void _addStudent(AddStudent event, Emitter<StudentState> emit) async {
  ApiProvider _apiProvider = ApiProvider();

  String errorMessage = '';
  if (event.studentName == '') {
    errorMessage = 'Student name cannot be empty';
  } else if (event.studentPhoneNumber == '') {
    errorMessage = 'Student phone number can not be empty';
  } else if (event.studentGender == '') {
    errorMessage = 'Student gender can not be empty';
  } else if (event.studentAddress == '') {
    errorMessage = 'Student address can not be empty';
  }

  if (errorMessage == '') {
    emit(AddStudentWaiting());
    try {
      List data = await _apiProvider.addStudent(
          event.sessionId,
          event.studentName,
          event.studentPhoneNumber,
          event.studentGender,
          event.studentAddress,
          event.apiToken);
      emit(AddStudentSuccess(
          msg: data[0],
          studentId: data[1],
          studentName: event.studentName,
          studentPhoneNumber: event.studentPhoneNumber,
          studentGender: event.studentGender,
          studentAddress: event.studentAddress));
    } catch (ex) {
      emit(AddStudentError(errorMessage: ex.toString()));
    }
  } else {
    emit(StudentErrorValidation(errorMessage: errorMessage));
  }
}

void _editStudent(EditStudent event, Emitter<StudentState> emit) async {
  ApiProvider _apiProvider = ApiProvider();

  String errorMessage = '';
  if (event.studentName == '') {
    errorMessage = 'Student name cannot be empty';
  } else if (event.studentPhoneNumber == '') {
    errorMessage = 'Student phone number can not be empty';
  } else if (event.studentGender == '') {
    errorMessage = 'Student gender can not be empty';
  } else if (event.studentAddress == '') {
    errorMessage = 'Student address can not be empty';
  }

  if (errorMessage == '') {
    emit(EditStudentWaiting());
    try {
      String message = await _apiProvider.editStudent(
          event.sessionId,
          event.studentId,
          event.studentName,
          event.studentPhoneNumber,
          event.studentGender,
          event.studentAddress,
          event.apiToken);
      emit(EditStudentSuccess(
          msg: message,
          index: event.index,
          studentId: event.studentId,
          studentName: event.studentName,
          studentPhoneNumber: event.studentPhoneNumber,
          studentGender: event.studentGender,
          studentAddress: event.studentAddress));
    } catch (ex) {
      emit(EditStudentError(errorMessage: ex.toString()));
    }
  } else {
    emit(StudentErrorValidation(errorMessage: errorMessage));
  }
}

void _deleteStudent(DeleteStudent event, Emitter<StudentState> emit) async {
  ApiProvider _apiProvider = ApiProvider();

  emit(DeleteStudentWaiting());
  try {
    String msg = await _apiProvider.deleteStudent(
        event.sessionId, event.studentId, event.apiToken);
    emit(DeleteStudentSuccess(msg: msg, index: event.index));
  } catch (ex) {
    emit(DeleteStudentError(errorMessage: ex.toString()));
  }
}
