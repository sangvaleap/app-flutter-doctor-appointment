import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';

class StandartIconPage extends StatefulWidget {
  @override
  _StandartIconPageState createState() => _StandartIconPageState();
}

class _StandartIconPageState extends State<StandartIconPage> {
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _globalWidget.createDetailWidget(
                  title: 'Standart Icon',
                  desc: 'This is the example of icon'
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 8),
                child: Wrap(
                  spacing: 32,
                  children: [
                    Icon(Icons.android_outlined),
                    Icon(Icons.android_outlined, color: Colors.pinkAccent),
                    Icon(Icons.android_outlined, size: 40),
                  ],
                ),
              ),
            ],
          ),
        )
    );
  }
}
