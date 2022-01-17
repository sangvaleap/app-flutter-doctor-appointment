import 'package:doctor_app/config/constant.dart';
import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:doctor_app/ui/cupertino_widget/cupertino_date_time_picker/dart/cupertino_date_time_picker1.dart';
import 'package:doctor_app/ui/cupertino_widget/cupertino_date_time_picker/dart/cupertino_date_time_picker2.dart';
import 'package:doctor_app/ui/cupertino_widget/cupertino_date_time_picker/dart/cupertino_date_time_picker3.dart';
import 'package:doctor_app/ui/cupertino_widget/cupertino_date_time_picker/dart/cupertino_date_time_picker4.dart';
import 'package:flutter/material.dart';

class CupertinoDateTimePickerListPage extends StatefulWidget {
  @override
  _CupertinoDateTimePickerListPageState createState() => _CupertinoDateTimePickerListPageState();
}

class _CupertinoDateTimePickerListPageState extends State<CupertinoDateTimePickerListPage> {
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
              child: Text('Cupertino Date & Time Picker', style: TextStyle(
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
                        child: Text('An iOS-style date & time picker.', style: TextStyle(
                            fontSize: 15, color: BLACK77,letterSpacing: 0.5
                        )),
                      )
                  ),
                  Flexible(
                      flex: 2,
                      child: Container(
                          alignment: Alignment.center,
                          child: Icon(Icons.date_range, size: 50, color: SOFT_BLUE))
                  ),
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
            _globalWidget.screenDetailList(context: context, title: 'Cupertino Date & Time Picker 1 - Standart', page: CupertinoDateTimePicker1Page()),
            _globalWidget.screenDetailList(context: context, title: 'Cupertino Date & Time Picker 2 - Time Format', page: CupertinoDateTimePicker2Page()),
            _globalWidget.screenDetailList(context: context, title: 'Cupertino Date & Time Picker 3 - Minimum & Maximum Date', page: CupertinoDateTimePicker3Page()),
            _globalWidget.screenDetailList(context: context, title: 'Cupertino Date & Time Picker 4 - with Dialog', page: CupertinoDateTimePicker4Page()),
          ],
        )
    );
  }
}
