import 'package:doctor_app/config/constant.dart';
import 'package:doctor_app/ui/cupertino_widget/cupertino_switch/cupertino_switch1.dart';
import 'package:doctor_app/ui/cupertino_widget/cupertino_switch/cupertino_switch2.dart';
import 'package:doctor_app/ui/cupertino_widget/cupertino_switch/cupertino_switch3.dart';
import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';

class CupertinoSwitchListPage extends StatefulWidget {
  @override
  _CupertinoSwitchListPageState createState() => _CupertinoSwitchListPageState();
}

class _CupertinoSwitchListPageState extends State<CupertinoSwitchListPage> {
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
              child: Text('Cupertino Switch', style: TextStyle(
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
                        child: Text('An iOS-style switch. Used to toggle the on/off state of a single setting.', style: TextStyle(
                            fontSize: 15, color: BLACK77,letterSpacing: 0.5
                        )),
                      )
                  ),
                  Flexible(
                      flex: 2,
                      child: Container(
                          alignment: Alignment.center,
                          child: Icon(Icons.toggle_off, size: 50, color: SOFT_BLUE))
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
            _globalWidget.screenDetailList(context: context, title: 'Cupertino Switch 1 - Standart', page: CupertinoSwitch1Page()),
            _globalWidget.screenDetailList(context: context, title: 'Cupertino Switch 2 - with ListTile', page: CupertinoSwitch2Page()),
            _globalWidget.screenDetailList(context: context, title: 'Cupertino Switch 3 - Properties', page: CupertinoSwitch3Page()),
          ],
        )
    );
  }
}
