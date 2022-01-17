import 'package:doctor_app/config/constant.dart';
import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:doctor_app/ui/widget/column/horizontal_alignment_column.dart';
import 'package:doctor_app/ui/widget/column/standart_column.dart';
import 'package:doctor_app/ui/widget/column/vertical_alignment_column.dart';
import 'package:doctor_app/ui/widget/column/vertical_with_space_column.dart';
import 'package:flutter/material.dart';

class ColumnWidgetListPage extends StatefulWidget {
  @override
  _ColumnWidgetListPageState createState() => _ColumnWidgetListPageState();
}

class _ColumnWidgetListPageState extends State<ColumnWidgetListPage> {
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
              child: Text('Column Widget', style: TextStyle(
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
                        child: Text('Column Widget is used to stacking your data from top to bottom', style: TextStyle(
                            fontSize: 15, color: BLACK77,letterSpacing: 0.5
                        )),
                      )
                  ),
                  Flexible(
                      flex: 2,
                      child: Container(
                          alignment: Alignment.center,
                          child: Icon(Icons.table_rows, size: 50, color: SOFT_BLUE))
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
            _globalWidget.screenDetailList(context: context, title: 'Standart Column', page: StandartColumnPage()),
            _globalWidget.screenDetailList(context: context, title: 'Horizontal Alignment', page: HorizontalAlignmentColumnPage()),
            _globalWidget.screenDetailList(context: context, title: 'Vertical Alignment', page: VerticalAlignmentColumnPage()),
            _globalWidget.screenDetailList(context: context, title: 'Vertical with Space', page: VerticalWithSpaceColumnPage()),
          ],
        )
    );
  }
}
