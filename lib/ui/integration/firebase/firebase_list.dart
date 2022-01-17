import 'package:doctor_app/config/constant.dart';
import 'package:doctor_app/ui/integration/firebase/firebase_authentications/firebase_auth_list.dart';
import 'package:doctor_app/ui/integration/firebase/firebase_storage/firebase_storage.dart';
import 'package:doctor_app/ui/integration/firebase/firestore/firestore_list.dart';
import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';

class FirebaseListPage extends StatefulWidget {
  @override
  _FirebaseListPageState createState() => _FirebaseListPageState();
}

class _FirebaseListPageState extends State<FirebaseListPage> {
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
              child: Text('Firebase', style: TextStyle(
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
                        child: Text('Choose Firebase Tools.', style: TextStyle(
                            fontSize: 15, color: BLACK77,letterSpacing: 0.5
                        )),
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
            _globalWidget.screenDetailList(context: context, title: 'Firebase Authentications', page: FirebaseAuthenticationsListPage()),
            _globalWidget.screenDetailList(context: context, title: 'Firestore', page: FirestoreListPage()),
            _globalWidget.screenDetailList(context: context, title: 'Firebase Storage', page: FirebaseStoragePage()),
          ],
        )
    );
  }
}
