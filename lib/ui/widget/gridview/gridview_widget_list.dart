import 'package:doctor_app/config/constant.dart';
import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:doctor_app/ui/widget/gridview/gridview_height.dart';
import 'package:doctor_app/ui/widget/gridview/gridview_with_builder.dart';
import 'package:doctor_app/ui/widget/gridview/gridview_with_count.dart';
import 'package:doctor_app/ui/widget/gridview/gridview_with_extent.dart';
import 'package:flutter/material.dart';

class GridviewWidgetListPage extends StatefulWidget {
  @override
  _GridviewWidgetListPageState createState() => _GridviewWidgetListPageState();
}

class _GridviewWidgetListPageState extends State<GridviewWidgetListPage> {
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
              child: Text('GridView Widget', style: TextStyle(
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
                        child: Text('GridView Widget is used to create layout with grid', style: TextStyle(
                            fontSize: 15, color: BLACK77,letterSpacing: 0.5
                        )),
                      )
                  ),
                  Flexible(
                      flex: 2,
                      child: Container(
                          alignment: Alignment.center,
                          child: Icon(Icons.grid_on, size: 50, color: SOFT_BLUE))
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
            _globalWidget.screenDetailList(context: context, title: 'GridView with count', page: GridviewWithCountPage()),
            _globalWidget.screenDetailList(context: context, title: 'GridView with builder', page: GridviewWithBuilderPage()),
            _globalWidget.screenDetailList(context: context, title: 'GridView with extent', page: GridviewWithExtentPage()),
            _globalWidget.screenDetailList(context: context, title: 'GridView height', page: GridviewHeightPage()),
          ],
        )
    );
  }
}
