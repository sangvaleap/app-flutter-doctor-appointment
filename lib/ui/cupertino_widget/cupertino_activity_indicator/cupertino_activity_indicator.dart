import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CupertinoActivityIndicatorPage extends StatefulWidget {
  @override
  _CupertinoActivityIndicatorPageState createState() => _CupertinoActivityIndicatorPageState();
}

class _CupertinoActivityIndicatorPageState extends State<CupertinoActivityIndicatorPage> {
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
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(24, 24, 24, 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _globalWidget.createDetailWidget2(
                title: 'Cupertino Activity Indicator',
                desc: 'An iOS-style activity indicator. Displays a circular \'spinner\'.',
                icon: Icons.refresh
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              child: Text('Standart'),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 8),
              child: CupertinoActivityIndicator(),
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              child: Text('Without Animation'),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 8),
              child: CupertinoActivityIndicator(
                animating: false,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              child: Text('Size'),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 8),
              child: CupertinoActivityIndicator(
                radius: 50,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
