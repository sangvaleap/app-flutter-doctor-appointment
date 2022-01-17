import 'package:universal_io/io.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ForgotPassword3Page extends StatefulWidget {
  @override
  _ForgotPassword3PageState createState() => _ForgotPassword3PageState();
}

class _ForgotPassword3PageState extends State<ForgotPassword3Page> {
  final Color _color1 = Color(0xFFB226B2);
  final Color _color2 = Color(0xFFFF4891);
  final Color _color3 = Color(0xFFFF6DA7);

  double getSmallDiameter(BuildContext context) {
    return MediaQuery.of(context).size.width * 2 / 3;
  }

  double getBigDiameter(BuildContext context) {
    return MediaQuery.of(context).size.width * 7 / 8;
  }

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
              Positioned(
                top: -getSmallDiameter(context) / 3,
                right: -getSmallDiameter(context) / 3,
                child: Container(
                  width: getSmallDiameter(context),
                  height: getSmallDiameter(context),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                          colors: [_color1, _color3],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter)),
                ),
              ),
              Positioned(
                top: -getBigDiameter(context) / 4,
                left: -getBigDiameter(context) / 4,
                child: Container(
                  child: Center(
                    child: Container(
                        alignment: Alignment(0.2, 0.2),
                        child: Image.asset('assets/images/logo_dark.png', height: 120)),
                  ),
                  width: getBigDiameter(context),
                  height: getBigDiameter(context),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                          colors: [_color1, _color2],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter)),
                ),
              ),
              Positioned(
                bottom: -getBigDiameter(context) / 2,
                right: -getBigDiameter(context) / 2,
                child: Container(
                  width: getBigDiameter(context),
                  height: getBigDiameter(context),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Color(0xFFF3E9EE)),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: ListView(
                  padding: EdgeInsets.only(bottom: 24),
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(5)),
                      margin: EdgeInsets.fromLTRB(24, 300, 24, 10),
                      padding: EdgeInsets.fromLTRB(10, 0, 10, 25),
                      child: Column(
                        children: <Widget>[
                          TextField(
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                                icon: Icon(Icons.email, color: _color2,),
                                focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: _color2)),
                                labelText: "Email",
                                labelStyle: TextStyle(color: _color2)),
                          ),
                          SizedBox(height: 20),
                          Container(
                            margin: EdgeInsets.only(left: 40),
                            child: Text('We will send the instruction to reset your password through the email', style: TextStyle(
                                fontSize: 13, color: Colors.grey
                            )),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      margin: EdgeInsets.fromLTRB(24, 0, 24, 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          TextButton(
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.resolveWith<Color>(
                                      (Set<MaterialState> states) => Colors.transparent,
                                ),
                                overlayColor: MaterialStateProperty.all(Colors.transparent),
                              ),
                              onPressed: () {
                                Fluttertoast.showToast(msg: 'Click reset password', toastLength: Toast.LENGTH_SHORT);
                              },
                              child: Ink(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                      colors: <Color>[_color1, _color2],
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter
                                  ),
                                  borderRadius: BorderRadius.all(Radius.circular(20)),
                                ),
                                child: Container(
                                  constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width/1.5, minHeight: 40), // min sizes for Material buttons
                                  alignment: Alignment.center,
                                  child: Text(
                                    "RESET PASSWORD",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ),
                              )
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(Icons.arrow_back, size: 16, color: _color2),
                        GestureDetector(
                          onTap: () {
                            Fluttertoast.showToast(msg: 'Click back to login', toastLength: Toast.LENGTH_SHORT);
                          },
                          child: Text(
                            ' Back to login',
                            style: TextStyle(
                                fontSize: 14,
                                color: _color2,
                                fontWeight: FontWeight.w700),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        )
    );
  }
}
