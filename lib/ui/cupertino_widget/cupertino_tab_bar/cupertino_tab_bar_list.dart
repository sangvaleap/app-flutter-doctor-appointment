import 'package:doctor_app/config/constant.dart';
import 'package:doctor_app/ui/cupertino_widget/cupertino_tab_bar/cupertino_tab_bar1.dart';
import 'package:doctor_app/ui/cupertino_widget/cupertino_tab_bar/cupertino_tab_bar2.dart';
import 'package:doctor_app/ui/cupertino_widget/cupertino_tab_bar/cupertino_tab_bar3.dart';
import 'package:doctor_app/ui/cupertino_widget/cupertino_tab_bar/cupertino_tab_bar4.dart';
import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';

class CupertinoTabBarListPage extends StatefulWidget {
  @override
  _CupertinoTabBarListPageState createState() => _CupertinoTabBarListPageState();
}

class _CupertinoTabBarListPageState extends State<CupertinoTabBarListPage> {
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
              child: Text('Cupertino Tab Bar, Tab Scaffold & Tab View', style: TextStyle(
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
                        child: Text('An iOS-style bottom tab bar. Typically used with CupertinoTabScaffold. For Cupertino Tab View, you can check it at example 4.', style: TextStyle(
                            fontSize: 15, color: BLACK77,letterSpacing: 0.5
                        )),
                      )
                  ),
                  Flexible(
                      flex: 2,
                      child: Container(
                          alignment: Alignment.center,
                          child: Icon(Icons.call_to_action, size: 50, color: SOFT_BLUE))
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
            _globalWidget.screenDetailList(context: context, title: 'Cupertino Tab Bar 1 - Standart', page: CupertinoTabBar1Page()),
            _globalWidget.screenDetailList(context: context, title: 'Cupertino Tab Bar 2 - Properties', page: CupertinoTabBar2Page()),
            _globalWidget.screenDetailList(context: context, title: 'Cupertino Tab Bar 3 - New Route', page: CupertinoTabBar3Page()),
            _globalWidget.screenDetailList(context: context, title: 'Cupertino Tab Bar 4 - Flat Navigation', page: CupertinoTabBar4Page()),
          ],
        )
    );
  }
}
