/*
https://pub.dev/packages/badges
*/
import 'package:backdrop/backdrop.dart';
import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';

class Backdrop1Page extends StatefulWidget {
  @override
  _Backdrop1PageState createState() => _Backdrop1PageState();
}

class _Backdrop1PageState extends State<Backdrop1Page> {
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
        title: Text("Default Backdrop"),
        actions: <Widget>[
          BackdropToggleButton(
            icon: AnimatedIcons.list_view,
          )
        ],
      ),
      backLayer: Center(
        child: Text("Back Layer"),
      ),
      frontLayer: Center(
        child: _globalWidget.createButton(
            backgroundColor: Colors.blue,
            textColor: Colors.white,
            buttonName: 'Back',
            onPressed: (){
              Navigator.pop(context);
            }
        ),
      ),
    );
  }
}
