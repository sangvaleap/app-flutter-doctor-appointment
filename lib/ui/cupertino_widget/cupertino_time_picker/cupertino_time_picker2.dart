import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CupertinoTimePicker2Page extends StatefulWidget {
  @override
  _CupertinoTimePicker2PageState createState() => _CupertinoTimePicker2PageState();
}

class _CupertinoTimePicker2PageState extends State<CupertinoTimePicker2Page> {
  // initialize global widget
  final _globalWidget = GlobalWidget();

  DateTime _dateTime = DateTime.now();
  DateTime _dateTime2 = DateTime.now();

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
            Container(
              child: _globalWidget.createDetailWidget(
                  title: 'Cupertino Time Picker 2 - Time Format',
                  desc: 'This is the example of Cupertino Time Picker with time format'
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 8),
              child: SizedBox(
                height: 180,
                child: CupertinoDatePicker(
                  initialDateTime: _dateTime,
                  mode: CupertinoDatePickerMode.time,
                  use24hFormat: true,
                  onDateTimeChanged: (dateTime){
                    setState(() {
                      _dateTime = dateTime;
                    });
                  },
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 8),
              child: SizedBox(
                height: 180,
                child: CupertinoDatePicker(
                  initialDateTime: _dateTime2,
                  mode: CupertinoDatePickerMode.time,
                  use24hFormat: false,
                  onDateTimeChanged: (dateTime){
                    setState(() {
                      _dateTime2 = dateTime;
                    });
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
