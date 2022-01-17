import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';

class ExpandedWidgetPage extends StatefulWidget {
  @override
  _ExpandedWidgetPageState createState() => _ExpandedWidgetPageState();
}

class _ExpandedWidgetPageState extends State<ExpandedWidgetPage> {
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
                title: 'Expanded Widget',
                desc: 'Expanded Widget used to fit the rest of screen.',
                icon: Icons.sync_alt
            ),
            Container(
                margin: EdgeInsets.only(top: 10, bottom: 8),
                child: Text('Horizontal expanded')
            ),
            Container(
              height: 100,
              color: Colors.grey[200],
              child: Row(
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    color: Colors.pinkAccent,
                  ),
                  Expanded(
                    child: Container(
                      height: 50,
                      color: Colors.green,
                      child: Center(child: Text('Expanded', style: TextStyle(color: Colors.white))),
                    ),
                  )
                ],
              ),
            ),
            Container(
                margin: EdgeInsets.only(top: 20, bottom: 8),
                child: Text('Vertical expanded')
            ),
            Container(
              height: 300,
              color: Colors.grey[200],
              child: Column(
                children: [
                  Container(
                    width: 100,
                    height: 50,
                    color: Colors.pinkAccent,
                  ),
                  Expanded(
                    child: Container(
                      width: 100,
                      color: Colors.green,
                      child: Center(child: Text('Expanded', style: TextStyle(color: Colors.white))),
                    ),
                  )
                ],
              ),
            )
          ],
        )
    );
  }
}
