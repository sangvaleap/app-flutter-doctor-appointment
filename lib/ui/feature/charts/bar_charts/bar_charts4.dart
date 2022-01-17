import 'package:doctor_app/model/feature/sales_color_model.dart';
import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class BarCharts4Page extends StatefulWidget {
  @override
  _BarCharts4PageState createState() => _BarCharts4PageState();
}

class _BarCharts4PageState extends State<BarCharts4Page> {
  // initialize global widget
  final _globalWidget = GlobalWidget();

  final List<Sales> _data = [
    Sales("2014", 50, Colors.red),
    Sales("2015", 120, Colors.green),
    Sales("2016", 140, Colors.blue),
    Sales("2017", 170, Colors.yellow),
    Sales("2018", 80, Colors.pink),
    Sales("2019", 110, Colors.brown),
    Sales("2020", 260, Colors.orange),
  ];

  late var _series;

  @override
  void initState() {
    _series = [
      charts.Series(
          id: "Sales",
          domainFn: (Sales sales, _) => sales.year,
          measureFn: (Sales sales, _) => sales.sale,
          colorFn: (Sales sales, _) => sales.color,
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
                  title: 'Bar Charts 4 (Bar Charts with Color)',
                  desc: 'This is the example of bar charts with color'
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 8),
                child: SizedBox(
                  height: 400,
                  child: charts.BarChart(
                    _series,
                  ),
                ),
              ),
            ],
          ),
        )
    );
  }
}