import 'package:doctor_app/config/constant.dart';
import 'package:doctor_app/ui/feature/indicator/circle_indicator/circle_indicator_list.dart';
import 'package:doctor_app/ui/feature/indicator/linear_indicator/linear_indicator_list.dart';
import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';

class IndicatorListPage extends StatefulWidget {
  @override
  _IndicatorListPageState createState() => _IndicatorListPageState();
}

class _IndicatorListPageState extends State<IndicatorListPage> {
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
              child: Text('Indicator', style: TextStyle(
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
                        child: Text('Indicators with Circle and Linear.', style: TextStyle(
                            fontSize: 15, color: BLACK77,letterSpacing: 0.5
                        )),
                      )
                  ),
                  Flexible(
                      flex: 2,
                      child: Container(
                          alignment: Alignment.center,
                          child: Icon(Icons.adjust, size: 50, color: SOFT_BLUE))
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
            _globalWidget.screenDetailList(context: context, title: 'Circle Indicator', page: CircleIndicatorListPage()),
            _globalWidget.screenDetailList(context: context, title: 'Linear Indicator', page: LinearIndicatorListPage()),
          ],
        )
    );
  }
}
