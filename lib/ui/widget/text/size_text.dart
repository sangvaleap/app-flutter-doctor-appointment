import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';

class SizeTextPage extends StatefulWidget {
  @override
  _SizeTextPageState createState() => _SizeTextPageState();
}

class _SizeTextPageState extends State<SizeTextPage> {
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
                title: 'Size Text',
                desc: 'This is the example of text with different size'
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 8),
              child: Text('lorem ipsum dolor sit amet', style: TextStyle(
                  fontSize: 12
              )),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 8),
              child: Text('lorem ipsum dolor sit amet', style: TextStyle(
                  fontSize: 14
              )),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 8),
              child: Text('this text size is using scale factor', textScaleFactor: 1.8),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 8),
              child: Text('lorem ipsum dolor sit amet', style: TextStyle(
                  fontSize: 16
              )),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 8),
              child: Text('lorem ipsum dolor sit amet', style: TextStyle(
                  fontSize: 20
              )),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 8),
              child: Text('lorem ipsum dolor sit amet', style: TextStyle(
                  fontSize: 24
              )),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 8),
              child: Text('lorem ipsum dolor sit amet', style: TextStyle(
                  fontSize: 30
              )),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 8),
              child: Text('lorem ipsum dolor sit amet', style: TextStyle(
                  fontSize: 36
              )),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 8),
              child: Text('lorem ipsum dolor sit amet', style: TextStyle(
                  fontSize: 48
              )),
            ),
          ],
        )
    );
  }
}
