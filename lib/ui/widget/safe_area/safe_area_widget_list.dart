import 'package:doctor_app/config/constant.dart';
import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:doctor_app/ui/widget/safe_area/setting_side_safe_area.dart';
import 'package:doctor_app/ui/widget/safe_area/with_safe_area.dart';
import 'package:doctor_app/ui/widget/safe_area/without_safe_area.dart';
import 'package:flutter/material.dart';

class SafeAreaWidgetListPage extends StatefulWidget {
  @override
  _SafeAreaWidgetListPageState createState() => _SafeAreaWidgetListPageState();
}

class _SafeAreaWidgetListPageState extends State<SafeAreaWidgetListPage> {
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
              child: Text('Safe Area Widget', style: TextStyle(
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
                        child: Text('A widget that insets its child by sufficient padding to avoid intrusions by the operating system. Only can be test on Android and iOS.', style: TextStyle(
                            fontSize: 15, color: BLACK77,letterSpacing: 0.5
                        )),
                      )
                  ),
                  Flexible(
                      flex: 2,
                      child: Container(
                          alignment: Alignment.center,
                          child: Icon(Icons.settings_overscan, size: 50, color: SOFT_BLUE))
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
            _globalWidget.screenDetailList(context: context, title: 'Without Safe Area', page: WithoutSafeAreaPage()),
            _globalWidget.screenDetailList(context: context, title: 'With Safe Area', page: WithSafeAreaPage()),
            _globalWidget.screenDetailList(context: context, title: 'Setting Side Only Top', page: SettingSidePage()),
          ],
        )
    );
  }
}
