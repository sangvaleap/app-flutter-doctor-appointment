/*
https://pub.dev/packages/battery_plus
*/
import 'package:battery_plus/battery_plus.dart';
import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';

class BatteryInformationPage extends StatefulWidget {
  @override
  _BatteryInformationPageState createState() => _BatteryInformationPageState();
}

class _BatteryInformationPageState extends State<BatteryInformationPage> {
  // initialize global widget
  final _globalWidget = GlobalWidget();

  var battery = Battery();
  late int _batteryLevel = 0;

  @override
  void initState() {
    super.initState();
    _getBatteryLevel();
  }

  Future<void> _getBatteryLevel() async {
    _batteryLevel = await battery.batteryLevel;
    setState(() {

    });
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
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _globalWidget.createDetailWidget(
                    title: 'Battery Information',
                    desc: 'This is the example of Battery Information'
                ),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  child: Text('Battery Level'),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 16),
                  child: Text(_batteryLevel.toString()+'%'),
                ),
              ],
            ),
          ),
        )
    );
  }
}
