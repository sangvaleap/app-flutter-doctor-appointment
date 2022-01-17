/*
https://pub.dev/packages/percent_indicator
*/
import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class LinearIndicator3Page extends StatefulWidget {
  @override
  _LinearIndicator3PageState createState() => _LinearIndicator3PageState();
}

class _LinearIndicator3PageState extends State<LinearIndicator3Page> {
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
                  title: 'Linear Indicator - With Animation',
                  desc: 'This is the example of linear indicator with animation'
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
