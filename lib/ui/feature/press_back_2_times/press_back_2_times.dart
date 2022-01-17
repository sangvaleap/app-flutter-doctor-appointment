import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class PressBack2TimesPage extends StatefulWidget {
  @override
  _PressBack2TimesPageState createState() => _PressBack2TimesPageState();
}

class _PressBack2TimesPageState extends State<PressBack2TimesPage> {
  // initialize global widget
  final _globalWidget = GlobalWidget();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  // this function is used for exit the application, user must click back button two times
  DateTime? _currentBackPressTime;
  Future<bool> _onWillPop() {
    DateTime now = DateTime.now();
    if (_currentBackPressTime == null || now.difference(_currentBackPressTime!) > Duration(seconds: 2)) {
      _currentBackPressTime = now;
      Fluttertoast.showToast(msg: 'Press BACK again to back', toastLength: Toast.LENGTH_SHORT);
      return Future.value(false);
    }
    return Future.value(true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: _globalWidget.globalAppBar(),
        body: WillPopScope(
          onWillPop: _onWillPop,
          child: SingleChildScrollView(
            padding: EdgeInsets.fromLTRB(24, 24, 24, 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _globalWidget.createDetailWidget(
                    title: 'Press Back 2 Times',
                    desc: 'Press back 2 times to do something'
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 8),
                  child: Text('This is the example of feature press back 2 times to back to the previous page'),
                )
              ],
            ),
          ),
        )
    );
  }
}
