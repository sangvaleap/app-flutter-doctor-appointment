import 'package:doctor_app/config/constant.dart';
import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:doctor_app/ui/widget/popup_menu_button/popup_menu_button1.dart';
import 'package:doctor_app/ui/widget/popup_menu_button/popup_menu_button2.dart';
import 'package:doctor_app/ui/widget/popup_menu_button/popup_menu_button3.dart';
import 'package:doctor_app/ui/widget/popup_menu_button/popup_menu_button4.dart';
import 'package:doctor_app/ui/widget/popup_menu_button/popup_menu_button5.dart';
import 'package:doctor_app/ui/widget/popup_menu_button/popup_menu_button6.dart';
import 'package:doctor_app/ui/widget/popup_menu_button/popup_menu_button7.dart';
import 'package:flutter/material.dart';

class PopupMenuButtonListPage extends StatefulWidget {
  @override
  _PopupMenuButtonListPageState createState() => _PopupMenuButtonListPageState();
}

class _PopupMenuButtonListPageState extends State<PopupMenuButtonListPage> {
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
              child: Text('Popup Menu Button', style: TextStyle(
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
                        child: Text('Displays a menu when pressed and calls onSelected when the menu is dismissed because an item was selected. The value passed to onSelected is the value of the selected menu item.', style: TextStyle(
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
            _globalWidget.screenDetailList(context: context, title: 'Popup Menu Button 1 - Standart', page: PopupMenuButton1Page()),
            _globalWidget.screenDetailList(context: context, title: 'Popup Menu Button 2 - Item Builder', page: PopupMenuButton2Page()),
            _globalWidget.screenDetailList(context: context, title: 'Popup Menu Button 3 - On Selected', page: PopupMenuButton3Page()),
            _globalWidget.screenDetailList(context: context, title: 'Popup Menu Button 4 - Elevation', page: PopupMenuButton4Page()),
            _globalWidget.screenDetailList(context: context, title: 'Popup Menu Button 5 - Child', page: PopupMenuButton5Page()),
            _globalWidget.screenDetailList(context: context, title: 'Popup Menu Button 6 - Offset', page: PopupMenuButton6Page()),
            _globalWidget.screenDetailList(context: context, title: 'Popup Menu Button 7 - AppBar', page: PopupMenuButton7Page()),
          ],
        )
    );
  }
}
