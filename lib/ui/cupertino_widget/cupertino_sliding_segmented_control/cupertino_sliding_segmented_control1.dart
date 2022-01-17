import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CupertinoSlidingSegmentedControl1Page extends StatefulWidget {
  @override
  _CupertinoSlidingSegmentedControl1PageState createState() => _CupertinoSlidingSegmentedControl1PageState();
}

class _CupertinoSlidingSegmentedControl1PageState extends State<CupertinoSlidingSegmentedControl1Page> {
  // initialize global widget
  final _globalWidget = GlobalWidget();

  int? _groupValue = 0;

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
                    title: 'Cupertino Sliding Segmented Control 1 - Standart',
                    desc: 'This is the example of standart Cupertino Sliding Segmented Control'
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.symmetric(vertical: 8),
                child: CupertinoSlidingSegmentedControl<int>(
                  groupValue: _groupValue,
                  children: {
                    0: Text('Option 1'),
                    1: Text('Option 2'),
                    2: Text('Option 3'),
                  },
                  onValueChanged: (groupValue) {
                    print(groupValue);
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
