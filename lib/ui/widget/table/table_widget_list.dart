import 'package:doctor_app/config/constant.dart';
import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:doctor_app/ui/widget/table/standart_table.dart';
import 'package:doctor_app/ui/widget/table/table_border.dart';
import 'package:doctor_app/ui/widget/table/table_width.dart';
import 'package:flutter/material.dart';

class TableWidgetListPage extends StatefulWidget {
  @override
  _TableWidgetListPageState createState() => _TableWidgetListPageState();
}

class _TableWidgetListPageState extends State<TableWidgetListPage> {
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
              child: Text('Table Widget', style: TextStyle(
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
                        child: Text('A widget that uses the table layout algorithm for its children.', style: TextStyle(
                            fontSize: 15, color: BLACK77,letterSpacing: 0.5
                        )),
                      )
                  ),
                  Flexible(
                      flex: 2,
                      child: Container(
                          alignment: Alignment.center,
                          child: Icon(Icons.border_all, size: 50, color: SOFT_BLUE))
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
            _globalWidget.screenDetailList(context: context, title: 'Standart Table', page: StandartTablePage()),
            _globalWidget.screenDetailList(context: context, title: 'Table Border', page: TableBorderPage()),
            _globalWidget.screenDetailList(context: context, title: 'Table Width', page: TableWidthPage()),
          ],
        )
    );
  }
}
