import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';

class DecorationTextPage extends StatefulWidget {
  @override
  _DecorationTextPageState createState() => _DecorationTextPageState();
}

class _DecorationTextPageState extends State<DecorationTextPage> {
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
                title: 'Decoration Text',
                desc: 'This is the example of text with decoration'
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 8),
              child: Text('lorem ipsum dolor sit amet', style: TextStyle(
                  fontSize: 16,
                  decoration: TextDecoration.overline
              )),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 8),
              child: Text('lorem ipsum dolor sit amet', style: TextStyle(
                  fontSize: 16,
                  decoration: TextDecoration.lineThrough,
              )),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 8),
              child: Text('lorem ipsum dolor sit amet', style: TextStyle(
                  fontSize: 16,
                  decoration: TextDecoration.underline
              )),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 8),
              child: Text('lorem ipsum dolor sit amet', style: TextStyle(
                  fontSize: 16,
                  decoration: TextDecoration.lineThrough,
                  decorationThickness: 2.85
              )),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 8),
              child: Text('lorem ipsum dolor sit amet', style: TextStyle(
                  fontSize: 16,
                  decoration: TextDecoration.lineThrough,
                  decorationColor: Colors.red
              )),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 8),
              child: Text('lorem ipsum dolor sit amet', style: TextStyle(
                  fontSize: 16,
                  decoration: TextDecoration.underline,
                  decorationStyle: TextDecorationStyle.dashed,
                  decorationThickness: 2.85
              )),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 8),
              child: Text('lorem ipsum dolor sit amet', style: TextStyle(
                  fontSize: 16,
                  decoration: TextDecoration.underline,
                  decorationStyle: TextDecorationStyle.double
              )),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 8),
              child: Text('lorem ipsum dolor sit amet', style: TextStyle(
                  fontSize: 16,
                  decoration: TextDecoration.underline,
                  decorationStyle: TextDecorationStyle.dotted,
                  decorationThickness: 2.85
              )),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 8),
              child: Text('lorem ipsum dolor sit amet', style: TextStyle(
                  fontSize: 16,
                  decoration: TextDecoration.underline,
                  decorationStyle: TextDecorationStyle.wavy,
                  decorationThickness: 2.85
              )),
            ),
          ],
        )
    );
  }
}
