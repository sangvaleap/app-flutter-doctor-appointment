import 'package:doctor_app/config/constant.dart';
import 'package:doctor_app/ui/integration/firebase/firebase_authentications/auth_anonymous.dart';
import 'package:doctor_app/ui/integration/firebase/firebase_authentications/auth_email_password.dart';
import 'package:doctor_app/ui/integration/firebase/firebase_authentications/auth_google.dart';
import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';

class FirebaseAuthenticationsListPage extends StatefulWidget {
  @override
  _FirebaseAuthenticationsListPageState createState() => _FirebaseAuthenticationsListPageState();
}

class _FirebaseAuthenticationsListPageState extends State<FirebaseAuthenticationsListPage> {
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
              child: Text('Firebase Authentication Method List', style: TextStyle(
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
                        child: Text('Used for authentication with Firebase', style: TextStyle(
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
            _globalWidget.screenDetailList(context: context, title: 'Anonymous Method', page: AuthAnonymousPage()),
            _globalWidget.screenDetailList(context: context, title: 'Email / Password Method', page: AuthEmailPasswordPage()),
            _globalWidget.screenDetailList(context: context, title: 'Google Sign In', page: AuthGooglePage()),
          ],
        )
    );
  }
}
