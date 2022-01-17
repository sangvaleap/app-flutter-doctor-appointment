import 'package:doctor_app/config/constant.dart';
import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:doctor_app/ui/screen/timeline/timeline1.dart';
import 'package:doctor_app/ui/screen/timeline/timeline2.dart';
import 'package:doctor_app/ui/screen/timeline/timeline3.dart';
import 'package:doctor_app/ui/screen/timeline/timeline4.dart';
import 'package:doctor_app/ui/screen/timeline/timeline5.dart';
import 'package:flutter/material.dart';

class TimelineListPage extends StatefulWidget {
  @override
  _TimelineListPageState createState() => _TimelineListPageState();
}

class _TimelineListPageState extends State<TimelineListPage> {
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
              child: Text('Timeline Screen', style: TextStyle(
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
                        child: Text('Timeline screen used for timeline like order status, delivery status, project timeline, portfolio, step by step, etc.', style: TextStyle(
                            fontSize: 15, color: BLACK77,letterSpacing: 0.5
                        )),
                      )
                  ),
                  Flexible(
                      flex: 2,
                      child: Container(
                          alignment: Alignment.center,
                          child: Icon(Icons.timeline, size: 50, color: SOFT_BLUE))
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 48),
              child: Text('Timeline', style: TextStyle(
                  fontSize: 18, color: BLACK21, fontWeight: FontWeight.w500
              )),
            ),
            SizedBox(height: 18),
            _globalWidget.screenDetailList(context: context, title: 'Timeline 1 (Order Status - Manual Created)', page: Timeline1Page()),
            _globalWidget.screenDetailList(context: context, title: 'Timeline 2 (Order Status - Using Package)', page: Timeline2Page()),
            _globalWidget.screenDetailList(context: context, title: 'Timeline 3 (Order Status - Horizontal)', page: Timeline3Page()),
            _globalWidget.screenDetailList(context: context, title: 'Timeline 4 (SDLC - Waterfall Model 1)', page: Timeline4Page()),
            _globalWidget.screenDetailList(context: context, title: 'Timeline 5 (SDLC - Waterfall Model 2)', page: Timeline5Page()),
          ],
        )
    );
  }
}
