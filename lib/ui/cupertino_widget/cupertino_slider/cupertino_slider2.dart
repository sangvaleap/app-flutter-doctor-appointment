import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CupertinoSlider2Page extends StatefulWidget {
  @override
  _CupertinoSlider2PageState createState() => _CupertinoSlider2PageState();
}

class _CupertinoSlider2PageState extends State<CupertinoSlider2Page> {
  // initialize global widget
  final _globalWidget = GlobalWidget();

  double _val1 = 10;

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
                    title: 'Cupertino Slider 2 - Properties',
                    desc: 'This is the example of Cupertino Slider with properties'
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 8),
                child: CupertinoSlider(
                  value: _val1,
                  min: 0,
                  max: 100,
                  divisions: 10,
                  thumbColor: Colors.red,
                  activeColor: Colors.blueAccent,
                  onChanged: (double value) {
                    setState(() {
                      _val1 = value;
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
