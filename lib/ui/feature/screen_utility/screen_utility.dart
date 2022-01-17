import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ScreenUtilityPage extends StatefulWidget {
  @override
  _ScreenUtilityPageState createState() => _ScreenUtilityPageState();
}

class _ScreenUtilityPageState extends State<ScreenUtilityPage> {
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
    ScreenUtil.init(
        BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width,
            maxHeight: MediaQuery.of(context).size.height
        ),
        designSize: Size(388, 799),
    );
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: _globalWidget.globalAppBar(),
        body: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(24, 24, 24, 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _globalWidget.createDetailWidget(
                  title: 'Screen Utility',
                  desc: 'A flutter plugin for adapting screen and font size.Let your UI display a reasonable layout on different screen sizes!'
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 8),
                // this is the start of example
                child: Text('Hello, check this text on another screen devices. Hello, check this text on another screen devices. Hello, check this text on another screen devices.', style: TextStyle(
                    fontSize: 14.sp
                )),
              ),
            ],
          ),
        )
    );
  }
}
