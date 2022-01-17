/*
https://pub.dev/packages/badges
*/
import 'package:badges/badges.dart';
import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';

class Badges6Page extends StatefulWidget {
  @override
  _Badges6PageState createState() => _Badges6PageState();
}

class _Badges6PageState extends State<Badges6Page> {
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
                  title: 'Badges 6 - Only Circle',
                  desc: 'This is the example of badges only circle'
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 8),
              child: Badge(
                position: BadgePosition.topEnd(top: 4, end: 4),
                badgeContent: null,
                child: IconButton(
                  icon: Icon(Icons.menu),
                  onPressed: () {},
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
