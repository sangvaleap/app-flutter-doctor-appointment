import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CupertinoTimerPicker2Page extends StatefulWidget {
  @override
  _CupertinoTimerPicker2PageState createState() => _CupertinoTimerPicker2PageState();
}

class _CupertinoTimerPicker2PageState extends State<CupertinoTimerPicker2Page> {
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
                  title: 'Cupertino Timer Picker 2 - Interval',
                  desc: 'This is the example of Cupertino Timer Picker with interval'
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 8),
              child: SizedBox(
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
