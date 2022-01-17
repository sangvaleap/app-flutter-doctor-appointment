import 'package:doctor_app/config/constant.dart';
import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:doctor_app/ui/widget/animated_list/animated_list_1.dart';
import 'package:doctor_app/ui/widget/animated_list/animated_list_2.dart';
import 'package:doctor_app/ui/widget/animated_list/animated_list_3.dart';
import 'package:doctor_app/ui/widget/animated_list/animated_list_4.dart';
import 'package:doctor_app/ui/widget/animated_list/animated_list_5.dart';
import 'package:doctor_app/ui/widget/animated_list/animated_list_6.dart';
import 'package:flutter/material.dart';

class AnimatedListWidgetListPage extends StatefulWidget {
  @override
  _AnimatedListWidgetListPageState createState() => _AnimatedListWidgetListPageState();
}

class _AnimatedListWidgetListPageState extends State<AnimatedListWidgetListPage> {
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
              child: Text('Animated List', style: TextStyle(
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
                        child: Text('A scrolling container that animates items when they are inserted or removed.', style: TextStyle(
                            fontSize: 15, color: BLACK77,letterSpacing: 0.5
                        )),
                      )
                  ),
                  Flexible(
                      flex: 2,
                      child: Container(
                          alignment: Alignment.center,
                          child: Icon(Icons.list, size: 50, color: SOFT_BLUE))
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
            _globalWidget.screenDetailList(context: context, title: 'Animated List 1', page: AnimatedList1Page()),
            _globalWidget.screenDetailList(context: context, title: 'Animated List 2', page: AnimatedList2Page()),
            _globalWidget.screenDetailList(context: context, title: 'Animated List 3\n(Slide Animation)', page: AnimatedList3Page()),
            _globalWidget.screenDetailList(context: context, title: 'Animated List 4\n(Rotate Animation)', page: AnimatedList4Page()),
            _globalWidget.screenDetailList(context: context, title: 'Animated List 5\n(Combine Animation)', page: AnimatedList5Page()),
            _globalWidget.screenDetailList(context: context, title: 'Animated List 6\n(On Init)', page: AnimatedList6Page()),
          ],
        )
    );
  }
}
