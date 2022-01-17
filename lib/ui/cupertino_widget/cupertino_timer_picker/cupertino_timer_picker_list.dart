import 'package:doctor_app/config/constant.dart';
import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:doctor_app/ui/cupertino_widget/cupertino_timer_picker/cupertino_timer_picker1.dart';
import 'package:doctor_app/ui/cupertino_widget/cupertino_timer_picker/cupertino_timer_picker2.dart';
import 'package:doctor_app/ui/cupertino_widget/cupertino_timer_picker/cupertino_timer_picker3.dart';
import 'package:flutter/material.dart';

class CupertinoTimerPickerListPage extends StatefulWidget {
  @override
  _CupertinoTimerPickerListPageState createState() => _CupertinoTimerPickerListPageState();
}

class _CupertinoTimerPickerListPageState extends State<CupertinoTimerPickerListPage> {
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
              child: Text('Cupertino Timer Picker', style: TextStyle(
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
                        child: Text('An iOS-style countdown timer picker.', style: TextStyle(
                            fontSize: 15, color: BLACK77,letterSpacing: 0.5
                        )),
                      )
                  ),
                  Flexible(
                      flex: 2,
                      child: Container(
                          alignment: Alignment.center,
                          child: Icon(Icons.access_time, size: 50, color: SOFT_BLUE))
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
            _globalWidget.screenDetailList(context: context, title: 'Cupertino Timer Picker 1 - Standart', page: CupertinoTimerPicker1Page()),
            _globalWidget.screenDetailList(context: context, title: 'Cupertino Timer Picker 2 - Interval', page: CupertinoTimerPicker2Page()),
            _globalWidget.screenDetailList(context: context, title: 'Cupertino Timer Picker 3 - with Dialog', page: CupertinoTimerPicker3Page()),
          ],
        )
    );
  }
}
