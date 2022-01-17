import 'package:doctor_app/model/feature/sales_model.dart';
import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class BarCharts5Page extends StatefulWidget {
  @override
  _BarCharts5PageState createState() => _BarCharts5PageState();
}

class _BarCharts5PageState extends State<BarCharts5Page> {
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
                  title: 'Bar Charts 5 (Remove Bottom Text)',
                  desc: 'This is the example of bar charts - remove bottom text'
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 8),
                child: SizedBox(
                  height: 400,
                  child: charts.BarChart(
                    _series,
                    // to remove side text, use below code
                    /*primaryMeasureAxis: charts.NumericAxisSpec(
                        renderSpec: charts.NoneRenderSpec()
                    ),*/
                    // to remove bottom text, use below code
                    domainAxis: charts.OrdinalAxisSpec(
                        showAxisLine: true,
                        renderSpec: charts.NoneRenderSpec()
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