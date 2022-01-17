import 'package:doctor_app/config/constant.dart';
import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:doctor_app/ui/screen/signin/signin1.dart';
import 'package:doctor_app/ui/screen/signin/signin2.dart';
import 'package:doctor_app/ui/screen/signin/signin3.dart';
import 'package:doctor_app/ui/screen/signin/signin4.dart';
import 'package:flutter/material.dart';

class SigninListPage extends StatefulWidget {
  @override
  _SigninListPageState createState() => _SigninListPageState();
}

class _SigninListPageState extends State<SigninListPage> {
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
              child: Text('Sign In Screen', style: TextStyle(
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
                      child: Text('Sign in screen used for authentication before going to the home page.', style: TextStyle(
                        fontSize: 15, color: BLACK77,letterSpacing: 0.5
                      )),
                    )
                  ),
                  Flexible(
                    flex: 2,
                    child: Container(
                      alignment: Alignment.center,
                        child: Icon(Icons.login, size: 50, color: SOFT_BLUE))
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
            _globalWidget.screenDetailList(context: context, title: 'Sign in 1', page: Signin1Page()),
            _globalWidget.screenDetailList(context: context, title: 'Sign in 2', page: Signin2Page()),
            _globalWidget.screenDetailList(context: context, title: 'Sign in 3', page: Signin3Page()),
            _globalWidget.screenDetailList(context: context, title: 'Sign in 4', page: Signin4Page()),
          ],
        )
    );
  }
}
