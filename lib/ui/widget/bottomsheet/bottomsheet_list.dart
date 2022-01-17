import 'package:doctor_app/config/constant.dart';
import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:doctor_app/ui/widget/bottomsheet/bottomsheet_dragdown_to_dismiss.dart';
import 'package:doctor_app/ui/widget/bottomsheet/bottomsheet_with_shape.dart';
import 'package:doctor_app/ui/widget/bottomsheet/standart_bottomsheet.dart';
import 'package:flutter/material.dart';

class BottomsheetListPage extends StatefulWidget {
  @override
  _BottomsheetListPageState createState() => _BottomsheetListPageState();
}

class _BottomsheetListPageState extends State<BottomsheetListPage> {
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
              child: Text('BottomSheet', style: TextStyle(
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
                        child: Text('Bottom Sheet widget used to show some layout from the bottom', style: TextStyle(
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
            _globalWidget.screenDetailList(context: context, title: 'Standart BottomSheet', page: StandartBottomsheetPage()),
            _globalWidget.screenDetailList(context: context, title: 'BottomSheet with shape', page: BottomsheetWithShapePage()),
            _globalWidget.screenDetailList(context: context, title: 'BottomSheet dragdown to dismiss', page: BottomsheetDragdownToDismissPage()),
          ],
        )
    );
  }
}
