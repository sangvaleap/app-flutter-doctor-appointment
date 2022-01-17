import 'dart:async';

import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';

class LinearProgressIndicatorPage extends StatefulWidget {
  @override
  _LinearProgressIndicatorPageState createState() => _LinearProgressIndicatorPageState();
}

class _LinearProgressIndicatorPageState extends State<LinearProgressIndicatorPage> {
  // initialize global widget
  final _globalWidget = GlobalWidget();

  Timer? _timer;
  double _progress = 0;
  void _startTimer() {
    _timer = Timer.periodic(Duration(milliseconds: 100), (Timer timer){
      setState(() {
        if (_progress >= 1) {
          _cancelTimer();
        } else {
          _progress += 0.01;
        }
      });
    });
  }

  void _cancelTimer() {
    if (_timer != null) {
      _timer!.cancel();
      _timer = null;
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _cancelTimer();
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
              _globalWidget.createDetailWidget(
                  title: 'Linear Progress Indicator',
                  desc: 'This is the example of linear progress indicator'
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 8),
                child: Container(
                  child: LinearProgressIndicator(), // please note that width of container will not work if the container is inside ListView
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 8),
                child: Container(
                  child: LinearProgressIndicator(
                    minHeight: 20,
                  ), // please note that width of container will not work if the container is inside ListView
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 8),
                child: Container(
                  child: LinearProgressIndicator(
                    backgroundColor: Colors.pinkAccent,
                  ), // please note that width of container will not work if the container is inside ListView
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 8),
                child: Container(
                  child: LinearProgressIndicator(
                    backgroundColor: Colors.pinkAccent,
                    valueColor: new AlwaysStoppedAnimation<Color>(Colors.green),
                  ), // please note that width of container will not work if the container is inside ListView
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20, bottom: 10),
                child: Text('With value'),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  LinearProgressIndicator(
                    backgroundColor: Colors.cyanAccent,
                    valueColor: new AlwaysStoppedAnimation<Color>(Colors.red),
                    value: _progress,
                  ),
                  SizedBox(height: 16),
                  _globalWidget.createButton(
                      buttonName: 'Start timer',
                      onPressed: (){
                        if(_timer == null){
                          _progress = 0;
                          _startTimer();
                        }
                      }
                  ),
                ],
              ),
            ],
          ),
        )
    );
  }
}
