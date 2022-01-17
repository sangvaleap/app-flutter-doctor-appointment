import 'package:doctor_app/config/constant.dart';
import 'package:doctor_app/ui/feature/bottom_sheet/bottom_sheet1.dart';
import 'package:doctor_app/ui/feature/bottom_sheet/bottom_sheet2.dart';
import 'package:doctor_app/ui/feature/bottom_sheet/bottom_sheet3.dart';
import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';

class BottomSheetListPage extends StatefulWidget {
  @override
  _BottomSheetListPageState createState() => _BottomSheetListPageState();
}

class _BottomSheetListPageState extends State<BottomSheetListPage> {
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
              child: Text('Bottom Sheet Featured', style: TextStyle(
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
                        child: Text('Bottom sheet for filtering, menu, choose, etc in application.', style: TextStyle(
                            fontSize: 15, color: BLACK77,letterSpacing: 0.5
                        )),
                      )
                  ),
                  Flexible(
                      flex: 2,
                      child: Container(
                          alignment: Alignment.center,
                          child: Icon(Icons.open_in_browser, size: 50, color: SOFT_BLUE))
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
            _globalWidget.screenDetailList(context: context, title: 'Bottom Sheet for Category', page: BottomSheet1Page()),
            _globalWidget.screenDetailList(context: context, title: 'Bottom Sheet for Filter', page: BottomSheet2Page()),
            _globalWidget.screenDetailList(context: context, title: 'Bottom Sheet for Choose', page: BottomSheet3Page()),
          ],
        )
    );
  }
}
