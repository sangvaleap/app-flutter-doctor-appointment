import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CupertinoTimePicker3Page extends StatefulWidget {
  @override
  _CupertinoTimePicker3PageState createState() => _CupertinoTimePicker3PageState();
}

class _CupertinoTimePicker3PageState extends State<CupertinoTimePicker3Page> {
  // initialize global widget
  final _globalWidget = GlobalWidget();

  DateTime _dateTime = DateTime.now();

  @override
  void initState() {
    super.initState();

    _dateTime = _getDateTime();
  }

  @override
  void dispose() {
    super.dispose();
  }

  DateTime _getDateTime(){
    final now = DateTime.now();
    return DateTime(now.year, now.month, now.day, now.hour, 0);
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
                  title: 'Cupertino Time Picker 3 - Minute Interval',
                  desc: 'This is the example of Cupertino Time Picker with minute interval'
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
                  minuteInterval: 10,
                  onDateTimeChanged: (dateTime){
                    setState(() {
                      _dateTime = dateTime;
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
