import 'package:doctor_app/config/constant.dart';
import 'package:doctor_app/ui/cupertino_widget/cupertino_scrollbar/cupertino_scrollbar1.dart';
import 'package:doctor_app/ui/cupertino_widget/cupertino_scrollbar/cupertino_scrollbar2.dart';
import 'package:doctor_app/ui/cupertino_widget/cupertino_scrollbar/cupertino_scrollbar3.dart';
import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';

class CupertinoScrollbarListPage extends StatefulWidget {
  @override
  _CupertinoScrollbarListPageState createState() => _CupertinoScrollbarListPageState();
}

class _CupertinoScrollbarListPageState extends State<CupertinoScrollbarListPage> {
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
              child: Text('Cupertino Scrollbar', style: TextStyle(
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
                        child: Text('An iOS-style scrollbar that indicates which portion of a scrollable widget is currently visible.', style: TextStyle(
                            fontSize: 15, color: BLACK77,letterSpacing: 0.5
                        )),
                      )
                  ),
                  Flexible(
                      flex: 2,
                      child: Container(
                          alignment: Alignment.center,
                          child: Icon(Icons.south, size: 50, color: SOFT_BLUE))
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
            _globalWidget.screenDetailList(context: context, title: 'Cupertino Scrollbar 1 - Standart', page: CupertinoScrollbar1Page()),
            _globalWidget.screenDetailList(context: context, title: 'Cupertino Scrollbar 2 - Properties', page: CupertinoScrollbar2Page()),
            _globalWidget.screenDetailList(context: context, title: 'Cupertino Scrollbar 3 - Always Shown', page: CupertinoScrollbar3Page()),
          ],
        )
    );
  }
}
