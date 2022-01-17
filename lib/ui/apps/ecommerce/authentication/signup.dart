import 'package:doctor_app/ui/apps/ecommerce/home.dart';
import 'package:flutter/material.dart';
import 'package:doctor_app/config/apps/ecommerce/constant.dart';
import 'package:doctor_app/config/apps/ecommerce/global_style.dart';

class SignupPage extends StatefulWidget {
  final bool fromList;

  const SignupPage({Key? key, this.fromList = false}) : super(key: key);

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  TextEditingController _etEmail = TextEditingController();
  TextEditingController _etName = TextEditingController();
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
    _etName.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: WillPopScope(
          onWillPop: (){
            FocusScope.of(context).unfocus();
            return Future.value(true);
          },
          child: ListView(
            padding: EdgeInsets.fromLTRB(30, 120, 30, 30),
            children: <Widget>[
              Center(
                  child: Image.asset('assets/images/apps/ecommerce/logo.png',
                      height: 32)),
              SizedBox(
                height: 80,
              ),
              Text('Sign Up', style: GlobalStyle.authTitle),
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
              TextFormField(
                keyboardType: TextInputType.text,
                controller: _etName,
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
                  labelText: 'Name',
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
                      if(!widget.fromList){
                        Navigator.pop(context);
                      }
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()));
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5.0),
                      child: Text(
                        'Register',
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
                height: 30,
              ),
              Center(
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                    FocusScope.of(context).unfocus();
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      GlobalStyle.iconBack,
                      Text(
                        ' Back to login',
                        style: GlobalStyle.back,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
