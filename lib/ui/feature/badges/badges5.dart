/*
https://pub.dev/packages/badges
*/
import 'package:badges/badges.dart';
import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';

class Badges5Page extends StatefulWidget {
  @override
  _Badges5PageState createState() => _Badges5PageState();
}

class _Badges5PageState extends State<Badges5Page> {
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
                  title: 'Badges 5 - Position',
                  desc: 'This is the example of badges with position'
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 16),
              child: Text("Top Left"),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 8),
              child: Badge(
                position: BadgePosition.topStart(top: -5, start: -10),
                badgeContent: Text('7'),
                child: IconButton(
                  icon: Icon(Icons.settings),
                  onPressed: () {},
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 16),
              child: Text("Top Right"),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 8),
              child: Badge(
                position: BadgePosition.topEnd(top: -5, end: -20),
                badgeContent: Text('7'),
                child: IconButton(
                  icon: Icon(Icons.settings),
                  onPressed: () {},
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 16),
              child: Text("Bottom Left"),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 8),
              child: Badge(
                position: BadgePosition.bottomStart(bottom: -5, start: -10),
                badgeContent: Text('7'),
                child: IconButton(
                  icon: Icon(Icons.settings),
                  onPressed: () {},
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 16),
              child: Text("Bottom Right"),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 8),
              child: Badge(
                position: BadgePosition.bottomEnd(bottom: -5, end: -20),
                badgeContent: Text('7'),
                child: IconButton(
                  icon: Icon(Icons.settings),
                  onPressed: () {},
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 16),
              child: Text("Center"),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 8),
              child: Badge(
                position: BadgePosition.center(),
                badgeContent: Text('7', style: TextStyle(
                  color: Colors.white
                )),
                padding: EdgeInsets.all(2),
                child: IconButton(
                  icon: Icon(Icons.settings),
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
