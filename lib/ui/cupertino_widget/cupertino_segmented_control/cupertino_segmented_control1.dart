import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CupertinoSegmentedControl1Page extends StatefulWidget {
  @override
  _CupertinoSegmentedControl1PageState createState() => _CupertinoSegmentedControl1PageState();
}

class _CupertinoSegmentedControl1PageState extends State<CupertinoSegmentedControl1Page> {
  // initialize global widget
  final _globalWidget = GlobalWidget();

  int _groupValue = 0;

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
                    title: 'Cupertino Segmented Control 1 - Standart',
                    desc: 'This is the example of standart Cupertino Segmented Control'
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.symmetric(vertical: 8),
                child: CupertinoSegmentedControl<int>(
                  groupValue: _groupValue,
                  children: {
                    0: Text('Option 1'),
                    1: Text('Option 2'),
                    2: Text('Option 3'),
                  },
                  onValueChanged: (groupValue) {
                    setState(() {
                      _groupValue = groupValue;
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
