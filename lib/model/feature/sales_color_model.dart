import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class Sales {
  final String year;
  final int sale;
  final charts.Color color;

  Sales(this.year, this.sale, Color color)
      :this.color=charts.Color(r: color.red, g: color.green, b: color.blue, a: color.alpha);
}