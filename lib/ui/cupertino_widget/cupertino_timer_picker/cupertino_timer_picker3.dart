import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CupertinoTimerPicker3Page extends StatefulWidget {
  @override
  _CupertinoTimerPicker3PageState createState() => _CupertinoTimerPicker3PageState();
}

class _CupertinoTimerPicker3PageState extends State<CupertinoTimerPicker3Page> {
  // initialize global widget
  final _globalWidget = GlobalWidget();

  Duration _timerDuration = Duration(hours: 2, minutes: 20, seconds: 57);

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  String _formatDuration(Duration duration){
    String twoDigits(int n){
      return n.toString().padLeft(2, '0');
    }

    final hours = twoDigits(duration.inHours);
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inHours.remainder(60));

    return hours+':'+minutes+':'+seconds;
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
                  title: 'Cupertino Timer Picker 3 - with Dialog',
                  desc: 'This is the example of Cupertino Timer Picker with dialog'
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 8),
              child: _globalWidget.createButton(
                  buttonName: 'Show Cupertino Timer Picker',
                  onPressed: (){
                    showCupertinoModalPopup<void>(
                      context: context,
                      builder: (BuildContext context) => CupertinoActionSheet(
                        actions: [
                          SizedBox(
                            height: 180,
                            child: CupertinoTimerPicker(
                              initialTimerDuration: _timerDuration,
                              mode: CupertinoTimerPickerMode.hms,
                              minuteInterval: 10,
                              secondInterval: 3,
                              onTimerDurationChanged: (duration){
                                setState(() {
                                  _timerDuration = duration;
                                });
                              },
                            ),
                          )
                        ],
                        cancelButton: CupertinoActionSheetAction(
                          child: Text('Done'),
                          onPressed: (){
                            final value = _formatDuration(_timerDuration);
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
