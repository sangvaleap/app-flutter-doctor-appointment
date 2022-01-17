/*
https://pub.dev/packages/badges
*/
import 'package:badges/badges.dart';
import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';

class Badges2Page extends StatefulWidget {
  @override
  _Badges2PageState createState() => _Badges2PageState();
}

class _Badges2PageState extends State<Badges2Page> {
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
                  title: 'Badges 2 - Chip',
                  desc: 'This is the example of chip badges'
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 8),
              child: Badge(
                badgeColor: Colors.lightBlueAccent,
                borderRadius: BorderRadius.circular(20),
                padding: EdgeInsets.all(0),
                shape: BadgeShape.square,
                badgeContent: Text(
                  'Hello',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 8),
              child: Badge(
                badgeColor: Colors.lightBlueAccent,
                borderRadius: BorderRadius.circular(20),
                padding: EdgeInsets.all(2),
                shape: BadgeShape.square,
                badgeContent: Text(
                  'Hello',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 8),
              child: Badge(
                badgeColor: Colors.lightBlueAccent,
                borderRadius: BorderRadius.circular(20),
                padding: EdgeInsets.all(4),
                shape: BadgeShape.square,
                badgeContent: Text(
                  'Hello',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 8),
              child: Badge(
                badgeColor: Colors.lightBlueAccent,
                borderRadius: BorderRadius.circular(20),
                padding: EdgeInsets.all(6),
                shape: BadgeShape.square,
                badgeContent: Text(
                  'Hello',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 8),
              child: Badge(
                badgeColor: Colors.lightBlueAccent,
                borderRadius: BorderRadius.circular(20),
                padding: EdgeInsets.all(8),
                shape: BadgeShape.square,
                badgeContent: Text(
                  'Hello',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
