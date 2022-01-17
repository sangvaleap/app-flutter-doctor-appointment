import 'package:doctor_app/config/constant.dart';
import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:doctor_app/ui/widget/sliver/sliver_grid1.dart';
import 'package:doctor_app/ui/widget/sliver/sliver_grid2.dart';
import 'package:doctor_app/ui/widget/sliver/sliver_grid3.dart';
import 'package:flutter/material.dart';

class SliverGridListPage extends StatefulWidget {
  @override
  _SliverGridListPageState createState() => _SliverGridListPageState();
}

class _SliverGridListPageState extends State<SliverGridListPage> {
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
              child: Text('Sliver Grid', style: TextStyle(
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
                        child: Text('A sliver that places multiple box children in a two dimensional arrangement.', style: TextStyle(
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
            _globalWidget.screenDetailList(context: context, title: 'Example 1', page: SliverGrid1Page()),
            _globalWidget.screenDetailList(context: context, title: 'Example 2', page: SliverGrid2Page()),
            _globalWidget.screenDetailList(context: context, title: 'Example 3', page: SliverGrid3Page()),
          ],
        )
    );
  }
}
