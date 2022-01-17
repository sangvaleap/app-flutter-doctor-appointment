/*
https://pub.dev/packages/percent_indicator
*/
import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class LinearIndicator7Page extends StatefulWidget {
  @override
  _LinearIndicator7PageState createState() => _LinearIndicator7PageState();
}

class _LinearIndicator7PageState extends State<LinearIndicator7Page> {
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
                  title: 'Linear Indicator - Reverse',
                  desc: 'This is the example of linear indicator with reverse'
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 8),
              child: LinearPercentIndicator(
                width: MediaQuery.of(context).size.width-48,
                lineHeight: 24.0,
                percent: 0.5,
                center: Text("50.0%", style: TextStyle(
                    color: Colors.white
                )),
                backgroundColor: Colors.grey,
                progressColor: Colors.blue,
                animation: true,
                animationDuration: 1000,
                animateFromLastPercent: true,
                isRTL: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
