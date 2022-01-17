import 'package:doctor_app/model/feature/sales_model.dart';
import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class BarCharts9Page extends StatefulWidget {
  @override
  _BarCharts9PageState createState() => _BarCharts9PageState();
}

class _BarCharts9PageState extends State<BarCharts9Page> {
  // initialize global widget
  final _globalWidget = GlobalWidget();

  final List<Sales> _smartphoneData = [
    Sales("2014", 50),
    Sales("2015", 120),
    Sales("2016", 140),
    Sales("2017", 170),
    Sales("2018", 80),
    Sales("2019", 110),
    Sales("2020", 260),
  ];

  final List<Sales> _refrigeratorData = [
    Sales("2014", 30),
    Sales("2015", 150),
    Sales("2016", 180),
    Sales("2017", 270),
    Sales("2018", 180),
    Sales("2019", 90),
    Sales("2020", 370),
  ];

  final List<Sales> _tvData = [
    Sales("2014", 80),
    Sales("2015", 170),
    Sales("2016", 160),
    Sales("2017", 220),
    Sales("2018", 120),
    Sales("2019", 150),
    Sales("2020", 310),
  ];

  late var _series;

  @override
  void initState() {
    _series = [
      charts.Series(
          id: "SmartPhone",
          domainFn: (Sales sales, _) => sales.year,
          measureFn: (Sales sales, _) => sales.sale,
          data: _smartphoneData
      ),
      charts.Series(
          id: "Refrigerator",
          domainFn: (Sales sales, _) => sales.year,
          measureFn: (Sales sales, _) => sales.sale,
          data: _refrigeratorData
      ),
      charts.Series(
          id: "TV",
          domainFn: (Sales sales, _) => sales.year,
          measureFn: (Sales sales, _) => sales.sale,
          data: _tvData
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
                  title: 'Bar Charts 9 (Multi Data with Legend Options)',
                  desc: 'This is the example of multi data chart with legend options'
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 8),
                child: SizedBox(
                  height: 400,
                  child: charts.BarChart(
                    _series,
                    barGroupingType: charts.BarGroupingType.grouped,
                      behaviors: [
                        charts.SeriesLegend(
                          // By default, if the position of the chart is on the left or right of
                          // the chart, [horizontalFirst] is set to false. This means that the
                          // legend entries will grow as new rows first instead of a new column.
                          horizontalFirst: false,
                          // By setting this value to 2, the legend entries will grow up to two
                          // rows before adding a new column.
                          desiredMaxRows: 2,
                          // This defines the padding around each legend entry.
                          cellPadding: EdgeInsets.only(right: 4.0, bottom: 4.0),
                          // Render the legend entry text with custom styles.
                          entryTextStyle: charts.TextStyleSpec(
                              color: charts.Color(r: 127, g: 63, b: 191),
                              fontFamily: 'Georgia',
                              fontSize: 11),
                        )
                      ]
                  ),
                ),
              ),
            ],
          ),
        )
    );
  }
}