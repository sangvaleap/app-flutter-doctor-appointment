/*
Don't Forget to do authentication first with firebase authentication so you can read, add, edit or delete the data
If you don't want to do authentication first, you can set the rules at firebase console here https://console.firebase.google.com/u/2/project/envato-project-f7a81/firestore/rules
*/

import 'package:doctor_app/config/constant.dart';
import 'package:doctor_app/ui/integration/firebase/firestore/crud/crud.dart';
import 'package:doctor_app/ui/integration/firebase/firestore/firestore_add_data_auto_id.dart';
import 'package:doctor_app/ui/integration/firebase/firestore/firestore_add_data_uuid.dart';
import 'package:doctor_app/ui/integration/firebase/firestore/firestore_edit_data_with_set.dart';
import 'package:doctor_app/ui/integration/firebase/firestore/firestore_edit_data_with_update.dart';
import 'package:doctor_app/ui/integration/firebase/firestore/firestore_get_data.dart';
import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';

class FirestoreListPage extends StatefulWidget {
  @override
  _FirestoreListPageState createState() => _FirestoreListPageState();
}

class _FirestoreListPageState extends State<FirestoreListPage> {
  // initialize global widget
  final _globalWidget = GlobalWidget();

  @override
  void initState() {
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
        body: ListView(
          padding: EdgeInsets.fromLTRB(24, 24, 24, 16),
          children: [
            Container(
              child: Text('Firestore List', style: TextStyle(
                  fontSize: 18, color: BLACK21, fontWeight: FontWeight.w500
              )),
            ),
            Container(
              margin: EdgeInsets.only(top: 24),
              child: Row(
                children: [
                  Flexible(
                      flex:5,
                      child: Container(
                        child: RichText(
                          text: TextSpan(
                            // style is the default style for all rich text
                            // to change the specific text, you have to change it at textspan
                            style: TextStyle(
                              fontSize: 16, color: BLACK77, letterSpacing: 0.7,
                            ),
                            children: <TextSpan>[
                              TextSpan(text: 'Used for Database with Firebase.\n\n'),
                              TextSpan(text: 'Important Notes :\n', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red)),
                              TextSpan(text: 'You must do Firebase Authentication first to write or read the data.\n\n'),
                              TextSpan(text: 'Do Firebase Authentication at Integrations Section => Firebase => Firebase Authentications => Choose 1 of the method.'),
                            ],
                          ),
                        ),
                      )
                  ),
                  Flexible(
                      flex: 2,
                      child: Container(
                          alignment: Alignment.center,
                          child: Icon(Icons.local_fire_department, size: 50, color: Colors.orange))
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 48),
              child: Text('List', style: TextStyle(
                  fontSize: 18, color: BLACK21, fontWeight: FontWeight.w500
              )),
            ),
            SizedBox(height: 18),
            _globalWidget.screenDetailList(context: context, title: 'Get Data', page: FirestoreGetDataPage()),
            _globalWidget.screenDetailList(context: context, title: 'Add Data with Uuid', page: FirestoreAddDataUuidPage()),
            _globalWidget.screenDetailList(context: context, title: 'Add Data with Firebase Auto ID', page: FirestoreAddDataAutoIdPage()),
            _globalWidget.screenDetailList(context: context, title: 'Edit Data with update query', page: FirestoreEditDataWithUpdatePage()),
            _globalWidget.screenDetailList(context: context, title: 'Edit Data with set query', page: FirestoreEditDataWithSetPage()),
            _globalWidget.screenDetailList(context: context, title: 'Firestore CRUD Example', page: FirestoreCrudPage()),
          ],
        )
    );
  }
}
