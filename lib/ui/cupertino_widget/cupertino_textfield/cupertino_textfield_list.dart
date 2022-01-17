import 'package:doctor_app/config/constant.dart';
import 'package:doctor_app/ui/cupertino_widget/cupertino_textfield/cupertino_textfield1.dart';
import 'package:doctor_app/ui/cupertino_widget/cupertino_textfield/cupertino_textfield2.dart';
import 'package:doctor_app/ui/cupertino_widget/cupertino_textfield/cupertino_textfield3.dart';
import 'package:doctor_app/ui/cupertino_widget/cupertino_textfield/cupertino_textfield4.dart';
import 'package:doctor_app/ui/cupertino_widget/cupertino_textfield/cupertino_textfield5.dart';
import 'package:doctor_app/ui/cupertino_widget/cupertino_textfield/cupertino_textfield6.dart';
import 'package:doctor_app/ui/cupertino_widget/cupertino_textfield/cupertino_textfield7.dart';
import 'package:doctor_app/ui/cupertino_widget/cupertino_textfield/cupertino_textfield8.dart';
import 'package:doctor_app/ui/cupertino_widget/cupertino_textfield/cupertino_textfield9.dart';
import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';

class CupertinoTextFieldListPage extends StatefulWidget {
  @override
  _CupertinoTextFieldListPageState createState() => _CupertinoTextFieldListPageState();
}

class _CupertinoTextFieldListPageState extends State<CupertinoTextFieldListPage> {
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
              child: Text('Cupertino Text Field', style: TextStyle(
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
                        child: Text('An iOS-style text field..', style: TextStyle(
                            fontSize: 15, color: BLACK77,letterSpacing: 0.5
                        )),
                      )
                  ),
                  Flexible(
                      flex: 2,
                      child: Container(
                          alignment: Alignment.center,
                          child: Icon(Icons.text_fields, size: 50, color: SOFT_BLUE))
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 48),
              child: Text('List', style: TextStyle(
                  fontSize: 18, color: BLACK21, fontWeight: FontWeight.w500
              )),
            ),
            SizedBox(height: 18),
            _globalWidget.screenDetailList(context: context, title: 'Cupertino Text Field 1 - Standart', page: CupertinoTextField1Page()),
            _globalWidget.screenDetailList(context: context, title: 'Cupertino Text Field 2 - Font Style', page: CupertinoTextField2Page()),
            _globalWidget.screenDetailList(context: context, title: 'Cupertino Text Field 3 - Placeholder', page: CupertinoTextField3Page()),
            _globalWidget.screenDetailList(context: context, title: 'Cupertino Text Field 4 - Decoration', page: CupertinoTextField4Page()),
            _globalWidget.screenDetailList(context: context, title: 'Cupertino Text Field 5 - Password', page: CupertinoTextField5Page()),
            _globalWidget.screenDetailList(context: context, title: 'Cupertino Text Field 6 - Keyboard Action', page: CupertinoTextField6Page()),
            _globalWidget.screenDetailList(context: context, title: 'Cupertino Text Field 7 - Keyboard Type', page: CupertinoTextField7Page()),
            _globalWidget.screenDetailList(context: context, title: 'Cupertino Text Field 8 - Multi Line', page: CupertinoTextField8Page()),
            _globalWidget.screenDetailList(context: context, title: 'Cupertino Text Field 9 - Icon & Controller', page: CupertinoTextField9Page()),
          ],
        )
    );
  }
}
