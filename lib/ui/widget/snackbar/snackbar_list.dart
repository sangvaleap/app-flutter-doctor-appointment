import 'package:doctor_app/config/constant.dart';
import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:doctor_app/ui/widget/snackbar/floating_snackbar.dart';
import 'package:doctor_app/ui/widget/snackbar/snackbar_color.dart';
import 'package:doctor_app/ui/widget/snackbar/snackbar_with_duration.dart';
import 'package:doctor_app/ui/widget/snackbar/snackbar_with_action.dart';
import 'package:doctor_app/ui/widget/snackbar/snackbar_with_margin.dart';
import 'package:doctor_app/ui/widget/snackbar/snackbar_with_shape.dart';
import 'package:doctor_app/ui/widget/snackbar/standart_snackbar.dart';
import 'package:flutter/material.dart';

class SnackbarListPage extends StatefulWidget {
  @override
  _SnackbarListPageState createState() => _SnackbarListPageState();
}

class _SnackbarListPageState extends State<SnackbarListPage> {
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
              child: Text('Snackbar', style: TextStyle(
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
                        child: Text('Snackbar used to show text.', style: TextStyle(
                            fontSize: 15, color: BLACK77,letterSpacing: 0.5
                        )),
                      )
                  ),
                  Flexible(
                      flex: 2,
                      child: Container(
                          alignment: Alignment.center,
                          child: Icon(Icons.video_label, size: 50, color: SOFT_BLUE))
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
            _globalWidget.screenDetailList(context: context, title: 'Standart Snackbar', page: StandartSnackbarPage()),
            _globalWidget.screenDetailList(context: context, title: 'Snackbar Color', page: SnackbarColorPage()),
            _globalWidget.screenDetailList(context: context, title: 'Snackbar with action', page: SnackbarWithActionPage()),
            _globalWidget.screenDetailList(context: context, title: 'Snackbar with duration', page: SnackbarWithDurationPage()),
            _globalWidget.screenDetailList(context: context, title: 'Floating snackbar', page: FloatingSnackbarPage()),
            _globalWidget.screenDetailList(context: context, title: 'Snackbar with margin', page: SnackbarWithMarginPage()),
            _globalWidget.screenDetailList(context: context, title: 'Snackbar with shape', page: SnackbarWithShapePage()),
          ],
        )
    );
  }
}
