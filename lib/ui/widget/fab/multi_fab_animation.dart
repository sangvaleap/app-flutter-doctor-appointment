import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:fab_circular_menu/fab_circular_menu.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class MultiFabAnimationPage extends StatefulWidget {
  @override
  _MultiFabAnimationPageState createState() => _MultiFabAnimationPageState();
}

class _MultiFabAnimationPageState extends State<MultiFabAnimationPage> {
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
            _globalWidget.createDetailWidget(
                title: 'Multi FAB Animation',
                desc: 'This is the example of Multi FAB Animation'
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 8),
              child: Container(
                  child: Text('Below is the example of Multi FAB Animation')),
            ),
          ],
        ),
      ),
        floatingActionButton: FabCircularMenu(
            fabColor: Colors.white,
            ringColor: Colors.pinkAccent,
            children: <Widget>[
              IconButton(icon: Icon(Icons.home, color: Colors.white), onPressed: () {
                Fluttertoast.showToast(msg: 'Home Pressed', toastLength: Toast.LENGTH_SHORT);
              }),
              IconButton(icon: Icon(Icons.add, color: Colors.white), onPressed: () {
                Fluttertoast.showToast(msg: 'Add Pressed', toastLength: Toast.LENGTH_SHORT);
              }),
              IconButton(icon: Icon(Icons.edit, color: Colors.white), onPressed: () {
                Fluttertoast.showToast(msg: 'Edit Pressed', toastLength: Toast.LENGTH_SHORT);
              }),
              IconButton(icon: Icon(Icons.notifications, color: Colors.white), onPressed: () {
                Fluttertoast.showToast(msg: 'Notification Pressed', toastLength: Toast.LENGTH_SHORT);
              }),
              IconButton(icon: Icon(Icons.camera, color: Colors.white), onPressed: () {
                Fluttertoast.showToast(msg: 'Camera Pressed', toastLength: Toast.LENGTH_SHORT);
              }),
              IconButton(icon: Icon(Icons.photo, color: Colors.white), onPressed: () {
                Fluttertoast.showToast(msg: 'Photo Pressed', toastLength: Toast.LENGTH_SHORT);
              }),
            ]
        )
    );
  }
}
