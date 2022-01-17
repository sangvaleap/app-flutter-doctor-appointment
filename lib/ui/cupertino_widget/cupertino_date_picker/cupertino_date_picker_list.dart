import 'package:doctor_app/config/constant.dart';
import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:doctor_app/ui/cupertino_widget/cupertino_date_picker/cupertino_date_picker1.dart';
import 'package:doctor_app/ui/cupertino_widget/cupertino_date_picker/cupertino_date_picker2.dart';
import 'package:flutter/material.dart';

class CupertinoDatePickerListPage extends StatefulWidget {
  @override
  _CupertinoDatePickerListPageState createState() => _CupertinoDatePickerListPageState();
}

class _CupertinoDatePickerListPageState extends State<CupertinoDatePickerListPage> {
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
              child: Text('Cupertino Date Picker', style: TextStyle(
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
                        child: Text('An iOS-style date picker.', style: TextStyle(
                            fontSize: 15, color: BLACK77,letterSpacing: 0.5
                        )),
                      )
                  ),
                  Flexible(
                      flex: 2,
                      child: Container(
                          alignment: Alignment.center,
                          child: Icon(Icons.date_range, size: 50, color: SOFT_BLUE))
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
            _globalWidget.screenDetailList(context: context, title: 'Cupertino Date Picker 1 - Standart', page: CupertinoDatePicker1Page()),
            _globalWidget.screenDetailList(context: context, title: 'Cupertino Date Picker 2 - with Dialog', page: CupertinoDatePicker2Page()),
          ],
        )
    );
  }
}
