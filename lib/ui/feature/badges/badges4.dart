/*
https://pub.dev/packages/badges
*/
import 'package:badges/badges.dart';
import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';

class Badges4Page extends StatefulWidget {
  @override
  _Badges4PageState createState() => _Badges4PageState();
}

class _Badges4PageState extends State<Badges4Page> {
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
                  title: 'Badges 4 - Color',
                  desc: 'This is the example of badges color'
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 8),
              child: Badge(
                badgeColor: Colors.deepPurpleAccent,
                badgeContent: Text('7'),
                padding: EdgeInsets.all(6),
                child: Icon(Icons.settings),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
