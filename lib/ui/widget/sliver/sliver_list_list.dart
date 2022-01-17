import 'package:doctor_app/config/constant.dart';
import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:doctor_app/ui/widget/sliver/sliver_list1.dart';
import 'package:doctor_app/ui/widget/sliver/sliver_list2.dart';
import 'package:doctor_app/ui/widget/sliver/sliver_list3.dart';
import 'package:flutter/material.dart';

class SliverListListPage extends StatefulWidget {
  @override
  _SliverListListPageState createState() => _SliverListListPageState();
}

class _SliverListListPageState extends State<SliverListListPage> {
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
              child: Text('Sliver List', style: TextStyle(
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
                        child: Text('A sliver that places multiple box children in a linear array along the main axis.', style: TextStyle(
                            fontSize: 15, color: BLACK77,letterSpacing: 0.5
                        )),
                      )
                  ),
                  Flexible(
                      flex: 2,
                      child: Container(
                          alignment: Alignment.center,
                          child: Icon(Icons.view_list, size: 50, color: SOFT_BLUE))
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
            _globalWidget.screenDetailList(context: context, title: 'Method 1', page: SliverList1Page()),
            _globalWidget.screenDetailList(context: context, title: 'Method 2', page: SliverList2Page()),
            _globalWidget.screenDetailList(context: context, title: 'Method 3', page: SliverList3Page()),
          ],
        )
    );
  }
}
