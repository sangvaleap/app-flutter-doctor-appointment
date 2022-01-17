import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';

class SliderWidgetPage extends StatefulWidget {
  @override
  _SliderWidgetPageState createState() => _SliderWidgetPageState();
}

class _SliderWidgetPageState extends State<SliderWidgetPage> {
  // initialize global widget
  final _globalWidget = GlobalWidget();

  double _val1 = 10;
  double _val2 = 20;
  double _val3 = 30;
  double _val4 = 40;
  double _val5 = 50;
  double _val6 = 60;
  RangeValues _val7 = const RangeValues(20, 80);

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
              _globalWidget.createDetailWidget(
                  title: 'Slider Widget',
                  desc: 'This is the example of Slider'
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                child: Text('Standart slider'),
              ),
              Container(
                  margin: EdgeInsets.symmetric(vertical: 8),
                  child: Slider(
                    value: _val1,
                    min: 0,
                    max: 100,
                    divisions: 10,
                    label: _val1.round().toString(),
                    onChanged: (double value) {
                      setState(() {
                        _val1 = value;
                      });
                    },
                  )
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                child: Text('Without label'),
              ),
              Container(
                  margin: EdgeInsets.symmetric(vertical: 8),
                  child: Slider(
                    value: _val2,
                    min: 0,
                    max: 100,
                    divisions: 5,
                    onChanged: (double value) {
                      setState(() {
                        _val2 = value;
                      });
                    },
                  )
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                child: Text('Without divisions'),
              ),
              Container(
                  margin: EdgeInsets.symmetric(vertical: 8),
                  child: Slider(
                    value: _val3,
                    min: 0,
                    max: 100,
                    onChanged: (double value) {
                      setState(() {
                        _val3 = value;
                      });
                    },
                  )
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                child: Text('Change color & show label'),
              ),
              Container(
                  margin: EdgeInsets.symmetric(vertical: 8),
                  child: SliderTheme(
                    data: SliderThemeData(
                      showValueIndicator: ShowValueIndicator.always,
                      valueIndicatorColor: Colors.cyan,
                    ),
                    child: Slider(
                      value: _val4,
                      min: 0,
                      max: 100,
                      label: _val4.round().toString(),
                      activeColor: Colors.pinkAccent,
                      onChanged: (double value) {
                        setState(() {
                          _val4 = value;
                        });
                      },
                    ),
                  )
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                child: Text('Change inactive color & label size'),
              ),
              Container(
                  margin: EdgeInsets.symmetric(vertical: 8),
                  child: SliderTheme(
                    data: SliderThemeData(
                      showValueIndicator: ShowValueIndicator.always,
                      valueIndicatorTextStyle: TextStyle(color: Colors.pinkAccent, fontSize: 40, fontWeight: FontWeight.bold)
                    ),
                    child: Slider(
                      value: _val5,
                      min: 0,
                      max: 100,
                      label: _val5.round().toString(),
                      activeColor: Colors.pinkAccent,
                      inactiveColor: Colors.green,
                      onChanged: (double value) {
                        setState(() {
                          _val5 = value;
                        });
                      },
                    ),
                  )
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                child: Text('Custom slider'),
              ),
              Container(
                height: 30,
                child: SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    activeTrackColor: Colors.pinkAccent,
                    inactiveTrackColor: Colors.orangeAccent.withAlpha(150),
                    trackHeight: 1,
                    thumbColor: Colors.green,
                    thumbShape: RoundSliderThumbShape(enabledThumbRadius: 5),
                    overlayColor: Colors.blue.withAlpha(32),
                  ),
                  child: Slider(
                    value: _val6,
                    label: _val6.toString(),
                    min: 0,
                    max: 100,
                    divisions: 5,
                    onChanged: (newValue) {
                      setState(() {
                        _val6 = newValue;
                      });
                    },
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                child: Text('Range Slider'),
              ),
              Container(
                height: 30,
                child: RangeSlider(
                  values: _val7,
                  min: 0,
                  max: 100,
                  divisions: 10,
                  activeColor: Colors.pinkAccent,
                  inactiveColor: Colors.orangeAccent,
                  labels: RangeLabels(
                    _val7.start.round().toString(),
                    _val7.end.round().toString(),
                  ),
                  onChanged: (RangeValues values) {
                    setState(() {
                      _val7 = values;
                    });
                  },
                ),
              ),
            ],
          ),
        )
    );
  }
}
