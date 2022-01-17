import 'package:doctor_app/model/feature/stock_model.dart';
import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class TimeSeriesCharts3Page extends StatefulWidget {
  @override
  _TimeSeriesCharts3PageState createState() => _TimeSeriesCharts3PageState();
}

class _TimeSeriesCharts3PageState extends State<TimeSeriesCharts3Page> {
  // initialize global widget
  final _globalWidget = GlobalWidget();

  final List<Stock> _data = [
    Stock(DateTime(2021, 8, 1), 960),
    Stock(DateTime(2021, 8, 2), 935),
    Stock(DateTime(2021, 8, 3), 890),
    Stock(DateTime(2021, 8, 4), 856),
    Stock(DateTime(2021, 8, 5), 913),
    Stock(DateTime(2021, 8, 6), 943),
    Stock(DateTime(2021, 8, 7), 960),
    Stock(DateTime(2021, 8, 8), 998),
    Stock(DateTime(2021, 8, 9), 987),
    Stock(DateTime(2021, 8, 10), 1012),
    Stock(DateTime(2021, 8, 11), 1031),
    Stock(DateTime(2021, 8, 12), 1100),
    Stock(DateTime(2021, 8, 13), 1113),
    Stock(DateTime(2021, 8, 14), 1204),
    Stock(DateTime(2021, 8, 15), 1311),
    Stock(DateTime(2021, 8, 16), 1344),
    Stock(DateTime(2021, 8, 17), 1277),
    Stock(DateTime(2021, 8, 18), 1320),
    Stock(DateTime(2021, 8, 19), 1400),
    Stock(DateTime(2021, 8, 20), 1380),
    Stock(DateTime(2021, 8, 21), 1411),
    Stock(DateTime(2021, 8, 22), 1434),
    Stock(DateTime(2021, 8, 23), 1421),
    Stock(DateTime(2021, 8, 24), 1477),
    Stock(DateTime(2021, 8, 25), 1503),
    Stock(DateTime(2021, 8, 26), 1544),
    Stock(DateTime(2021, 8, 27), 1587),
    Stock(DateTime(2021, 8, 28), 1604),
    Stock(DateTime(2021, 8, 29), 1671),
    Stock(DateTime(2021, 8, 30), 1650),
    Stock(DateTime(2021, 8, 31), 1702),
  ];

  late var _series;

  @override
  void initState() {
    _series = [
      charts.Series(
          id: "Stock",
          domainFn: (Stock stockValues, _) => stockValues.time,
          measureFn: (Stock stockValues, _) => stockValues.stockValue,
          data: _data
      )
    ];
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
        body: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(24, 24, 24, 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _globalWidget.createDetailWidget(
                  title: 'Time Series Charts 3 (Time Series Charts - Margin Left)',
                  desc: 'This is the example of time series charts - margin left 40'
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 8),
                child: SizedBox(
                  height: 400,
                  child: charts.TimeSeriesChart(
                    _series,
                    dateTimeFactory: charts.LocalDateTimeFactory(),
                    primaryMeasureAxis: charts.NumericAxisSpec(
                      tickProviderSpec: charts.BasicNumericTickProviderSpec(
                        zeroBound: false,
                      ),
                      renderSpec: charts.GridlineRendererSpec(
                        labelOffsetFromAxisPx: 40,
                      )
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
    );
  }
}