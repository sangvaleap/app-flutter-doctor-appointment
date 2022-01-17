import 'package:doctor_app/config/constant.dart';
import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:doctor_app/ui/widget/listview/horizontal_listview.dart';
import 'package:doctor_app/ui/widget/listview/listview_with_builder.dart';
import 'package:doctor_app/ui/widget/listview/listview_with_generate.dart';
import 'package:doctor_app/ui/widget/listview/listview_with_listtile.dart';
import 'package:doctor_app/ui/widget/listview/reverse_listview.dart';
import 'package:doctor_app/ui/widget/listview/separated_listview.dart';
import 'package:doctor_app/ui/widget/listview/standart_listview.dart';
import 'package:flutter/material.dart';

class ListviewWidgetListPage extends StatefulWidget {
  @override
  _ListviewWidgetListPageState createState() => _ListviewWidgetListPageState();
}

class _ListviewWidgetListPageState extends State<ListviewWidgetListPage> {
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
              child: Text('ListView Widget', style: TextStyle(
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
                        child: Text('ListView Widget is used to listing your data', style: TextStyle(
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
            _globalWidget.screenDetailList(context: context, title: 'Standart ListView', page: StandartListviewPage()),
            _globalWidget.screenDetailList(context: context, title: 'ListView with builder', page: ListviewWithBuilderPage()),
            _globalWidget.screenDetailList(context: context, title: 'ListView with generate', page: ListviewWithGeneratePage()),
            _globalWidget.screenDetailList(context: context, title: 'Separated ListView', page: SeparatedListviewPage()),
            _globalWidget.screenDetailList(context: context, title: 'Horizontal ListView', page: HorizontalListviewPage()),
            _globalWidget.screenDetailList(context: context, title: 'Reverse ListView', page: ReverseListviewPage()),
            _globalWidget.screenDetailList(context: context, title: 'ListView with ListTile', page: ListviewWithListTilePage()),
          ],
        )
    );
  }
}
