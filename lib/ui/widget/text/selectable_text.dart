import 'package:doctor_app/config/constant.dart';
import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';

class SelectableTextPage extends StatefulWidget {
  @override
  _SelectableTextPageState createState() => _SelectableTextPageState();
}

class _SelectableTextPageState extends State<SelectableTextPage> {
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
                title: 'Selectable Text & Selectable Rich Text',
                desc: 'This is the example of selectable text & selectable rich text'
            ),
            Container(
                margin: EdgeInsets.only(top: 10),
                child: Text('Selectable text', style: TextStyle(color: SOFT_BLUE))
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 8),
              child: SelectableText(
                'You can select this text by tap and hold on this text',
              ),
            ),
            Container(
                margin: EdgeInsets.only(top: 20),
                child: Text('Selectable rich text', style: TextStyle(color: SOFT_BLUE))
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 8),
              child: SelectableText.rich(
                TextSpan(
                  text: 'Hello', // default text style
                  children: <TextSpan>[
                    TextSpan(text: ' beautiful ', style: TextStyle(fontStyle: FontStyle.italic)),
                    TextSpan(text: 'world', style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            ),
          ],
        )
    );
  }
}
