/*
https://pub.dev/packages/badges
*/
import 'package:badges/badges.dart';
import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';

class Badges3Page extends StatefulWidget {
  @override
  _Badges3PageState createState() => _Badges3PageState();
}

class _Badges3PageState extends State<Badges3Page> {
  // initialize global widget
  final _globalWidget = GlobalWidget();

  int _counter = 0;

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
                  title: 'Badges 3 - Animation',
                  desc: 'This is the example of badges with animation'
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 8),
              child: _addRemoveCartButtons(),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 8),
              child: Badge(
                position: BadgePosition.topEnd(top: 0, end: 3),
                animationDuration: Duration(milliseconds: 300),
                animationType: BadgeAnimationType.slide,
                badgeContent: Text(
                  _counter.toString(),
                  style: TextStyle(color: Colors.white),
                ),
                child: IconButton(icon: Icon(Icons.shopping_cart), onPressed: () {}),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 8),
              child: Badge(
                position: BadgePosition.topEnd(top: 0, end: 3),
                animationDuration: Duration(milliseconds: 300),
                animationType: BadgeAnimationType.fade,
                badgeContent: Text(
                  _counter.toString(),
                  style: TextStyle(color: Colors.white),
                ),
                child: IconButton(icon: Icon(Icons.shopping_cart), onPressed: () {}),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 8),
              child: Badge(
                position: BadgePosition.topEnd(top: 0, end: 3),
                animationDuration: Duration(milliseconds: 300),
                animationType: BadgeAnimationType.scale,
                badgeContent: Text(
                  _counter.toString(),
                  style: TextStyle(color: Colors.white),
                ),
                child: IconButton(icon: Icon(Icons.shopping_cart), onPressed: () {}),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _addRemoveCartButtons() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          ElevatedButton.icon(
              onPressed: () {
                setState(() {
                  _counter++;
                });
              },
              icon: Icon(Icons.add),
              label: Text('Add')),
          ElevatedButton.icon(
              onPressed: () {
                if (_counter > 0) {
                  setState(() {
                    _counter--;
                  });
                }
              },
              icon: Icon(Icons.remove),
              label: Text('Remove')),
        ],
      ),
    );
  }
}
