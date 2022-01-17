import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';

class CupertinoDatePicker2Page extends StatefulWidget {
  @override
  _CupertinoDatePicker2PageState createState() => _CupertinoDatePicker2PageState();
}

class _CupertinoDatePicker2PageState extends State<CupertinoDatePicker2Page> {
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
                  title: 'Cupertino Date Picker 2 - with Dialog',
                  desc: 'This is the example of Cupertino Date Picker with dialog'
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 8),
              child: _globalWidget.createButton(
                  buttonName: 'Show Cupertino Date Picker',
                  onPressed: (){
                    showCupertinoModalPopup<void>(
                      context: context,
                      builder: (BuildContext context) => CupertinoActionSheet(
                        actions: [
                          SizedBox(
                            height: 180,
                            child: CupertinoDatePicker(
                              initialDateTime: _dateTime,
                              minimumYear: 2018,
                              maximumYear: DateTime.now().year+3,
                              mode: CupertinoDatePickerMode.date,
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
                            final value = DateFormat('MMMM dd, yyyy').format(_dateTime);
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
