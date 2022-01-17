import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class StandartRefreshIndicatorPage extends StatefulWidget {
  @override
  _StandartRefreshIndicatorPageState createState() => _StandartRefreshIndicatorPageState();
}

class _StandartRefreshIndicatorPageState extends State<StandartRefreshIndicatorPage> {
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
        body: RefreshIndicator(
          onRefresh: refreshData,
          child: ListView(
            padding: EdgeInsets.fromLTRB(24, 24, 24, 16),
            children: [
              _globalWidget.createDetailWidget(
                  title: 'Standart Refresh Indicator',
                  desc: 'This is the example of refresh indicator without any style'
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 8),
                child: Container(
                  child: Text('Pull from the top to refresh this page'),
                ),
              ),
            ],
          ),
        )
    );
  }

  Future refreshData() async {
    Fluttertoast.showToast(msg: 'This page has been refresh', toastLength: Toast.LENGTH_SHORT);
  }
}
