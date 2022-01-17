/*
https://pub.dev/packages/badges
*/
import 'package:backdrop/backdrop.dart';
import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';

class Backdrop2Page extends StatefulWidget {
  @override
  _Backdrop2PageState createState() => _Backdrop2PageState();
}

class _Backdrop2PageState extends State<Backdrop2Page> {
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
    return BackdropScaffold(
      appBar: BackdropAppBar(
        backgroundColor: Colors.teal,
        title: Text("Customize Backdrop"),
        actions: <Widget>[
          BackdropToggleButton(
            icon: AnimatedIcons.arrow_menu,
          )
        ],
      ),
      backLayerBackgroundColor: Colors.teal,
      backLayer: Center(
        child: Text("Back Layer", style: TextStyle(
            color: Colors.white
        )),
      ),
      frontLayer: Container(
        color: Colors.lightBlue,
        child: Center(
          child: _globalWidget.createButton(
              backgroundColor: Colors.white,
              textColor: Colors.blue,
              buttonName: 'Back',
              onPressed: (){
                Navigator.pop(context);
              }
          ),
        ),
      ),
    );
  }
}
