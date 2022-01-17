import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';

class LetterSpacingTextPage extends StatefulWidget {
  @override
  _LetterSpacingTextPageState createState() => _LetterSpacingTextPageState();
}

class _LetterSpacingTextPageState extends State<LetterSpacingTextPage> {
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
                title: 'Letter Spacing Text',
                desc: 'This is the example of text with different space of each letter'
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 8),
              child: Text('lorem ipsum dolor sit amet', style: TextStyle(
                  fontSize: 16,
                  letterSpacing: 0
              )),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 8),
              child: Text('lorem ipsum dolor sit amet', style: TextStyle(
                  fontSize: 16,
                  letterSpacing: 0.5
              )),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 8),
              child: Text('lorem ipsum dolor sit amet', style: TextStyle(
                  fontSize: 16,
                  letterSpacing: 1
              )),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 8),
              child: Text('lorem ipsum dolor sit amet', style: TextStyle(
                  fontSize: 16,
                  letterSpacing: 2.5
              )),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 8),
              child: Text('lorem ipsum dolor sit amet', style: TextStyle(
                  fontSize: 16,
                  letterSpacing: 4
              )),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 8),
              child: Text('lorem ipsum dolor sit amet', style: TextStyle(
                  fontSize: 16,
                  letterSpacing: 6.5
              )),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 8),
              child: Text('lorem ipsum dolor sit amet', style: TextStyle(
                  fontSize: 16,
                  letterSpacing: 8
              )),
            ),
          ],
        )
    );
  }
}
