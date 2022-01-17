import 'package:doctor_app/config/constant.dart';
import 'package:doctor_app/ui/feature/charts/pie_charts/pie_charts1.dart';
import 'package:doctor_app/ui/feature/charts/pie_charts/pie_charts2.dart';
import 'package:doctor_app/ui/feature/charts/pie_charts/pie_charts3.dart';
import 'package:doctor_app/ui/feature/charts/pie_charts/pie_charts4.dart';
import 'package:doctor_app/ui/feature/charts/pie_charts/pie_charts5.dart';
import 'package:doctor_app/ui/feature/charts/pie_charts/pie_charts6.dart';
import 'package:doctor_app/ui/feature/charts/pie_charts/pie_charts7.dart';
import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';

class PieChartsListPage extends StatefulWidget {
  @override
  _PieChartsListPageState createState() => _PieChartsListPageState();
}

class _PieChartsListPageState extends State<PieChartsListPage> {
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
              child: Text('Pie Charts List', style: TextStyle(
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
                        child: Text('Data visualization using pie charts', style: TextStyle(
                            fontSize: 15, color: BLACK77,letterSpacing: 0.5
                        )),
                      )
                  ),
                  Flexible(
                      flex: 2,
                      child: Container(
                          alignment: Alignment.center,
                          child: Icon(Icons.pie_chart, size: 50, color: SOFT_BLUE))
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
            _globalWidget.screenDetailList(context: context, title: 'Pie Charts 1 (Simple Pie Charts)', page: PieCharts1Page()),
            _globalWidget.screenDetailList(context: context, title: 'Pie Charts 2 (Custom Pie Charts)', page: PieCharts2Page()),
            _globalWidget.screenDetailList(context: context, title: 'Pie Charts 3 (Pie Charts with Color)', page: PieCharts3Page()),
            _globalWidget.screenDetailList(context: context, title: 'Pie Charts 4 (Donut)', page: PieCharts4Page()),
            _globalWidget.screenDetailList(context: context, title: 'Pie Charts 5 (Pie Charts with Legend)', page: PieCharts5Page()),
            _globalWidget.screenDetailList(context: context, title: 'Pie Charts 6 (Pie Charts with Legend Options)', page: PieCharts6Page()),
            _globalWidget.screenDetailList(context: context, title: 'Pie Charts 7 (Pie Charts with Value at Legend)', page: PieCharts7Page()),
          ],
        )
    );
  }
}
