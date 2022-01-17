/*
https://pub.dev/packages/percent_indicator
*/
import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class CircleIndicator9Page extends StatefulWidget {
  @override
  _CircleIndicator9PageState createState() => _CircleIndicator9PageState();
}

class _CircleIndicator9PageState extends State<CircleIndicator9Page> {
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
                  title: 'Circle Indicator - Widget Indicator with Icon',
                  desc: 'This is the example of circle indicator with widget indicator icon'
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 8),
              child: CircularPercentIndicator(
                radius: 120.0,
                lineWidth: 10.0,
                percent: 0.7,
                center: Text('70%'),
                backgroundColor: Colors.grey,
                progressColor: Colors.amber,
                animation: true,
                animationDuration: 1000,
                // widget indicator must use animation
                widgetIndicator: RotatedBox(
                  quarterTurns: 1,
                  child: Icon(Icons.airplanemode_active, size: 30, color: Colors.purple),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
