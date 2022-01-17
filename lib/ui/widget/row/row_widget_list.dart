import 'package:doctor_app/config/constant.dart';
import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:doctor_app/ui/widget/row/horizontal_alignment_row.dart';
import 'package:doctor_app/ui/widget/row/horizontal_with_space_row.dart';
import 'package:doctor_app/ui/widget/row/standart_row.dart';
import 'package:doctor_app/ui/widget/row/vertical_alignment_row.dart';
import 'package:flutter/material.dart';

class RowWidgetListPage extends StatefulWidget {
  @override
  _RowWidgetListPageState createState() => _RowWidgetListPageState();
}

class _RowWidgetListPageState extends State<RowWidgetListPage> {
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
              child: Text('Row Widget', style: TextStyle(
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
                        child: Text('Column Widget is used to stacking your data from left to right', style: TextStyle(
                            fontSize: 15, color: BLACK77,letterSpacing: 0.5
                        )),
                      )
                  ),
                  Flexible(
                      flex: 2,
                      child: Container(
                          alignment: Alignment.center,
                          child: Icon(Icons.view_column, size: 50, color: SOFT_BLUE))
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
            _globalWidget.screenDetailList(context: context, title: 'Standart Row', page: StandartRowPage()),
            _globalWidget.screenDetailList(context: context, title: 'Horizontal Alignment', page: HorizontalAlignmentRowPage()),
            _globalWidget.screenDetailList(context: context, title: 'Horizontal with Space', page: HorizontalWithSpaceRowPage()),
            _globalWidget.screenDetailList(context: context, title: 'Vertical Alignment', page: VerticalAlignmentRowPage()),
          ],
        )
    );
  }
}
