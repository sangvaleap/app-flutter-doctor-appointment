import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';

class CupertinoTimePicker4Page extends StatefulWidget {
  @override
  _CupertinoTimePicker4PageState createState() => _CupertinoTimePicker4PageState();
}

class _CupertinoTimePicker4PageState extends State<CupertinoTimePicker4Page> {
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
                  title: 'Cupertino Time Picker 4 - with Dialog',
                  desc: 'This is the example of Cupertino Time Picker with dialog'
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 8),
              child: _globalWidget.createButton(
                  buttonName: 'Show Cupertino Time Picker',
                  onPressed: (){
                    showCupertinoModalPopup<void>(
                      context: context,
                      builder: (BuildContext context) => CupertinoActionSheet(
                        actions: [
                          SizedBox(
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
                          )
                        ],
                        cancelButton: CupertinoActionSheetAction(
                          child: Text('Done'),
                          onPressed: (){
                            final value = DateFormat('HH:mm').format(_dateTime);
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
