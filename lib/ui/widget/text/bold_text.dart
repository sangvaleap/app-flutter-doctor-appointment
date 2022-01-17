import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';

class BoldTextPage extends StatefulWidget {
  @override
  _BoldTextPageState createState() => _BoldTextPageState();
}

class _BoldTextPageState extends State<BoldTextPage> {
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
                title: 'Bold Text',
                desc: 'This is the example of text with different bold'
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 8),
              child: Text('lorem ipsum dolor sit amet', style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.normal
              )),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 8),
              child: Text('lorem ipsum dolor sit amet', style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w100
              )),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 8),
              child: Text('lorem ipsum dolor sit amet', style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w200
              )),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 8),
              child: Text('lorem ipsum dolor sit amet', style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w300
              )),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 8),
              child: Text('lorem ipsum dolor sit amet', style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400
              )),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 8),
              child: Text('lorem ipsum dolor sit amet', style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500
              )),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 8),
              child: Text('lorem ipsum dolor sit amet', style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600
              )),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 8),
              child: Text('lorem ipsum dolor sit amet', style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700
              )),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 8),
              child: Text('lorem ipsum dolor sit amet', style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w800
              )),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 8),
              child: Text('lorem ipsum dolor sit amet', style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w900
              )),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 8),
              child: Text('lorem ipsum dolor sit amet', style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold
              )),
            ),
          ],
        )
    );
  }
}
