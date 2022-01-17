import 'package:doctor_app/config/constant.dart';
import 'package:doctor_app/ui/cupertino_widget/cupertino_sliding_segmented_control/cupertino_sliding_segmented_control1.dart';
import 'package:doctor_app/ui/cupertino_widget/cupertino_sliding_segmented_control/cupertino_sliding_segmented_control2.dart';
import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';

class CupertinoSlidingSegmentedControlListPage extends StatefulWidget {
  @override
  _CupertinoSlidingSegmentedControlListPageState createState() => _CupertinoSlidingSegmentedControlListPageState();
}

class _CupertinoSlidingSegmentedControlListPageState extends State<CupertinoSlidingSegmentedControlListPage> {
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
              child: Text('Cupertino Sliding Segmented Control', style: TextStyle(
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
                        child: Text('An iOS-13-style segmented control. Used to select mutually exclusive options in a horizontal list.', style: TextStyle(
                            fontSize: 15, color: BLACK77,letterSpacing: 0.5
                        )),
                      )
                  ),
                  Flexible(
                      flex: 2,
                      child: Container(
                          alignment: Alignment.center,
                          child: Icon(Icons.view_column, size: 50, color: SOFT_BLUE))
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
            _globalWidget.screenDetailList(context: context, title: 'Cupertino Sliding Segmented Control 1 - Standart', page: CupertinoSlidingSegmentedControl1Page()),
            _globalWidget.screenDetailList(context: context, title: 'Cupertino Sliding Segmented Control 2 - Properties', page: CupertinoSlidingSegmentedControl2Page()),
          ],
        )
    );
  }
}
