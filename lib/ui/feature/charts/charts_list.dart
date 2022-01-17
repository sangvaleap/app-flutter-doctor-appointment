import 'package:doctor_app/config/constant.dart';
import 'package:doctor_app/ui/feature/charts/bar_charts/bar_charts_list.dart';
import 'package:doctor_app/ui/feature/charts/pie_charts/pie_charts_list.dart';
import 'package:doctor_app/ui/feature/charts/time_series_charts/time_series_charts_list.dart';
import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';

class ChartsListPage extends StatefulWidget {
  @override
  _ChartsListPageState createState() => _ChartsListPageState();
}

class _ChartsListPageState extends State<ChartsListPage> {
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
              child: Text('Charts List', style: TextStyle(
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
                        child: Text('Choose charts type', style: TextStyle(
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
            _globalWidget.screenDetailList(context: context, title: 'Bar Charts', page: BarChartsListPage()),
            _globalWidget.screenDetailList(context: context, title: 'Pie Charts', page: PieChartsListPage()),
            _globalWidget.screenDetailList(context: context, title: 'Time Series Charts', page: TimeSeriesChartsListPage()),
          ],
        )
    );
  }
}
