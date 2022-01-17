import 'package:doctor_app/model/feature/sales_model.dart';
import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class BarCharts3Page extends StatefulWidget {
  @override
  _BarCharts3PageState createState() => _BarCharts3PageState();
}

class _BarCharts3PageState extends State<BarCharts3Page> {
  // initialize global widget
  final _globalWidget = GlobalWidget();

  final List<Sales> _data = [
    Sales("2014", 50),
    Sales("2015", 120),
    Sales("2016", 140),
    Sales("2017", 170),
    Sales("2018", 80),
    Sales("2019", 110),
    Sales("2020", 260),
  ];

  late var _series;

  @override
  void initState() {
    _series = [
      charts.Series(
          id: "Sales",
          domainFn: (Sales sales, _) => sales.year,
          measureFn: (Sales sales, _) => sales.sale,
          labelAccessorFn: (Sales sales, _) => 'text', // if the text is too long, the text appear outside the bar
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
                  title: 'Bar Charts 3 (Bar Charts with Label Inside)',
                  desc: 'This is the example of bar charts with label inside'
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 8),
                child: SizedBox(
                  height: 400,
                  child: charts.BarChart(
                    _series,
                    animate: true, // add or remove animation
                    vertical: false, // make the chart horizontal
                    barRendererDecorator: charts.BarLabelDecorator<String>(
                        labelPosition: charts.BarLabelPosition.inside
                    ), // write text inside bar, must add labelAccessorFn at charts.Series
                    domainAxis: charts.OrdinalAxisSpec(renderSpec: charts.NoneRenderSpec()), // remove domainFn text
                  ),
                ),
              ),
            ],
          ),
        )
    );
  }
}