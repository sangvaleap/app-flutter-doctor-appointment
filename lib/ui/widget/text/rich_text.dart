import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';

class RichTextPage extends StatefulWidget {
  @override
  _RichTextPageState createState() => _RichTextPageState();
}

class _RichTextPageState extends State<RichTextPage> {
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
                title: 'Rich Text',
                desc: 'This is the example of rich text'
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 8),
              child: RichText(
                text: TextSpan(
                  // style is the default style for all rich text
                  // to change the specific text, you have to change it at textspan
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.black,
                  ),
                  children: <TextSpan>[
                    TextSpan(text: 'lorem '),
                    TextSpan(text: 'ipsum ', style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(text: 'dolor ', style: TextStyle(color: Colors.red)),
                    TextSpan(text: 'sit ', style: TextStyle(fontStyle: FontStyle.italic)),
                    TextSpan(text: 'amet', style: TextStyle(fontSize: 20)),
                  ],
                ),
              ),
            ),
          ],
        )
    );
  }
}
