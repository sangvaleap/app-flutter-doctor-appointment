import 'package:doctor_app/config/constant.dart';
import 'package:doctor_app/ui/feature/charts/bar_charts/bar_charts1.dart';
import 'package:doctor_app/ui/feature/charts/bar_charts/bar_charts10.dart';
import 'package:doctor_app/ui/feature/charts/bar_charts/bar_charts11.dart';
import 'package:doctor_app/ui/feature/charts/bar_charts/bar_charts2.dart';
import 'package:doctor_app/ui/feature/charts/bar_charts/bar_charts3.dart';
import 'package:doctor_app/ui/feature/charts/bar_charts/bar_charts4.dart';
import 'package:doctor_app/ui/feature/charts/bar_charts/bar_charts5.dart';
import 'package:doctor_app/ui/feature/charts/bar_charts/bar_charts6.dart';
import 'package:doctor_app/ui/feature/charts/bar_charts/bar_charts7.dart';
import 'package:doctor_app/ui/feature/charts/bar_charts/bar_charts8.dart';
import 'package:doctor_app/ui/feature/charts/bar_charts/bar_charts9.dart';
import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';

class BarChartsListPage extends StatefulWidget {
  @override
  _BarChartsListPageState createState() => _BarChartsListPageState();
}

class _BarChartsListPageState extends State<BarChartsListPage> {
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
              child: Text('Bar Charts List', style: TextStyle(
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
                        child: Text('Data visualization using bar charts', style: TextStyle(
                            fontSize: 15, color: BLACK77,letterSpacing: 0.5
                        )),
                      )
                  ),
                  Flexible(
                      flex: 2,
                      child: Container(
                          alignment: Alignment.center,
                          child: Icon(Icons.bar_chart, size: 50, color: SOFT_BLUE))
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
            _globalWidget.screenDetailList(context: context, title: 'Bar Charts 1 (Simple Bar Charts)', page: BarCharts1Page()),
            _globalWidget.screenDetailList(context: context, title: 'Bar Charts 2 (Custom Bar Charts)', page: BarCharts2Page()),
            _globalWidget.screenDetailList(context: context, title: 'Bar Charts 3 (Bar Charts with Label Inside)', page: BarCharts3Page()),
            _globalWidget.screenDetailList(context: context, title: 'Bar Charts 4 (Bar Charts with Color)', page: BarCharts4Page()),
            _globalWidget.screenDetailList(context: context, title: 'Bar Charts 5 (Remove Bottom Text)', page: BarCharts5Page()),
            _globalWidget.screenDetailList(context: context, title: 'Bar Charts 6 (Pattern Forward Hatch)', page: BarCharts6Page()),
            _globalWidget.screenDetailList(context: context, title: 'Bar Charts 7 (Simple Multi Data)', page: BarCharts7Page()),
            _globalWidget.screenDetailList(context: context, title: 'Bar Charts 8 (Multi Data with Legend)', page: BarCharts8Page()),
            _globalWidget.screenDetailList(context: context, title: 'Bar Charts 9 (Multi Data with Legend Options)', page: BarCharts9Page()),
            _globalWidget.screenDetailList(context: context, title: 'Bar Charts 10 (Multi Data with Legend and Value)', page: BarCharts10Page()),
            _globalWidget.screenDetailList(context: context, title: 'Bar Charts 11 (RTL)', page: BarCharts11Page()),
          ],
        )
    );
  }
}
