import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CupertinoDateTimePicker1Page extends StatefulWidget {
  @override
  _CupertinoDateTimePicker1PageState createState() => _CupertinoDateTimePicker1PageState();
}

class _CupertinoDateTimePicker1PageState extends State<CupertinoDateTimePicker1Page> {
  // initialize global widget
  final _globalWidget = GlobalWidget();

  DateTime _dateTime = DateTime.now();

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
                  title: 'Cupertino Date & Time Picker 1 - Standart',
                  desc: 'This is the example of standart Cupertino Date & Time Picker'
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 8),
              child: SizedBox(
                height: 180,
                child: CupertinoDatePicker(
                  initialDateTime: _dateTime,
                  mode: CupertinoDatePickerMode.dateAndTime,
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
