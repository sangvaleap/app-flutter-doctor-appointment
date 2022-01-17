import 'package:doctor_app/config/constant.dart';
import 'package:doctor_app/ui/feature/sliver_tab_bar/sliver_tabbar1.dart';
import 'package:doctor_app/ui/feature/sliver_tab_bar/sliver_tabbar2.dart';
import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';

class SliverTabbarListPage extends StatefulWidget {
  @override
  _SliverTabbarListPageState createState() => _SliverTabbarListPageState();
}

class _SliverTabbarListPageState extends State<SliverTabbarListPage> {
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
              child: Text('Sliver Tab Bar', style: TextStyle(
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
                        child: Text('Sliver Tab Bar used to create tab view with app bar animation when scrolling up or scrolling down.', style: TextStyle(
                            fontSize: 15, color: BLACK77,letterSpacing: 0.5
                        )),
                      )
                  ),
                  Flexible(
                      flex: 2,
                      child: Container(
                          alignment: Alignment.center,
                          child: Icon(Icons.table_chart, size: 50, color: SOFT_BLUE))
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
            _globalWidget.screenDetailList(context: context, title: 'Sliver Tab Bar 1', page: SliverTabbar1Page()),
            _globalWidget.screenDetailList(context: context, title: 'Sliver Tab Bar 2 (Using SliverOverlapAbsorber)', page: SliverTabbar2Page()),
          ],
        )
    );
  }
}
