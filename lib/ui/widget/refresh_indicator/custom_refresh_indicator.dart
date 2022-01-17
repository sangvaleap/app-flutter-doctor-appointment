import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CustomRefreshIndicatorPage extends StatefulWidget {
  @override
  _CustomRefreshIndicatorPageState createState() => _CustomRefreshIndicatorPageState();
}

class _CustomRefreshIndicatorPageState extends State<CustomRefreshIndicatorPage> {
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
          color: Colors.pinkAccent,
          backgroundColor: Colors.white,
          strokeWidth: 4,
          onRefresh: refreshData,
          child: ListView(
            padding: EdgeInsets.fromLTRB(24, 24, 24, 16),
            children: [
              _globalWidget.createDetailWidget(
                  title: 'Custom Refresh Indicator',
                  desc: 'This is the example of refresh indicator with custom color'
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
