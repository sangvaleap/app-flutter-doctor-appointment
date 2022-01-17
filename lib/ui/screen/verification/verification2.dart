import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class Verification2Page extends StatefulWidget {
  @override
  _Verification2PageState createState() => _Verification2PageState();
}

class _Verification2PageState extends State<Verification2Page> {
  Color _color1 = Color(0xFF07ac12);
  Color _color2 = Color(0xFF515151);
  Color _color3 = Color(0xff777777);
  Color _color4 = Color(0xFFaaaaaa);

  bool _buttonDisabled = true;
  String _verificationCode = '';

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
        body: ListView(
          padding: EdgeInsets.fromLTRB(30, 120, 30, 30),
          children: <Widget>[
            Center(
                child: Icon(Icons.phone_android, color: _color1, size: 50)),
            SizedBox(height: 20),
            Center(
                child: Text(
                  'Enter the Verification Code',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: _color2
                  ),
                )),
            SizedBox(
              height: 20,
            ),
            Container(
              width: MediaQuery.of(context).size.width / 1.5,
              child: Text(
                'The verification code has been sent via sms to 0811888999',
                style: TextStyle(
                    fontSize: 13,
                    color: _color3
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 50),
              child: PinCodeTextField(
                autoFocus: true,
                appContext: context,
                keyboardType: TextInputType.number,
                length: 4,
                showCursor: false,
                obscureText: false,
                animationType: AnimationType.fade,
                pinTheme: PinTheme(
                    shape: PinCodeFieldShape.underline,
                    fieldHeight: 50,
                    fieldWidth: 40,
                    inactiveColor: _color4,
                    activeColor: _color1,
                    selectedColor: _color1
                ),
                animationDuration: Duration(milliseconds: 300),
                backgroundColor: Colors.transparent,
                onChanged: (value) {
                  setState(() {
                    if(value.length==4){
                      _buttonDisabled = false;
                    } else {
                      _buttonDisabled = true;
                    }
                    _verificationCode = value;
                  });
                },
                beforeTextPaste: (text) {
                  return false;
                },
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Container(
              child: SizedBox(
                  width: double.maxFinite,
                  child: TextButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.resolveWith<Color>(
                              (Set<MaterialState> states) => _buttonDisabled?Colors.grey[300]!:_color1,
                        ),
                        overlayColor: MaterialStateProperty.all(Colors.transparent),
                        shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(3.0),
                            )
                        ),
                      ),
                      onPressed: () {
                        if(!_buttonDisabled){
                          print(_verificationCode);
                          Fluttertoast.showToast(msg: 'Click verify : '+_verificationCode, toastLength: Toast.LENGTH_SHORT);
                          FocusScope.of(context).unfocus();
                        }
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5.0),
                        child: Text(
                          'Verify',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: _buttonDisabled?Colors.grey[600]:Colors.white),
                          textAlign: TextAlign.center,
                        ),
                      )
                  )
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Center(
              child: Wrap(
                children: [
                  Text(
                    "Didn't receive the code? ",
                    style: TextStyle(
                        fontSize: 13,
                        color: _color4
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      Fluttertoast.showToast(msg: 'Click resend', toastLength: Toast.LENGTH_SHORT);
                    },
                    child: Text(
                      'Resend',
                      style: TextStyle(
                          fontSize: 13,
                          color: _color1
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        )
    );
  }
}
