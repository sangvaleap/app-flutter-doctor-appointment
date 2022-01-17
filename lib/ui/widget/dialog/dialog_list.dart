import 'package:doctor_app/config/constant.dart';
import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:doctor_app/ui/widget/dialog/alert_dialog.dart';
import 'package:doctor_app/ui/widget/dialog/custom_dialog.dart';
import 'package:doctor_app/ui/widget/dialog/simple_dialog.dart';
import 'package:doctor_app/ui/widget/dialog/standart_dialog.dart';
import 'package:flutter/material.dart';

class DialogListPage extends StatefulWidget {
  @override
  _DialogListPageState createState() => _DialogListPageState();
}

class _DialogListPageState extends State<DialogListPage> {
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
              child: Text('Dialog', style: TextStyle(
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
                        child: Text('Dialog is used to show popup.', style: TextStyle(
                            fontSize: 15, color: BLACK77,letterSpacing: 0.5
                        )),
                      )
                  ),
                  Flexible(
                      flex: 2,
                      child: Container(
                          alignment: Alignment.center,
                          child: Icon(Icons.event, size: 50, color: SOFT_BLUE))
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
            _globalWidget.screenDetailList(context: context, title: 'Standart Dialog', page: StandartDialogPage()),
            _globalWidget.screenDetailList(context: context, title: 'Simple Dialog', page: SimpleDialogPage()),
            _globalWidget.screenDetailList(context: context, title: 'Alert Dialog', page: AlertDialogPage()),
            _globalWidget.screenDetailList(context: context, title: 'Custom Dialog', page: CustomDialogPage()),
          ],
        )
    );
  }
}
