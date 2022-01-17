import 'package:doctor_app/config/constant.dart';
import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:doctor_app/ui/widget/tabbar/bottom_tabbar.dart';
import 'package:doctor_app/ui/widget/tabbar/standart_tabbar.dart';
import 'package:doctor_app/ui/widget/tabbar/tabbar_with_controller.dart';
import 'package:doctor_app/ui/widget/tabbar/tabbar_with_icon.dart';
import 'package:doctor_app/ui/widget/tabbar/tabbar_with_scroll.dart';
import 'package:flutter/material.dart';

class TabbarWidgetListPage extends StatefulWidget {
  @override
  _TabbarWidgetListPageState createState() => _TabbarWidgetListPageState();
}

class _TabbarWidgetListPageState extends State<TabbarWidgetListPage> {
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
              child: Text('TabBar Widget', style: TextStyle(
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
                        child: Text('TabBar Widget is used to create tab view', style: TextStyle(
                            fontSize: 15, color: BLACK77,letterSpacing: 0.5
                        )),
                      )
                  ),
                  Flexible(
                      flex: 2,
                      child: Container(
                          alignment: Alignment.center,
                          child: Icon(Icons.table_chart, size: 50, color: SOFT_BLUE))
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
            _globalWidget.screenDetailList(context: context, title: 'Standart TabBar', page: StandartTabbarPage()),
            _globalWidget.screenDetailList(context: context, title: 'TabBar with Icon', page: TabbarWithIconPage()),
            _globalWidget.screenDetailList(context: context, title: 'Bottom TabBar', page: BottomTabbarPage()),
            _globalWidget.screenDetailList(context: context, title: 'TabBar with Controller', page: TabbarWithControllerPage()),
            _globalWidget.screenDetailList(context: context, title: 'TabBar with Scroll', page: TabbarWithScrollPage()),
          ],
        )
    );
  }
}
