import 'package:doctor_app/config/constant.dart';
import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';

class NotSupportedForWebPage extends StatefulWidget {
  @override
  _NotSupportedForWebPageState createState() => _NotSupportedForWebPageState();
}

class _NotSupportedForWebPageState extends State<NotSupportedForWebPage> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: _globalWidget.globalAppBar(),
        body: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(24, 24, 24, 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Text('Not Supported For Web', style: TextStyle(
                    fontSize: 18, color: BLACK21, fontWeight: FontWeight.w500
                )),
              ),
              Container(
                margin: EdgeInsets.only(top: 8),
                child: Container(
                  child: Text('This package or plugin are not supported for web when the latest version of DevKit is released.\n\n'
                      'If you find the package or plugin is now supported for web, you can help us by letting us know by email so we can update the package or plugins.\n\n'
                      'Thank you and kind regards', style: TextStyle(
                      fontSize: 15, color: BLACK77,letterSpacing: 0.5
                  )),
                ),
              ),
            ],
          ),
        )
    );
  }
}
