import 'package:universal_io/io.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ForgotPassword2Page extends StatefulWidget {
  @override
  _ForgotPassword2PageState createState() => _ForgotPassword2PageState();
}

class _ForgotPassword2PageState extends State<ForgotPassword2Page> {
  Color _gradientTop = Color(0xFF039be6);
  Color _gradientBottom = Color(0xFF0299e2);
  Color _mainColor = Color(0xFF0181cc);
  Color _underlineColor = Color(0xFFCCCCCC);

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
        body: AnnotatedRegion<SystemUiOverlayStyle>(
          value: Platform.isIOS?SystemUiOverlayStyle.light:SystemUiOverlayStyle(
              statusBarIconBrightness: Brightness.light
          ),
          child: Stack(
            children: <Widget>[
              // top blue background gradient
              Container(
                height: MediaQuery.of(context).size.height / 3.5,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [_gradientTop, _gradientBottom],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter)),
              ),
              // set your logo here
              Container(
                  margin: EdgeInsets.fromLTRB(0, MediaQuery.of(context).size.height / 20, 0, 0),
                  alignment: Alignment.topCenter,
                  child: Image.asset('assets/images/logo_dark.png', height: 120)),
              ListView(
                children: <Widget>[
                  // create form login
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    elevation: 5,
                    margin: EdgeInsets.fromLTRB(32, MediaQuery.of(context).size.height / 3.5 - 72, 32, 0),
                    color: Colors.white,
                    child: Container(
                        margin: EdgeInsets.fromLTRB(24, 0, 24, 20),
                        child: Column(
                          children: <Widget>[
                            SizedBox(
                              height: 40,
                            ),
                            Center(
                              child: Text(
                                'FORGOT PASSWORD',
                                style: TextStyle(
                                    color: _mainColor,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w900),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Center(
                              child: Text(
                                'Confirm your email and we will send the instruction',
                                style: TextStyle(
                                  color: Colors.grey[600],
                                  fontSize: 14,),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            TextField(
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: Colors.grey[600]!)),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: _underlineColor),
                                  ),
                                  labelText: 'Email',
                                  labelStyle: TextStyle(color: Colors.grey[700])),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            SizedBox(
                              width: double.maxFinite,
                              child: TextButton(
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.resolveWith<Color>(
                                          (Set<MaterialState> states) => _mainColor,
                                    ),
                                    overlayColor: MaterialStateProperty.all(Colors.transparent),
                                    shape: MaterialStateProperty.all(
                                        RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(10),
                                        )
                                    ),
                                  ),
                                  onPressed: () {
                                    Fluttertoast.showToast(msg: 'Click reset password', toastLength: Toast.LENGTH_SHORT);
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 5),
                                    child: Text(
                                      'RESET PASSWORD',
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.white),
                                      textAlign: TextAlign.center,
                                    ),
                                  )
                              ),
                            ),
                          ],
                        )),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  // create sign up link
                  Center(
                    child: GestureDetector(
                      onTap: () {
                        Fluttertoast.showToast(msg: 'Click back to login', toastLength: Toast.LENGTH_SHORT);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(Icons.arrow_back, size: 16, color: _mainColor),
                          Text(
                            ' Back to login',
                            style: TextStyle(
                                color: _mainColor,
                                fontWeight: FontWeight.w700),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              )
            ],
          ),
        )
    );
  }
}
