// Don't forget to initialize all bloc provider at main.dart

import 'package:doctor_app/bloc/authentication/login/login_bloc.dart';
import 'package:doctor_app/ui/integration/api/login_module/login_data.dart';
import 'package:doctor_app/ui/reusable/global_function.dart';
import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // initialize global widget and global function
  final _globalWidget = GlobalWidget();
  final _globalFunction = GlobalFunction();

  bool _obscureText = true;
  IconData _iconVisible = Icons.visibility_off;

  TextEditingController _etEmail = TextEditingController();
  TextEditingController _etPassword = TextEditingController();

  late LoginBloc _loginBloc;
  CancelToken apiToken = CancelToken(); // used to cancel fetch data from API

  Color _underlineColor = Color(0xFFCCCCCC);
  Color _mainColor = Color(0xFF07ac12);
  Color _color1 = Color(0xFF515151);
  Color _color2 = Color(0xff777777);

  void _toggleObscureText() {
    setState(() {
      _obscureText = !_obscureText;
      if (_obscureText == true) {
        _iconVisible = Icons.visibility_off;
      } else {
        _iconVisible = Icons.visibility;
      }
    });
  }

  @override
  void initState() {
    _etEmail.text = 'robert.steven@ijteknologi.com';
    _etPassword.text = 'devkit';
    _loginBloc = BlocProvider.of<LoginBloc>(context);
    super.initState();
  }

  @override
  void dispose() {
    _etEmail.dispose();
    _etPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _globalWidget.globalAppBar(),
      body: BlocListener<LoginBloc, LoginState>(
        listener: (context, state) {
          if(state is LoginError) {
            Navigator.pop(context);
            Fluttertoast.showToast(msg: state.errorMessage, toastLength: Toast.LENGTH_LONG, backgroundColor: Colors.red, textColor: Colors.white, fontSize: 13);
          }
          if(state is LoginWaiting) {
            FocusScope.of(context).unfocus();
            _globalFunction.showProgressDialog(context);
          }
          if(state is LoginSuccess) {
            print('data login');
            print('sessionId : '+state.loginData[0].sessionId);
            print('fullName : '+state.loginData[0].fullName);
            print('phoneNumber : '+state.loginData[0].phoneNumber);
            print('email : '+state.loginData[0].email);
            Navigator.pop(context);
            Navigator.push(context, MaterialPageRoute(builder: (context) => LoginDataPage(loginData: state.loginData[0])));
          }
        },
        child: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(24, 24, 24, 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: _globalWidget.createDetailWidget(
                    title: 'Login Module',
                    desc: 'This is the example of Login Module. Login Module is integrated with MySQL Database. Use email and password from MySQL.\n\n'
                        'Default Data\n'
                        'Email : robert.steven@ijteknologi.com\n'
                        'password : devkit\n\n'
                        'After login is success, session will be added at the database.\n\n'
                        'Important *\nDon\'t delete session 5f0e6bfbafe255.00218389'
                ),
              ),
              Container(
                  margin: EdgeInsets.symmetric(vertical: 8),
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    controller: _etEmail,
                    style: TextStyle(color: _color1),
                    decoration: InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: _mainColor, width: 2.0)),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: _underlineColor),
                      ),
                      labelText: 'Email',
                      labelStyle: TextStyle(color: _color2),
                    ),
                  )
              ),
              Container(
                  margin: EdgeInsets.symmetric(vertical: 8),
                  child: TextField(
                    obscureText: _obscureText,
                    controller: _etPassword,
                    style: TextStyle(color: _color1),
                    decoration: InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: _mainColor, width: 2.0)),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: _underlineColor),
                      ),
                      labelText: 'Password',
                      labelStyle: TextStyle(color: _color2),
                      suffixIcon: IconButton(
                          icon: Icon(_iconVisible, color: Colors.grey[400], size: 20),
                          onPressed: () {
                            _toggleObscureText();
                          }),
                    ),
                  )
              ),
              Container(
                  margin: EdgeInsets.symmetric(vertical: 8),
                  child: _globalWidget.createButton(
                      buttonName: 'Login',
                      onPressed: (){
                        _loginBloc.add(Login(email: _etEmail.text, password: _etPassword.text, apiToken: apiToken));
                      }
                  ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
