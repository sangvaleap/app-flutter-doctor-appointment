import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';

class CupertinoDateTimePicker4Page extends StatefulWidget {
  @override
  _CupertinoDateTimePicker4PageState createState() => _CupertinoDateTimePicker4PageState();
}

class _CupertinoDateTimePicker4PageState extends State<CupertinoDateTimePicker4Page> {
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
                  title: 'Cupertino Date & Time Picker 4 - with Dialog',
                  desc: 'This is the example of Cupertino Date & Time Picker with dialog'
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 8),
              child: _globalWidget.createButton(
                  buttonName: 'Show Cupertino Date & Time Picker',
                  onPressed: (){
                    showCupertinoModalPopup<void>(
                      context: context,
                      builder: (BuildContext context) => CupertinoActionSheet(
                        actions: [
                          SizedBox(
                            height: 180,
                            child: CupertinoDatePicker(
                              initialDateTime: _dateTime,
                              minimumDate: DateTime(DateTime.now().year, 10, 10),
                              maximumDate: DateTime.now(),
                              mode: CupertinoDatePickerMode.dateAndTime,
                              onDateTimeChanged: (dateTime){
                                setState(() {
                                  _dateTime = dateTime;
                                });
                              },
                            ),
                          )
                        ],
                        cancelButton: CupertinoActionSheetAction(
                          child: Text('Done'),
                          onPressed: (){
                            final value = DateFormat('MMMM dd, yyyy HH:mm').format(_dateTime);
                            Fluttertoast.showToast(msg: value, toastLength: Toast.LENGTH_SHORT);
                            Navigator.pop(context);
                          },
                        ),
                      ),
                    );
                  }
              ),
            ),
          ],
        ),
      ),
    );
  }
}
