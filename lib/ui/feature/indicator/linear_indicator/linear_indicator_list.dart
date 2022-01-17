import 'package:doctor_app/config/constant.dart';
import 'package:doctor_app/ui/feature/indicator/linear_indicator/linear_indicator1.dart';
import 'package:doctor_app/ui/feature/indicator/linear_indicator/linear_indicator10.dart';
import 'package:doctor_app/ui/feature/indicator/linear_indicator/linear_indicator2.dart';
import 'package:doctor_app/ui/feature/indicator/linear_indicator/linear_indicator3.dart';
import 'package:doctor_app/ui/feature/indicator/linear_indicator/linear_indicator4.dart';
import 'package:doctor_app/ui/feature/indicator/linear_indicator/linear_indicator5.dart';
import 'package:doctor_app/ui/feature/indicator/linear_indicator/linear_indicator6.dart';
import 'package:doctor_app/ui/feature/indicator/linear_indicator/linear_indicator7.dart';
import 'package:doctor_app/ui/feature/indicator/linear_indicator/linear_indicator8.dart';
import 'package:doctor_app/ui/feature/indicator/linear_indicator/linear_indicator9.dart';
import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';

class LinearIndicatorListPage extends StatefulWidget {
  @override
  _LinearIndicatorListPageState createState() => _LinearIndicatorListPageState();
}

class _LinearIndicatorListPageState extends State<LinearIndicatorListPage> {
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
        body: ListView(
          padding: EdgeInsets.fromLTRB(24, 24, 24, 16),
          children: [
            Container(
              child: Text('Circle Indicator List', style: TextStyle(
                  fontSize: 18, color: BLACK21, fontWeight: FontWeight.w500
              )),
            ),
            Container(
              margin: EdgeInsets.only(top: 24),
              child: Row(
                children: [
                  Flexible(
                      flex:5,
                      child: Container(
                        child: Text('Indicator with circle', style: TextStyle(
                            fontSize: 15, color: BLACK77,letterSpacing: 0.5
                        )),
                      )
                  ),
                  Flexible(
                      flex: 2,
                      child: Container(
                          alignment: Alignment.center,
                          child: Icon(Icons.horizontal_rule, size: 50, color: SOFT_BLUE))
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 48),
              child: Text('List', style: TextStyle(
                  fontSize: 18, color: BLACK21, fontWeight: FontWeight.w500
              )),
            ),
            SizedBox(height: 18),
            _globalWidget.screenDetailList(context: context, title: 'Linear Indicator 1 - Standart', page: LinearIndicator1Page()),
            _globalWidget.screenDetailList(context: context, title: 'Linear Indicator 2 - With Text', page: LinearIndicator2Page()),
            _globalWidget.screenDetailList(context: context, title: 'Linear Indicator 3 - With Animation', page: LinearIndicator3Page()),
            _globalWidget.screenDetailList(context: context, title: 'Linear Indicator 4 - Gradient Color', page: LinearIndicator4Page()),
            _globalWidget.screenDetailList(context: context, title: 'Linear Indicator 5 - Shape', page: LinearIndicator5Page()),
            _globalWidget.screenDetailList(context: context, title: 'Linear Indicator 6 - Mask Filter', page: LinearIndicator6Page()),
            _globalWidget.screenDetailList(context: context, title: 'Linear Indicator 7 - Reverse', page: LinearIndicator7Page()),
            _globalWidget.screenDetailList(context: context, title: 'Linear Indicator 8 - Restart Animation', page: LinearIndicator8Page()),
            _globalWidget.screenDetailList(context: context, title: 'Linear Indicator 9 - Animation Callback', page: LinearIndicator9Page()),
            _globalWidget.screenDetailList(context: context, title: 'Linear Indicator 10 - Left & Right', page: LinearIndicator10Page()),
          ],
        )
    );
  }
}
