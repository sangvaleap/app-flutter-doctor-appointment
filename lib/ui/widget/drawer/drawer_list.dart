import 'package:doctor_app/config/constant.dart';
import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:doctor_app/ui/widget/drawer/drawer_custom_header.dart';
import 'package:doctor_app/ui/widget/drawer/drawer_custom_shape.dart';
import 'package:doctor_app/ui/widget/drawer/drawer_right.dart';
import 'package:doctor_app/ui/widget/drawer/standart_drawer.dart';
import 'package:flutter/material.dart';

class DrawerListPage extends StatefulWidget {
  @override
  _DrawerListPageState createState() => _DrawerListPageState();
}

class _DrawerListPageState extends State<DrawerListPage> {
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
              child: Text('Drawer', style: TextStyle(
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
                        child: Text('Drawer usually used for menu', style: TextStyle(
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
            _globalWidget.screenDetailList(context: context, title: 'Standart Drawer', page: StandartDrawerPage()),
            _globalWidget.screenDetailList(context: context, title: 'Drawer at the right', page: DrawerRightPage()),
            _globalWidget.screenDetailList(context: context, title: 'Drawer Custom Header', page: DrawerCustomHeaderPage()),
            _globalWidget.screenDetailList(context: context, title: 'Drawer Custom Shape', page: DrawerCustomShapePage()),
          ],
        )
    );
  }
}
