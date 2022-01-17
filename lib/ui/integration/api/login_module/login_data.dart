import 'package:doctor_app/model/integration/login_model.dart';
import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';

class LoginDataPage extends StatefulWidget {
  final LoginModel loginData;

  const LoginDataPage({Key? key, required this.loginData}) : super(key: key);

  @override
  _LoginDataPageState createState() => _LoginDataPageState();
}

class _LoginDataPageState extends State<LoginDataPage> {
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
      body: Center(
        child: Text('Login Data :\n\n'
            'sessionId : '+widget.loginData.sessionId+'\n'
            'fullName : '+widget.loginData.fullName+'\n'
            'phoneNumber : '+widget.loginData.phoneNumber+'\n'
            'email : '+widget.loginData.email),
      ),
    );
  }
}
