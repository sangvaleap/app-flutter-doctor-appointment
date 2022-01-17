/*
https://pub.dev/packages/percent_indicator
*/
import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:percent_indicator/percent_indicator.dart';

class CircleIndicator15Page extends StatefulWidget {
  @override
  _CircleIndicator15PageState createState() => _CircleIndicator15PageState();
}

class _CircleIndicator15PageState extends State<CircleIndicator15Page> {
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
                  title: 'Circle Indicator - Animation Callback',
                  desc: 'This is the example of circle indicator with animation callback'
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 8),
              child: CircularPercentIndicator(
                radius: 120.0,
                lineWidth: 10.0,
                percent: 0.9,
                center: Text('90%'),
                backgroundColor: Colors.grey,
                progressColor: Colors.amber,
                animation: true,
                animationDuration: 3000,
                onAnimationEnd: (){
                  Fluttertoast.showToast(msg: 'Circle Indicator Complete', toastLength: Toast.LENGTH_SHORT);
                }
              ),
            ),
          ],
        ),
      ),
    );
  }
}
