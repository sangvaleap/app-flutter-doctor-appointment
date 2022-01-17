import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CupertinoSlider1Page extends StatefulWidget {
  @override
  _CupertinoSlider1PageState createState() => _CupertinoSlider1PageState();
}

class _CupertinoSlider1PageState extends State<CupertinoSlider1Page> {
  // initialize global widget
  final _globalWidget = GlobalWidget();

  double _val1 = 5;

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
                    title: 'Cupertino Slider 1 - Standart',
                    desc: 'This is the example of standart Cupertino Slider'
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 8),
                child: CupertinoSlider(
                  value: _val1,
                  min: 0,
                  max: 10,
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
