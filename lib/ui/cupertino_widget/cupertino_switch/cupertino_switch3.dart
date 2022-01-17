import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CupertinoSwitch3Page extends StatefulWidget {
  @override
  _CupertinoSwitch3PageState createState() => _CupertinoSwitch3PageState();
}

class _CupertinoSwitch3PageState extends State<CupertinoSwitch3Page> {
  // initialize global widget
  final _globalWidget = GlobalWidget();

  bool _val = true;

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
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: _globalWidget.createDetailWidget(
                    title: 'Cupertino Switch 3 - Properties',
                    desc: 'This is the example of Cupertino Switch with properties'
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 8),
                child: CupertinoSwitch(
                  activeColor: Colors.pinkAccent,
                  thumbColor: Colors.blueAccent,
                  trackColor: Colors.green,
                  value: _val,
                  onChanged: (bool value) { setState(() { _val = value; }); },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
