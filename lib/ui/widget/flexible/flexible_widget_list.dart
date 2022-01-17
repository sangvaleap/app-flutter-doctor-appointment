import 'package:doctor_app/config/constant.dart';
import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:doctor_app/ui/widget/flexible/flexible_column.dart';
import 'package:doctor_app/ui/widget/flexible/flexible_row.dart';
import 'package:flutter/material.dart';

class FlexibleWidgetListPage extends StatefulWidget {
  @override
  _FlexibleWidgetListPageState createState() => _FlexibleWidgetListPageState();
}

class _FlexibleWidgetListPageState extends State<FlexibleWidgetListPage> {
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
              child: Text('Flexible Widget', style: TextStyle(
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
                        child: Text('Flexible Widget used to divider with flex value', style: TextStyle(
                            fontSize: 15, color: BLACK77,letterSpacing: 0.5
                        )),
                      )
                  ),
                  Flexible(
                      flex: 1,
                      child: Container(
                          alignment: Alignment.center,
                          child: Icon(Icons.view_array, size: 50, color: SOFT_BLUE))
                  ),
                  Flexible(
                      flex: 1,
                      child: Container(
                          alignment: Alignment.center,
                          child: Icon(Icons.view_day, size: 40, color: SOFT_BLUE))
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
            _globalWidget.screenDetailList(context: context, title: 'Flexible Row', page: FlexibleRowPage()),
            _globalWidget.screenDetailList(context: context, title: 'Flexible Column', page: FlexibleColumnPage()),
          ],
        )
    );
  }
}
