import 'package:doctor_app/config/constant.dart';
import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:doctor_app/ui/screen/forgot_password/forgot_password1.dart';
import 'package:doctor_app/ui/screen/forgot_password/forgot_password2.dart';
import 'package:doctor_app/ui/screen/forgot_password/forgot_password3.dart';
import 'package:doctor_app/ui/screen/forgot_password/forgot_password4.dart';
import 'package:flutter/material.dart';

class ForgotPasswordListPage extends StatefulWidget {
  @override
  _ForgotPasswordListPageState createState() => _ForgotPasswordListPageState();
}

class _ForgotPasswordListPageState extends State<ForgotPasswordListPage> {
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
              child: Text('Forgot Password Screen', style: TextStyle(
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
                        child: Text('Forgot password screen used to reset the password of users', style: TextStyle(
                            fontSize: 15, color: BLACK77,letterSpacing: 0.5
                        )),
                      )
                  ),
                  Flexible(
                      flex: 2,
                      child: Container(
                          alignment: Alignment.center,
                          child: Icon(Icons.vpn_key, size: 50, color: SOFT_BLUE))
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 48),
              child: Text('Screen List', style: TextStyle(
                  fontSize: 18, color: BLACK21, fontWeight: FontWeight.w500
              )),
            ),
            SizedBox(height: 18),
            _globalWidget.screenDetailList(context: context, title: 'Forgot Password 1', page: ForgotPassword1Page()),
            _globalWidget.screenDetailList(context: context, title: 'Forgot Password 2', page: ForgotPassword2Page()),
            _globalWidget.screenDetailList(context: context, title: 'Forgot Password 3', page: ForgotPassword3Page()),
            _globalWidget.screenDetailList(context: context, title: 'Forgot Password 4', page: ForgotPassword4Page()),
          ],
        )
    );
  }
}
