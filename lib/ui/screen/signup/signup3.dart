import 'package:universal_io/io.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Signup3Page extends StatefulWidget {
  @override
  _Signup3PageState createState() => _Signup3PageState();
}

class _Signup3PageState extends State<Signup3Page> {
  bool _obscureText = true;
  IconData _iconVisible = Icons.visibility_off;

  final Color _color1 = Color(0xFFB226B2);
  final Color _color2 = Color(0xFFFF4891);
  final Color _color3 = Color(0xFFFF6DA7);

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
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                                icon: Icon(Icons.person, color: _color2,),
                                focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: _color2)),
                                labelText: "Name",
                                labelStyle: TextStyle(color: _color2)),
                          ),
                          TextField(
                            keyboardType: TextInputType.phone,
                            decoration: InputDecoration(
                                icon: Icon(Icons.phone, color: _color2,),
                                focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: _color2)),
                                labelText: "Phone Number",
                                labelStyle: TextStyle(color: _color2)),
                          ),
                          TextField(
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                                icon: Icon(Icons.email, color: _color2,),
                                focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: _color2)),
                                labelText: "Email",
                                labelStyle: TextStyle(color: _color2)),
                          ),
                          TextField(
                            obscureText: _obscureText,
                            decoration: InputDecoration(
                              icon: Icon(Icons.vpn_key, color: _color2,),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: _color2)),
                              labelText: "Password",
                              labelStyle: TextStyle(color: _color2),
                              suffixIcon: IconButton(
                                  icon: Icon(_iconVisible, color: Colors.grey[700], size: 20),
                                  onPressed: () {
                                    _toggleObscureText();
                                  }),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(24, 20, 24, 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          TextButton(
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.resolveWith<Color>(
                                      (Set<MaterialState> states) => Colors.transparent,
                                ),
                                overlayColor: MaterialStateProperty.all(Colors.transparent),
                              ),
                              onPressed: () {
                                Fluttertoast.showToast(msg: 'Click signup', toastLength: Toast.LENGTH_SHORT);
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
                                  constraints: BoxConstraints(maxWidth: 190, minHeight: 40), // min sizes for Material buttons
                                  alignment: Alignment.center,
                                  child: Text(
                                    "SIGN UP",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ),
                              )
                          ),
                          GestureDetector(
                            onTap: (){
                              Fluttertoast.showToast(msg: 'Signup with google', toastLength: Toast.LENGTH_SHORT);
                            },
                            child: Image(
                              image: AssetImage('assets/images/google.png'),
                              width: 40,
                            ),
                          ),
                          GestureDetector(
                            onTap: (){
                              Fluttertoast.showToast(msg: 'Signup with facebook', toastLength: Toast.LENGTH_SHORT);
                            },
                            child: Image(
                              image: AssetImage('assets/images/facebook.png'),
                              width: 40,
                            ),
                          ),
                          GestureDetector(
                            onTap: (){
                              Fluttertoast.showToast(msg: 'Signup with twitter', toastLength: Toast.LENGTH_SHORT);
                            },
                            child: Image(
                              image: AssetImage('assets/images/twitter.png'),
                              width: 40,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "ALREADY HAVE AN ACCOUNT?  ",
                          style: TextStyle(
                              fontSize: 11,
                              color: Colors.grey,
                              fontWeight: FontWeight.w500),
                        ),
                        GestureDetector(
                          onTap: () {
                            Fluttertoast.showToast(msg: 'Click signin', toastLength: Toast.LENGTH_SHORT);
                          },
                          child: Text(
                            "SIGN IN",
                            style: TextStyle(
                                fontSize: 11,
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
