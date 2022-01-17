// Don't forget to initialize all bloc provider at main.dart

import 'package:doctor_app/bloc/student/bloc.dart';
import 'package:doctor_app/config/constant.dart';
import 'package:doctor_app/model/integration/student_model.dart';
import 'package:doctor_app/ui/integration/api/crud/add_data.dart';
import 'package:doctor_app/ui/integration/api/crud/edit_data.dart';
import 'package:doctor_app/ui/reusable/global_function.dart';
import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Api3Page extends StatefulWidget {
  @override
  _Api3PageState createState() => _Api3PageState();
}

class _Api3PageState extends State<Api3Page> {
  // initialize global widget
  final _globalWidget = GlobalWidget();
  final _globalFunction = GlobalFunction();

  late StudentBloc _studentBloc;
  CancelToken apiToken = CancelToken(); // used to cancel fetch data from API

  List<StudentModel> _studentData = [];

  @override
  void initState() {
    _studentBloc = BlocProvider.of<StudentBloc>(context);
    _studentBloc.add(GetStudent(sessionId: '5f0e6bfbafe255.00218389', apiToken: apiToken));
    super.initState();
  }

  @override
  void dispose() {
    apiToken.cancel("cancelled"); // cancel fetch data from API
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _globalWidget.globalAppBar(),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: _globalWidget.createDetailWidget(
                  title: 'API 3 (Create Read Update Delete)',
                  desc: 'This is the example of Student Data\n- Cannot modify or delete Robert Steven & Claire\n- Max limit is 10 data)'
              ),
            ),
            Container(
                child: Wrap(
                  spacing: 16,
                  children: [
                    _globalWidget.createButton(
                        buttonName: 'Refresh',
                        onPressed: (){
                          _studentData.clear();
                          _studentBloc.add(GetStudent(sessionId: '5f0e6bfbafe255.00218389', apiToken: apiToken));
                        }
                    ),
                    _globalWidget.createButton(
                        buttonName: 'Add Data',
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => AddDataPage()));
                        }
                    ),
                  ],
                )
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 8),
              child: Text('Data :', style: TextStyle(
                  fontSize: 18, color: BLACK21, fontWeight: FontWeight.w500
              )),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 8),
              child: BlocListener<StudentBloc, StudentState>(
                listener: (context, state) {
                  if(state is GetStudentError) {
                    Fluttertoast.showToast(msg: state.errorMessage, toastLength: Toast.LENGTH_SHORT, backgroundColor: Colors.red, textColor: Colors.white, fontSize: 13);
                  }
                  if(state is DeleteStudentWaiting) {
                    Navigator.pop(context);
                    _globalFunction.showProgressDialog(context);
                  }
                  if(state is DeleteStudentError){
                    Navigator.pop(context);
                    Fluttertoast.showToast(msg: state.errorMessage, toastLength: Toast.LENGTH_SHORT, backgroundColor: Colors.red, textColor: Colors.white, fontSize: 13);
                  }
                  if(state is GetStudentSuccess) {
                    _studentData.addAll(state.studentData);
                  }
                  if (state is DeleteStudentSuccess) {
                    Navigator.pop(context);
                    _studentData.removeAt(state.index);
                    Fluttertoast.showToast(msg: state.msg, toastLength: Toast.LENGTH_SHORT);
                  }
                  if (state is AddStudentSuccess) {
                    Navigator.pop(context);
                    Navigator.pop(context);
                    _studentData.insert(0, StudentModel(studentId: state.studentId, studentName: state.studentName, studentPhoneNumber: state.studentPhoneNumber, studentGender: state.studentGender, studentAddress: state.studentAddress));
                    Fluttertoast.showToast(msg: state.msg, toastLength: Toast.LENGTH_SHORT);
                  }
                  if (state is EditStudentSuccess) {
                    Navigator.pop(context);
                    Navigator.pop(context);
                    _studentData[state.index] = StudentModel(studentId: state.studentId, studentName: state.studentName, studentPhoneNumber: state.studentPhoneNumber, studentGender: state.studentGender, studentAddress: state.studentAddress);
                    Fluttertoast.showToast(msg: state.msg, toastLength: Toast.LENGTH_SHORT);
                  }
                },
                child: BlocBuilder<StudentBloc, StudentState>(
                  builder: (context, state) {
                    if(state is GetStudentError) {
                      return Text('error occured');
                    } else {
                      if(_studentData.length==0){
                        return Center(child: CircularProgressIndicator());
                      } else {
                        return ListView.builder(
                          itemCount: _studentData.length,
                          shrinkWrap: true,
                          primary: false,
                          // Add one more item for progress indicator
                          padding: EdgeInsets.symmetric(vertical: 0),
                          itemBuilder: (BuildContext context, int index) {
                            return _buildStudentCard(index);
                          },
                        );
                      }
                    }
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildStudentCard(index){
    return Card(
      elevation: 0.5,
      child: Container(
        margin: EdgeInsets.all(12),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                color: _studentData[index].studentGender=='male'?Colors.blue:Colors.pink,
                borderRadius: BorderRadius.all(
                    Radius.circular(18)
                ),
              ),
              alignment: Alignment.center,
              width: 26,
              height: 26,
              child: Center(child: Text(_studentData[index].studentGender=='male'?'M':'F', style: TextStyle(
                  color: Colors.white, fontSize: 12
              ))),
            ),
            SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(_studentData[index].studentName, style: TextStyle(
                      fontSize: 18, color: BLACK55, fontWeight: FontWeight.w500
                  )),
                  Text(_studentData[index].studentAddress, style: TextStyle(
                      fontSize: 14, color: Colors.grey[600], fontWeight: FontWeight.w400
                  ))
                ],
              ),
            ),
            SizedBox(width: 12),
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => EditDataPage(index:index, studentData: _studentData[index])));
              },
              child: Icon(Icons.edit, size: 24, color: Colors.grey[700])
            ),
            SizedBox(width: 8),
            GestureDetector(
              onTap: (){
                _showPopupDelete(index);
              },
              child: Icon(Icons.delete, size: 24, color: Colors.grey[700])
            ),
          ],
        ),
      ),
    );
  }

  void _showPopupDelete(index) {
    // set up the buttons
    Widget cancelButton = TextButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: Text('No', style: TextStyle(color: SOFT_BLUE))
    );
    Widget continueButton = TextButton(
        onPressed: () {
          _studentBloc.add(DeleteStudent(sessionId: '5f0e6bfbafe255.00218389', studentId: _studentData[index].studentId, index: index, apiToken: apiToken));
        },
        child: Text('Yes', style: TextStyle(color: SOFT_BLUE))
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      title: Text('Delete '+_studentData[index].studentName, style: TextStyle(fontSize: 18),),
      content: Text('Are you sure to delete '+_studentData[index].studentName+' ?', style: TextStyle(fontSize: 13)),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
