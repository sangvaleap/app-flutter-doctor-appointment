import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';

class StandartTextPage extends StatefulWidget {
  @override
  _StandartTextPageState createState() => _StandartTextPageState();
}

class _StandartTextPageState extends State<StandartTextPage> {
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
        body: ListView(
          padding: EdgeInsets.fromLTRB(24, 24, 24, 16),
          children: [
            _globalWidget.createDetailWidget(
                title: 'Standart Text',
                desc: 'This is the example of text without any style'
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 8),
              child: Text('lorem ipsum dolor sit amet'),
            ),
          ],
        )
    );
  }
}
