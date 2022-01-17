import 'package:doctor_app/config/constant.dart';
import 'package:doctor_app/ui/feature/charts/time_series_charts/time_series_charts1.dart';
import 'package:doctor_app/ui/feature/charts/time_series_charts/time_series_charts2.dart';
import 'package:doctor_app/ui/feature/charts/time_series_charts/time_series_charts9.dart';
import 'package:doctor_app/ui/feature/charts/time_series_charts/time_series_charts3.dart';
import 'package:doctor_app/ui/feature/charts/time_series_charts/time_series_charts4.dart';
import 'package:doctor_app/ui/feature/charts/time_series_charts/time_series_charts5.dart';
import 'package:doctor_app/ui/feature/charts/time_series_charts/time_series_charts6.dart';
import 'package:doctor_app/ui/feature/charts/time_series_charts/time_series_charts7.dart';
import 'package:doctor_app/ui/feature/charts/time_series_charts/time_series_charts8.dart';
import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';

class TimeSeriesChartsListPage extends StatefulWidget {
  @override
  _TimeSeriesChartsListPageState createState() => _TimeSeriesChartsListPageState();
}

class _TimeSeriesChartsListPageState extends State<TimeSeriesChartsListPage> {
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
              child: Text('Time Series Charts List', style: TextStyle(
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
                        child: Text('Data visualization using time series charts', style: TextStyle(
                            fontSize: 15, color: BLACK77,letterSpacing: 0.5
                        )),
                      )
                  ),
                  Flexible(
                      flex: 2,
                      child: Container(
                          alignment: Alignment.center,
                          child: Icon(Icons.show_chart, size: 50, color: SOFT_BLUE))
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
            _globalWidget.screenDetailList(context: context, title: 'Time Series Charts 1 (Simple Time Series Charts)', page: TimeSeriesCharts1Page()),
            _globalWidget.screenDetailList(context: context, title: 'Time Series Charts 2 (Time Series Charts - Start from Minimal Value)', page: TimeSeriesCharts2Page()),
            _globalWidget.screenDetailList(context: context, title: 'Time Series Charts 3 (Time Series Charts - Margin Left)', page: TimeSeriesCharts3Page()),
            _globalWidget.screenDetailList(context: context, title: 'Time Series Charts 4 (Time Series Charts - Change Line Color and Thickness)', page: TimeSeriesCharts4Page()),
            _globalWidget.screenDetailList(context: context, title: 'Time Series Charts 5 (Time Series Charts - Area Color)', page: TimeSeriesCharts5Page()),
            _globalWidget.screenDetailList(context: context, title: 'Time Series Charts 6 (Time Series Charts - Show Points)', page: TimeSeriesCharts6Page()),
            _globalWidget.screenDetailList(context: context, title: 'Time Series Charts 7 (Time Series Charts - Highlight On Select)', page: TimeSeriesCharts7Page()),
            _globalWidget.screenDetailList(context: context, title: 'Time Series Charts 8 (Time Series Charts - Selection Callback)', page: TimeSeriesCharts8Page()),
            _globalWidget.screenDetailList(context: context, title: 'Time Series Charts 9 (Time Series Charts with Bar)', page: TimeSeriesCharts9Page()),
          ],
        )
    );
  }
}
