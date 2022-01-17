/*
https://pub.dev/packages/badges
*/
import 'package:badges/badges.dart';
import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';

class Badges8Page extends StatefulWidget {
  @override
  _Badges8PageState createState() => _Badges8PageState();
}

class _Badges8PageState extends State<Badges8Page> {
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
                  title: 'Badges 8 - Only Badges',
                  desc: 'This is the example of only badges'
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 8),
              child: Badge(
                elevation: 0,
                shape: BadgeShape.circle,
                padding: EdgeInsets.all(7),
                badgeContent: Text(
                  '20',
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
