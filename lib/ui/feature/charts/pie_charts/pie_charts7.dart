import 'package:doctor_app/model/feature/sales_color_model.dart';
import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class PieCharts7Page extends StatefulWidget {
  @override
  _PieCharts7PageState createState() => _PieCharts7PageState();
}

class _PieCharts7PageState extends State<PieCharts7Page> {
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
                  title: 'Pie Charts 7 (Pie Charts with Value at Legend)',
                  desc: 'This is the example of pie charts with value at legend'
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 8),
                child: SizedBox(
                  height: 400,
                  child: charts.PieChart<String>(
                    _series,
                    animate: true, // add or remove animation
                    behaviors: [
                      charts.DatumLegend(
                        // Positions for "start" and "end" will be left and right respectively
                        // for widgets with a build context that has directionality ltr.
                        // For rtl, "start" and "end" will be right and left respectively.
                        // Since this example has directionality of ltr, the legend is
                        // positioned on the right side of the chart.
                        position: charts.BehaviorPosition.end,
                        // By default, if the position of the chart is on the left or right of
                        // the chart, [horizontalFirst] is set to false. This means that the
                        // legend entries will grow as new rows first instead of a new column.
                        horizontalFirst: false,
                        // This defines the padding around each legend entry.
                        cellPadding: EdgeInsets.only(right: 4.0, bottom: 4.0),
                        // Set [showMeasures] to true to display measures in series legend.
                        showMeasures: true,
                        // Configure the measure value to be shown by default in the legend.
                        legendDefaultMeasure: charts.LegendDefaultMeasure.firstValue,
                        // Optionally provide a measure formatter to format the measure value.
                        // If none is specified the value is formatted as a decimal.
                        measureFormatter: (num? value) {
                          return ': '+value.toString();
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        )
    );
  }
}