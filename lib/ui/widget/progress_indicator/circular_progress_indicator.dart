import 'dart:async';

import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';

class CircularProgressIndicatorPage extends StatefulWidget {
  @override
  _CircularProgressIndicatorPageState createState() => _CircularProgressIndicatorPageState();
}

class _CircularProgressIndicatorPageState extends State<CircularProgressIndicatorPage> {
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
                  title: 'Circular Progress Indicator',
                  desc: 'This is the example of circular progress indicator'
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 8),
                child: Container(
                  child: CircularProgressIndicator(), // please note that width of container will not work if the container is inside ListView
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 8),
                child: Container(
                  child: CircularProgressIndicator(
                    strokeWidth: 1,
                  ), // please note that width of container will not work if the container is inside ListView
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 8),
                child: Container(
                  child: CircularProgressIndicator(
                    strokeWidth: 16,
                  ), // please note that width of container will not work if the container is inside ListView
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 8),
                child: Container(
                  child: CircularProgressIndicator(
                    backgroundColor: Colors.pinkAccent,
                  ), // please note that width of container will not work if the container is inside ListView
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 8),
                child: Container(
                  child: CircularProgressIndicator(
                    backgroundColor: Colors.pinkAccent,
                    valueColor: new AlwaysStoppedAnimation<Color>(Colors.green),
                  ), // please note that width of container will not work if the container is inside ListView
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20, bottom: 10),
                child: Text('With value'),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  CircularProgressIndicator(
                    strokeWidth: 4,
                    backgroundColor: Colors.cyanAccent,
                    valueColor: new AlwaysStoppedAnimation<Color>(Colors.red),
                    value: _progress,
                  ),
                  SizedBox(width: 16),
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
              Container(
                margin: EdgeInsets.symmetric(vertical: 8),
                child: Container(
                  child: SizedBox(
                      width: 200,
                      child: CircularProgressIndicator()
                  ), // please note that width of container will not work if the container is inside ListView
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 8),
                child: Container(
                  child: SizedBox(
                      height: 200,
                      child: CircularProgressIndicator()
                  ), // please note that width of container will not work if the container is inside ListView
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 8),
                child: Container(
                  child: SizedBox(
                      width: 200,
                      height: 200,
                      child: CircularProgressIndicator()
                  ), // please note that width of container will not work if the container is inside ListView
                ),
              ),
            ],
          ),
        )
    );
  }
}
