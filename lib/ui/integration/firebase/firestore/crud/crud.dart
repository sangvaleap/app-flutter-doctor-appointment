/*
Don't Forget to do authentication first with firebase authentication so you can read, add, edit or delete the data
If you don't want to do authentication first, you can set the rules at firebase console here https://console.firebase.google.com/u/2/project/envato-project-f7a81/firestore/rules
*/

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_app/config/constant.dart';
import 'package:doctor_app/cubit/firestore/firestore_cubit.dart';
import 'package:doctor_app/model/integration/firestore_student_model.dart';
import 'package:doctor_app/ui/integration/firebase/firestore/crud/firestore_create.dart';
import 'package:doctor_app/ui/integration/firebase/firestore/crud/firestore_update.dart';
import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class FirestoreCrudPage extends StatefulWidget {
  @override
  _FirestoreCrudPageState createState() => _FirestoreCrudPageState();
}

class _FirestoreCrudPageState extends State<FirestoreCrudPage> {
  // initialize global widget and global function
  final _globalWidget = GlobalWidget();
  List<FirestoreStudentModel> _studentData = [];

  String _errorMessage = '';
  int _dataSize = 0;
  CollectionReference _studentCollections = FirebaseFirestore.instance.collection('students');
  Future<void> _getStudent() async {
    await _studentCollections.orderBy('create_date', descending: true).get().then((QuerySnapshot querySnapshot){
      if (querySnapshot.size > 0) {
        querySnapshot.docs.forEach((doc) {
          _studentData.add(FirestoreStudentModel(studentId: doc.id, studentName: doc['student_name'], studentPhoneNumber: doc['student_phone_number'], studentGender: doc['student_gender'], studentAddress: doc['student_address']));
        });
        setState(() {
          _errorMessage = '';
          _dataSize = querySnapshot.size;
        });
      } else {
        setState(() {
          _errorMessage = 'Data not found';
        });
        Fluttertoast.showToast(msg: _errorMessage, toastLength: Toast.LENGTH_LONG);
      }
    }).catchError((e){
      setState(() {
        _errorMessage = e.message.toString();
      });
      Fluttertoast.showToast(msg: _errorMessage, toastLength: Toast.LENGTH_LONG);
    });
  }

  Future<void> _deleteStudent(String id) async {
    await _studentCollections.doc(id).delete().then((value){
      Fluttertoast.showToast(msg: 'Student Deleted Successfully', toastLength: Toast.LENGTH_LONG);
      _refreshData();
    }).catchError((e){
      Fluttertoast.showToast(msg: e.message.toString(), toastLength: Toast.LENGTH_LONG);
    });
  }

  void _refreshData(){
    _errorMessage = '';
    _studentData.clear();
    _getStudent();
  }

  @override
  void initState() {
    _getStudent();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: _globalWidget.globalAppBar(),
        body: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(24, 24, 24, 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: _globalWidget.createDetailWidget(
                    title: 'Firestore CRUD (Create Read Update Delete)',
                    desc: 'This is the example of Students Collection\n- Max limit is 10 data)'
                ),
              ),
              Container(
                  child: Wrap(
                    spacing: 16,
                    children: [
                      _globalWidget.createButton(
                          buttonName: 'Refresh',
                          onPressed: (){
                            setState(() {
                              _refreshData();
                            });
                          }
                      ),
                      _globalWidget.createButton(
                          buttonName: 'Add Data',
                          onPressed: (){
                            if(_dataSize >= 10){
                              Fluttertoast.showToast(msg: 'Maximum limit is 10, delete data first', toastLength: Toast.LENGTH_LONG);
                            } else {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => FirestoreCreatePage()));
                            }
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
              BlocListener<FirestoreCubit, FirestoreState>(
                listener: (context, state) {
                  if(state is RefreshSuccess) {
                    _refreshData();
                  }
                },
                child: _errorMessage==''
                    ? (_studentData.length!=0)
                      ? ListView.builder(
                          itemCount: _studentData.length,
                          shrinkWrap: true,
                          primary: false,
                          // Add one more item for progress indicator
                          padding: EdgeInsets.symmetric(vertical: 0),
                          itemBuilder: (BuildContext context, int index) {
                            return _buildStudentCard(index);
                          },
                        )
                      : Center(child: CircularProgressIndicator())
                    : Text(_errorMessage),
              )
            ],
          ),
        )
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
                  if(_studentData[index].studentId=='EMw6aT30Uq0kdqhWRjN5' || _studentData[index].studentId=='qIn8Lr3YucoJpp3LpN7q'){
                    Fluttertoast.showToast(msg: 'Cannot update Robert Steven or Claire', toastLength: Toast.LENGTH_LONG);
                  } else {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => FirestoreUpdatePage(studentData: _studentData[index])));
                  }
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
          if(_studentData[index].studentId=='EMw6aT30Uq0kdqhWRjN5' || _studentData[index].studentId=='qIn8Lr3YucoJpp3LpN7q'){
            Fluttertoast.showToast(msg: 'Cannot delete Robert Steven or Claire', toastLength: Toast.LENGTH_LONG);
          } else {
            _deleteStudent(_studentData[index].studentId);
          }
          Navigator.pop(context);
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
