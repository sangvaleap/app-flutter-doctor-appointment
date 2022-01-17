/*
https://pub.dev/packages/badges
*/
import 'package:badges/badges.dart';
import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';

class Badges10Page extends StatefulWidget {
  @override
  _Badges10PageState createState() => _Badges10PageState();
}

class _Badges10PageState extends State<Badges10Page> {
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
            Container(
              child: _globalWidget.createDetailWidget(
                  title: 'Badges 10 - With Icon',
                  desc: 'This is the example of badges with icon'
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 8),
              child: Badge(
                elevation: 0,
                position: BadgePosition.topEnd(),
                padding: EdgeInsetsDirectional.only(end: 4),
                badgeColor: Colors.transparent,
                badgeContent: Icon(Icons.error, size: 16.0, color: Colors.red),
                child: Icon(Icons.settings),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
