import 'package:doctor_app/config/constant.dart';
import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:doctor_app/ui/widget/sliver/sliver_appbar_list.dart';
import 'package:doctor_app/ui/widget/sliver/sliver_combine.dart';
import 'package:doctor_app/ui/widget/sliver/sliver_grid_list.dart';
import 'package:doctor_app/ui/widget/sliver/sliver_list_list.dart';
import 'package:doctor_app/ui/widget/sliver/sliver_to_box_adapter.dart';
import 'package:doctor_app/ui/widget/sliver/sticky_sliver.dart';
import 'package:flutter/material.dart';

class SliverWidgetListPage extends StatefulWidget {
  @override
  _SliverWidgetListPageState createState() => _SliverWidgetListPageState();
}

class _SliverWidgetListPageState extends State<SliverWidgetListPage> {
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
              child: Text('Sliver Widget', style: TextStyle(
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
                        child: Text('A sliver is a portion of a scrollable area that you can define to behave in a special way. You can use slivers to achieve custom scrolling effects, such as elastic scrolling.', style: TextStyle(
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
            _globalWidget.screenDetailList(context: context, title: 'Sliver Appbar', page: SliverAppbarListPage()),
            _globalWidget.screenDetailList(context: context, title: 'Sliver List', page: SliverListListPage()),
            _globalWidget.screenDetailList(context: context, title: 'Sliver Grid', page: SliverGridListPage()),
            _globalWidget.screenDetailList(context: context, title: 'Sliver To Box Adapter', page: SliverToBoxAdapterPage()),
            _globalWidget.screenDetailList(context: context, title: 'Sliver Combined', page: SliverCombinePage()),
            _globalWidget.screenDetailList(context: context, title: 'Sticky Sliver', page: StickySliverPage()),
          ],
        )
    );
  }
}
