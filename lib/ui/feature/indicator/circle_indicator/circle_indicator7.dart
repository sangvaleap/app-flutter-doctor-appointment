/*
https://pub.dev/packages/percent_indicator
*/
import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class CircleIndicator7Page extends StatefulWidget {
  @override
  _CircleIndicator7PageState createState() => _CircleIndicator7PageState();
}

class _CircleIndicator7PageState extends State<CircleIndicator7Page> {
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
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(24, 24, 24, 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: _globalWidget.createDetailWidget(
                  title: 'Circle Indicator - Start Angle',
                  desc: 'This is the example of circle indicator with different start angle'
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 8),
              child: CircularPercentIndicator(
                radius: 90.0,
                lineWidth: 10.0,
                percent: 0.4,
                startAngle: 90,
                center: Text('40%'),
                backgroundColor: Colors.grey,
                progressColor: Colors.amber,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
