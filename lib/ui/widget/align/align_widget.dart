import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';

class AlignWidgetPage extends StatefulWidget {
  @override
  _AlignWidgetPageState createState() => _AlignWidgetPageState();
}

class _AlignWidgetPageState extends State<AlignWidgetPage> {
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
            _globalWidget.createDetailWidget2(
                title: 'Align Widget',
                desc: 'Align Widget used to do some alignment.',
                icon: Icons.text_format
            ),
            Container(
                margin: EdgeInsets.only(top: 10, bottom: 8),
                child: Text('Align top left')
            ),
            Container(
              height: 150,
              color: Colors.pinkAccent,
              child: Align(
                alignment: Alignment.topLeft,
                child: Text('Text', style: TextStyle(
                    color: Colors.white
                )),
              ),
            ),
            Container(
                margin: EdgeInsets.only(top: 20, bottom: 8),
                child: Text('Align top center')
            ),
            Container(
              height: 150,
              color: Colors.pinkAccent,
              child: Align(
                alignment: Alignment.topCenter,
                child: Text('Text', style: TextStyle(
                    color: Colors.white
                )),
              ),
            ),
            Container(
                margin: EdgeInsets.only(top: 20, bottom: 8),
                child: Text('Align top right')
            ),
            Container(
              height: 150,
              color: Colors.pinkAccent,
              child: Align(
                alignment: Alignment.topRight,
                child: Text('Text', style: TextStyle(
                    color: Colors.white
                )),
              ),
            ),
            Container(
                margin: EdgeInsets.only(top: 20, bottom: 8),
                child: Text('Align center left')
            ),
            Container(
              height: 150,
              color: Colors.pinkAccent,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text('Text', style: TextStyle(
                    color: Colors.white
                )),
              ),
            ),
            Container(
                margin: EdgeInsets.only(top: 20, bottom: 8),
                child: Text('Align center')
            ),
            Container(
              height: 150,
              color: Colors.pinkAccent,
              child: Align(
                alignment: Alignment.center,
                child: Text('Text', style: TextStyle(
                    color: Colors.white
                )),
              ),
            ),
            Container(
                margin: EdgeInsets.only(top: 20, bottom: 8),
                child: Text('Align center right')
            ),
            Container(
              height: 150,
              color: Colors.pinkAccent,
              child: Align(
                alignment: Alignment.centerRight,
                child: Text('Text', style: TextStyle(
                    color: Colors.white
                )),
              ),
            ),
            Container(
                margin: EdgeInsets.only(top: 20, bottom: 8),
                child: Text('Align bottom left')
            ),
            Container(
              height: 150,
              color: Colors.pinkAccent,
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Text('Text', style: TextStyle(
                    color: Colors.white
                )),
              ),
            ),
            Container(
                margin: EdgeInsets.only(top: 20, bottom: 8),
                child: Text('Align bottom center')
            ),
            Container(
              height: 150,
              color: Colors.pinkAccent,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Text('Text', style: TextStyle(
                    color: Colors.white
                )),
              ),
            ),
            Container(
                margin: EdgeInsets.only(top: 20, bottom: 8),
                child: Text('Align bottom right')
            ),
            Container(
              height: 150,
              color: Colors.pinkAccent,
              child: Align(
                alignment: Alignment.bottomRight,
                child: Text('Text', style: TextStyle(
                    color: Colors.white
                )),
              ),
            ),
          ],
        )
    );
  }
}
