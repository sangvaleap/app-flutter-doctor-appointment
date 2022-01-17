/*
Don't forget to initialize FirestoreCubit at main.dart
Don't Forget to do authentication first with firebase authentication so you can read, add, edit or delete the data
If you don't want to do authentication first, you can set the rules at firebase console here https://console.firebase.google.com/u/2/project/envato-project-f7a81/firestore/rules
*/

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_app/config/constant.dart';
import 'package:doctor_app/cubit/firestore/firestore_cubit.dart';
import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class FirestoreCreatePage extends StatefulWidget {
  @override
  _FirestoreCreatePageState createState() => _FirestoreCreatePageState();
}

class _FirestoreCreatePageState extends State<FirestoreCreatePage> {
  // initialize global widget and global function
  final _globalWidget = GlobalWidget();

  Color _underlineColor = Color(0xFFCCCCCC);
  Color _mainColor = Colors.blue;
  Color _color1 = Color(0xFF515151);
  Color _color2 = Color(0xff777777);

  late FirestoreCubit _firestoreCubit;

  TextEditingController _etStudentName = TextEditingController();
  TextEditingController _etStudentPhoneNumber = TextEditingController();
  TextEditingController _etStudentAddress = TextEditingController();

  List<bool> _isSelectGender = [true, false];

  CollectionReference _studentCollections = FirebaseFirestore.instance.collection('students');
  Future<void> _addStudent({required String studentName, required String studentPhoneNumber, required String studentGender, required String studentAddress}) async {
    String errorMessage='';
    if(studentName==''){
      errorMessage = 'Student name cannot be empty';
    } else if(studentPhoneNumber==''){
      errorMessage = 'Student phone number can not be empty';
    } else if(studentGender==''){
      errorMessage = 'Student gender can not be empty';
    } else if(studentAddress==''){
      errorMessage = 'Student address can not be empty';
    }

    if(errorMessage == ''){
      await _studentCollections.add({
        'student_name' : studentName,
        'student_phone_number' : studentPhoneNumber,
        'student_gender' : studentGender,
        'student_address' : studentAddress,
        'create_date' : FieldValue.serverTimestamp()
      }).then((value){
        Fluttertoast.showToast(msg: 'Product Added Successfully', toastLength: Toast.LENGTH_LONG);
        _firestoreCubit.refreshData();
        Navigator.pop(context);
      }).catchError((e){
        Fluttertoast.showToast(msg: e.message.toString(), toastLength: Toast.LENGTH_LONG);
      });
    } else {
      Fluttertoast.showToast(msg: errorMessage, toastLength: Toast.LENGTH_LONG);
    }
  }

  @override
  void initState() {
    _firestoreCubit = BlocProvider.of<FirestoreCubit>(context);
    super.initState();
  }

  @override
  void dispose() {
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
        body: ListView(
          padding: EdgeInsets.all(16),
          children: [
            Text('Add Data', style: TextStyle(
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
                buttonName: 'ADD STUDENT',
                onPressed: (){
                  _addStudent(studentName: _etStudentName.text, studentPhoneNumber: _etStudentPhoneNumber.text, studentGender: _isSelectGender[0]?'male':'female', studentAddress: _etStudentAddress.text);
                }
            ),
          ],
        )
    );
  }
}
