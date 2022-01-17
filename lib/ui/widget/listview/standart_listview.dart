import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';

class StandartListviewPage extends StatefulWidget {
  @override
  _StandartListviewPageState createState() => _StandartListviewPageState();
}

class _StandartListviewPageState extends State<StandartListviewPage> {
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
        body: ListView( // this is start of example
          padding: EdgeInsets.fromLTRB(24, 24, 24, 16),
          children: [
            _globalWidget.createDetailWidget(
                title: 'Standart ListView',
                desc: 'This is the example of listview without any style'
            ),
            Text('data 1'),
            Text('data 2'),
            Text('data 3'),
            Text('data 4'),
            Text('data 5'),
          ],
        )
    );
  }
}
