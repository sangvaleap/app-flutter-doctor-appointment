import 'package:doctor_app/config/constant.dart';
import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:doctor_app/ui/cupertino_widget/cupertino_context_menu/cupertino_context_menu1.dart';
import 'package:doctor_app/ui/cupertino_widget/cupertino_context_menu/cupertino_context_menu2.dart';
import 'package:doctor_app/ui/cupertino_widget/cupertino_context_menu/cupertino_context_menu3.dart';
import 'package:doctor_app/ui/cupertino_widget/cupertino_context_menu/cupertino_context_menu4.dart';
import 'package:flutter/material.dart';

class CupertinoContextMenuListPage extends StatefulWidget {
  @override
  _CupertinoContextMenuListPageState createState() => _CupertinoContextMenuListPageState();
}

class _CupertinoContextMenuListPageState extends State<CupertinoContextMenuListPage> {
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
              child: Text('Cupertino Context Menu', style: TextStyle(
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
                        child: Text('An iOS-style full-screen modal route that opens when the child is long-pressed. Used to display relevant actions for your content.', style: TextStyle(
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
            _globalWidget.screenDetailList(context: context, title: 'Cupertino Context Menu 1 - Standart', page: CupertinoContextMenu1Page()),
            _globalWidget.screenDetailList(context: context, title: 'Cupertino Context Menu 2 - Image', page: CupertinoContextMenu2Page()),
            _globalWidget.screenDetailList(context: context, title: 'Cupertino Context Menu 3 - Change Preview when Long Press', page: CupertinoContextMenu3Page()),
            _globalWidget.screenDetailList(context: context, title: 'Cupertino Context Menu 4 - Change Preview Size when Long Press', page: CupertinoContextMenu4Page()),
          ],
        )
    );
  }
}
