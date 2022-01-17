import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CupertinoSwitch2Page extends StatefulWidget {
  @override
  _CupertinoSwitch2PageState createState() => _CupertinoSwitch2PageState();
}

class _CupertinoSwitch2PageState extends State<CupertinoSwitch2Page> {
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
                    title: 'Cupertino Switch 2 - with ListTile',
                    desc: 'This is the example of Cupertino Switch with ListTile'
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 8),
                child: MergeSemantics(
                  child: ListTile(
                    title: const Text('Lights'),
                    trailing: CupertinoSwitch(
                      value: _val,
                      onChanged: (bool value) { setState(() { _val = value; }); },
                    ),
                    onTap: () { setState(() { _val = !_val; }); },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
