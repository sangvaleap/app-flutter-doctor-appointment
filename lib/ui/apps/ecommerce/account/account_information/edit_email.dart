/*
This is edit email page

include file in reuseable/global_function.dart to call function from GlobalFunction
include file in reuseable/global_widget.dart to call function from GlobalWidget
 */

import 'package:doctor_app/config/apps/ecommerce/constant.dart';
import 'package:doctor_app/config/apps/ecommerce/global_style.dart';
import 'package:doctor_app/ui/apps/ecommerce/reusable_widget.dart';
import 'package:doctor_app/ui/reusable/global_function.dart';
import 'package:flutter/material.dart';

class EditEmailPage extends StatefulWidget {
  @override
  _EditEmailPageState createState() => _EditEmailPageState();
}

class _EditEmailPageState extends State<EditEmailPage> {
  // initialize reusable widget and global function
  final _reusableWidget = ReusableWidget();
  final _globalFunction = GlobalFunction();

  TextEditingController _etEmail = TextEditingController();
  bool _buttonDisabled = true;

  @override
  void initState() {
    _etEmail = TextEditingController(text: 'robert.steven@ijteknologi.com');

    if(_globalFunction.validateEmail(_etEmail.text)){
      _buttonDisabled = false;
    } else {
      _buttonDisabled = true;
    }
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
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: GlobalStyle.appBarIconThemeColor,
          ),
          elevation: GlobalStyle.appBarElevation,
          title: Text(
            'Edit Email',
            style: GlobalStyle.appBarTitle,
          ),
          backgroundColor: GlobalStyle.appBarBackgroundColor,
          systemOverlayStyle: GlobalStyle.appBarSystemOverlayStyle,
          bottom: _reusableWidget.bottomAppBar(),
        ),
        body: ListView(
          padding: EdgeInsets.all(16),
          children: [
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              controller: _etEmail,
              style: TextStyle(color: CHARCOAL),
              onChanged: (textValue) {
                setState(() {
                  if(_globalFunction.validateEmail(textValue)){
                    _buttonDisabled = false;
                  } else {
                    _buttonDisabled = true;
                  }
                });
              },
              decoration: InputDecoration(
                  focusedBorder: UnderlineInputBorder(
                      borderSide:
                      BorderSide(color: PRIMARY_COLOR, width: 2.0)),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFFCCCCCC)),
                  ),
                  labelText: 'Email',
                  labelStyle: TextStyle(color: BLACK_GREY)),
            ),
            SizedBox(
              height: 40,
            ),
            Container(
                child: TextButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith<Color>(
                            (Set<MaterialState> states) => states.contains(MaterialState.disabled) ? Colors.grey[300]! : _buttonDisabled?Colors.grey[300]!:PRIMARY_COLOR,
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
                        _reusableWidget.startLoading(context, 'Edit Email Success', 1);
                        FocusScope.of(context).unfocus();
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5.0),
                      child: Text(
                        'Save',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: _buttonDisabled?Colors.grey[600]:Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    )
                )
            ),
          ],
        )
    );
  }
}
