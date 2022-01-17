import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CupertinoSegmentedControl3Page extends StatefulWidget {
  @override
  _CupertinoSegmentedControl3PageState createState() => _CupertinoSegmentedControl3PageState();
}

class _CupertinoSegmentedControl3PageState extends State<CupertinoSegmentedControl3Page> {
  // initialize global widget
  final _globalWidget = GlobalWidget();

  int _selectedIndex = 0;
  Map<int, Widget> _map = {
    0: Text('Option 1'),
    1: Text('Option 2'),
    2: Text('Option 3'),
  };

  @override
  void initState() {
    super.initState();

    _map.putIfAbsent(4, () => Text('Option 4'));
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
                    title: 'Cupertino Segmented Control 3 - with Map',
                    desc: 'This is the example of Cupertino Segmented Control with map'
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.symmetric(vertical: 8),
                child: CupertinoSegmentedControl<int>(
                  groupValue: _selectedIndex,
                  children: _map,
                  onValueChanged: (groupValue) {
                    setState(() {
                      _selectedIndex = groupValue;
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
