// Don't forget to initialize all bloc provider at main.dart

import 'package:doctor_app/bloc/student/bloc.dart';
import 'package:doctor_app/config/constant.dart';
import 'package:doctor_app/model/integration/student_model.dart';
import 'package:doctor_app/ui/reusable/global_function.dart';
import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class EditDataPage extends StatefulWidget {
  final index;
  final StudentModel studentData;

  const EditDataPage({Key? key, this.index, required this.studentData}) : super(key: key);

  @override
  _EditDataPageState createState() => _EditDataPageState();
}

class _EditDataPageState extends State<EditDataPage> {
  // initialize global widget
  final _globalWidget = GlobalWidget();
  final _globalFunction = GlobalFunction();

  late StudentBloc _studentBloc;
  CancelToken apiToken = CancelToken(); // used to cancel fetch data from API

  Color _underlineColor = Color(0xFFCCCCCC);
  Color _mainColor = Colors.blue;
  Color _color1 = Color(0xFF515151);
  Color _color2 = Color(0xff777777);

  TextEditingController _etStudentName = TextEditingController();
  TextEditingController _etStudentPhoneNumber = TextEditingController();
  TextEditingController _etStudentAddress = TextEditingController();

  late List<bool> _isSelectGender;

  @override
  void initState() {
    _studentBloc = BlocProvider.of<StudentBloc>(context);

    _etStudentName.text=widget.studentData.studentName;
    _etStudentPhoneNumber.text=widget.studentData.studentPhoneNumber;
    _etStudentAddress.text=widget.studentData.studentAddress;

    if(widget.studentData.studentGender=='male'){
      _isSelectGender = [true, false];
    } else {
      _isSelectGender = [false, true];
    }
    super.initState();
  }

  @override
  void dispose() {
    apiToken.cancel("cancelled"); // cancel fetch data from API
    _etStudentName.dispose();
    _etStudentPhoneNumber.dispose();
    _etStudentAddress.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: _globalWidget.globalAppBar(),
        body: BlocListener<StudentBloc, StudentState>(
          listener: (context, state) {
            if(state is StudentErrorValidation) {
              Fluttertoast.showToast(msg: state.errorMessage, toastLength: Toast.LENGTH_SHORT, backgroundColor: Colors.red, textColor: Colors.white, fontSize: 13);
            }
            if(state is EditStudentWaiting) {
              FocusScope.of(context).unfocus();
              _globalFunction.showProgressDialog(context);
            }
            if(state is EditStudentError){
              Navigator.pop(context);
              Fluttertoast.showToast(msg: state.errorMessage, toastLength: Toast.LENGTH_SHORT, backgroundColor: Colors.red, textColor: Colors.white, fontSize: 13);
            }
          },
          child: ListView(
            padding: EdgeInsets.all(16),
            children: [
              Text('Edit Data', style: TextStyle(
                  fontSize: 18, color: BLACK21, fontWeight: FontWeight.w500
              )),
              TextFormField(
                controller: _etStudentName,
                keyboardType: TextInputType.text,
                style: TextStyle(color: _color1),
                decoration: InputDecoration(
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: _mainColor, width: 2.0)),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: _underlineColor),
                  ),
                  labelText: 'Student Name',
                  labelStyle: TextStyle(color: _color2),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: _etStudentPhoneNumber,
                keyboardType: TextInputType.phone,
                style: TextStyle(color: _color1),
                decoration: InputDecoration(
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: _mainColor, width: 2.0)),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: _underlineColor),
                  ),
                  labelText: 'Student Phone Number',
                  labelStyle: TextStyle(color: _color2),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                margin: EdgeInsets.only(bottom: 16),
                child: Text('Gender', style: TextStyle(
                    fontSize: 16, color: Colors.grey[600]
                )),
              ),
              ToggleButtons(
                color: Colors.grey,
                selectedColor: Colors.white,
                fillColor: Colors.cyan,
                selectedBorderColor: Colors.cyan,
                borderRadius: BorderRadius.circular(4),
                children: <Widget>[
                  Container(
                      margin: EdgeInsets.symmetric(horizontal: 16),
                      child: Text('Male')
                  ),
                  Container(
                      margin: EdgeInsets.symmetric(horizontal: 16),
                      child: Text('Female')
                  ),
                ],
                onPressed: (int index) {
                  setState(() {
                    for (int buttonIndex = 0; buttonIndex < _isSelectGender.length; buttonIndex++) {
                      if (buttonIndex == index) {
                        _isSelectGender[buttonIndex] = true;
                      } else {
                        _isSelectGender[buttonIndex] = false;
                      }
                    }
                  });
                },
                isSelected: _isSelectGender,
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                controller: _etStudentAddress,
                maxLines: null,
                decoration: InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: _mainColor, width: 2.0)),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: _underlineColor),
                    ),
                    labelText: 'Student Address',
                    labelStyle: TextStyle(color: _color2)),
              ),
              SizedBox(height: 40),
              _globalWidget.createButton(
                  buttonName: 'EDIT STUDENT',
                  onPressed: (){
                    _studentBloc.add(EditStudent(sessionId: '5f0e6bfbafe255.00218389', index:widget.index, studentId: widget.studentData.studentId, studentName: _etStudentName.text, studentPhoneNumber: _etStudentPhoneNumber.text, studentGender: _isSelectGender[0]?'male':'female', studentAddress: _etStudentAddress.text, apiToken: apiToken));
                  }
              ),
            ],
          ),
        )
    );
  }
}
