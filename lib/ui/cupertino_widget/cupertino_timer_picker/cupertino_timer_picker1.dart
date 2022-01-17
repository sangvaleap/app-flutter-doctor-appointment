import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CupertinoTimerPicker1Page extends StatefulWidget {
  @override
  _CupertinoTimerPicker1PageState createState() => _CupertinoTimerPicker1PageState();
}

class _CupertinoTimerPicker1PageState extends State<CupertinoTimerPicker1Page> {
  // initialize global widget
  final _globalWidget = GlobalWidget();

  Duration _timerDuration = Duration(minutes: 5);

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
                  title: 'Cupertino Timer Picker 1 - Standart',
                  desc: 'This is the example of standart Cupertino Timer Picker'
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 8),
              child: SizedBox(
                height: 180,
                child: CupertinoTimerPicker(
                  initialTimerDuration: _timerDuration,
                  mode: CupertinoTimerPickerMode.hms,
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
