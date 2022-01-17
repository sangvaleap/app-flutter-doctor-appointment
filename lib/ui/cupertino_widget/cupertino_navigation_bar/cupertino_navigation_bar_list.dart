import 'package:doctor_app/config/constant.dart';
import 'package:doctor_app/ui/cupertino_widget/cupertino_navigation_bar/cupertino_navigation_bar1.dart';
import 'package:doctor_app/ui/cupertino_widget/cupertino_navigation_bar/cupertino_navigation_bar2.dart';
import 'package:doctor_app/ui/cupertino_widget/cupertino_navigation_bar/cupertino_navigation_bar3.dart';
import 'package:doctor_app/ui/cupertino_widget/cupertino_navigation_bar/cupertino_navigation_bar4.dart';
import 'package:doctor_app/ui/cupertino_widget/cupertino_navigation_bar/cupertino_navigation_bar5.dart';
import 'package:doctor_app/ui/cupertino_widget/cupertino_navigation_bar/cupertino_navigation_bar6.dart';
import 'package:doctor_app/ui/cupertino_widget/cupertino_navigation_bar/cupertino_navigation_bar7.dart';
import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';

class CupertinoNavigationBarListPage extends StatefulWidget {
  @override
  _CupertinoNavigationBarListPageState createState() => _CupertinoNavigationBarListPageState();
}

class _CupertinoNavigationBarListPageState extends State<CupertinoNavigationBarListPage> {
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
              child: Text('Cupertino Navigation Bar', style: TextStyle(
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
                        child: Text('An iOS-style top navigation bar. Typically used with CupertinoPageScaffold.', style: TextStyle(
                            fontSize: 15, color: BLACK77,letterSpacing: 0.5
                        )),
                      )
                  ),
                  Flexible(
                      flex: 2,
                      child: Container(
                          alignment: Alignment.center,
                          child: Icon(Icons.menu, size: 50, color: SOFT_BLUE))
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
            _globalWidget.screenDetailList(context: context, title: 'Cupertino Navigation Bar 1 - Standart', page: CupertinoNavigationBar1Page()),
            _globalWidget.screenDetailList(context: context, title: 'Cupertino Navigation Bar 2 - Trailing', page: CupertinoNavigationBar2Page()),
            _globalWidget.screenDetailList(context: context, title: 'Cupertino Navigation Bar 3 - Trailing Icon', page: CupertinoNavigationBar3Page()),
            _globalWidget.screenDetailList(context: context, title: 'Cupertino Navigation Bar 4 - Leading Title', page: CupertinoNavigationBar4Page()),
            _globalWidget.screenDetailList(context: context, title: 'Cupertino Navigation Bar 5 - Leading Icon', page: CupertinoNavigationBar5Page()),
            _globalWidget.screenDetailList(context: context, title: 'Cupertino Navigation Bar 6 - Multi Icon', page: CupertinoNavigationBar6Page()),
            _globalWidget.screenDetailList(context: context, title: 'Cupertino Navigation Bar 7 - Background Color', page: CupertinoNavigationBar7Page()),
          ],
        )
    );
  }
}
