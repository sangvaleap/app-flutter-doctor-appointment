import 'package:doctor_app/config/apps/ecommerce/global_style.dart';
import 'package:doctor_app/ui/apps/ecommerce/authentication/forgot_password.dart';
import 'package:doctor_app/ui/apps/ecommerce/home.dart';
import 'package:doctor_app/ui/apps/ecommerce/authentication/signup.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:doctor_app/config/apps/ecommerce/constant.dart';

class SigninPage extends StatefulWidget {
  @override
  _SigninPageState createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  TextEditingController _etEmail = TextEditingController();
  bool _obscureText = true;
  IconData _iconVisible = Icons.visibility_off;

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
    super.initState();
  }

  @override
  void dispose() {
    _etEmail.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
          padding: EdgeInsets.fromLTRB(30, 120, 30, 30),
          children: <Widget>[
            Center(
                child: Image.asset('assets/images/apps/ecommerce/logo.png',
                    height: 32)),
            SizedBox(
              height: 80,
            ),
            Text('Sign In', style: GlobalStyle.authTitle),
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              controller: _etEmail,
              style: TextStyle(color: CHARCOAL),
              onChanged: (textValue) {
                setState(() {});
              },
              decoration: InputDecoration(
                focusedBorder: UnderlineInputBorder(
                    borderSide:
                    BorderSide(color: PRIMARY_COLOR, width: 2.0)),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFFCCCCCC)),
                ),
                labelText: 'Email',
                labelStyle: TextStyle(color: BLACK_GREY),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              obscureText: _obscureText,
              style: TextStyle(color: CHARCOAL),
              decoration: InputDecoration(
                focusedBorder: UnderlineInputBorder(
                    borderSide:
                    BorderSide(color: PRIMARY_COLOR, width: 2.0)),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFFCCCCCC)),
                ),
                labelText: 'Password',
                labelStyle: TextStyle(color: BLACK_GREY),
                suffixIcon: IconButton(
                    icon: Icon(_iconVisible, color: Colors.grey[400], size: 20),
                    onPressed: () {
                      _toggleObscureText();
                    }),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Align(
                alignment: Alignment.centerRight,
                child: Container(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ForgotPasswordPage()));
                      FocusScope.of(context).unfocus();
                    },
                    child: Text(
                      'Forgot Password?',
                      style: TextStyle(color: PRIMARY_COLOR, fontSize: 13),
                    ),
                  ),
                )),
            SizedBox(
              height: 40,
            ),
            Container(
              child: TextButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) => PRIMARY_COLOR,
                    ),
                    overlayColor: MaterialStateProperty.all(Colors.transparent),
                    shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(3.0),
                        )
                    ),
                  ),
                  onPressed: () {
                    //Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => HomePage()), (Route<dynamic> route) => false);
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()));
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5.0),
                    child: Text(
                      'Login',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  )
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Center(
              child: Text(
                'Or sign in with',
                style: GlobalStyle.authSignWith,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  GestureDetector(
                    onTap: (){
                      //Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => HomePage()), (Route<dynamic> route) => false);
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()));
                      Fluttertoast.showToast(
                          msg: 'Sign in with Google',
                          toastLength: Toast.LENGTH_LONG);
                    },
                    child: Image(
                      image: AssetImage("assets/images/google.png"), width: 40,),
                  ),
                  GestureDetector(
                    onTap: (){
                      //Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => HomePage()), (Route<dynamic> route) => false);
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()));
                      Fluttertoast.showToast(
                          msg: 'Sign in with Facebook',
                          toastLength: Toast.LENGTH_LONG);
                    },
                    child: Image(
                      image: AssetImage("assets/images/facebook.png"), width: 40,),
                  ),
                  GestureDetector(
                    onTap: (){
                      //Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => HomePage()), (Route<dynamic> route) => false);
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()));
                      Fluttertoast.showToast(
                          msg: 'Sign in with Twitter',
                          toastLength: Toast.LENGTH_LONG);
                    },
                    child: Image(
                      image: AssetImage("assets/images/twitter.png"), width: 40,),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => SignupPage()));
                  FocusScope.of(context).unfocus();
                },
                child: Wrap(
                  children: [
                    Text(
                      'No account yet? ',
                      style: GlobalStyle.authBottom1,
                    ),
                    Text(
                      'Create one',
                      style: GlobalStyle.authBottom2,
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Center(
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    GlobalStyle.iconBack,
                    Text(
                      ' Back',
                      style: GlobalStyle.back,
                    )
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
