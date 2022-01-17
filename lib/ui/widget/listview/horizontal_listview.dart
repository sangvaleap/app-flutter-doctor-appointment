import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';

class HorizontalListviewPage extends StatefulWidget {
  @override
  _HorizontalListviewPageState createState() => _HorizontalListviewPageState();
}

class _HorizontalListviewPageState extends State<HorizontalListviewPage> {
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
                title: 'Horizontal ListView',
                desc: 'This is the example of horizontal ListView'
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 8),
              height: 120,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Container(
                    width: 120,
                    color: Colors.red,
                    padding: EdgeInsets.all(8.0),
                    child: Center(child: Text('1')),
                  ),
                  Container(
                    width: 120,
                    color: Colors.green,
                    padding: EdgeInsets.all(8.0),
                    child: Center(child: Text('2')),
                  ),
                  Container(
                    width: 120,
                    color: Colors.blue,
                    padding: EdgeInsets.all(8.0),
                    child: Center(child: Text('3')),
                  ),
                  Container(
                    width: 120,
                    color: Colors.yellow,
                    padding: EdgeInsets.all(8.0),
                    child: Center(child: Text('4')),
                  ),
                  Container(
                    width: 120,
                    color: Colors.blueGrey,
                    padding: EdgeInsets.all(8.0),
                    child: Center(child: Text('5')),
                  ),
                  Container(
                    width: 120,
                    color: Colors.grey,
                    padding: EdgeInsets.all(8.0),
                    child: Center(child: Text('6')),
                  ),
                  Container(
                    width: 120,
                    color: Colors.lightGreen,
                    padding: EdgeInsets.all(8.0),
                    child: Center(child: Text('7')),
                  ),
                  Container(
                    width: 120,
                    color: Colors.brown,
                    padding: EdgeInsets.all(8.0),
                    child: Center(child: Text('8')),
                  ),
                  Container(
                    width: 120,
                    color: Colors.cyan,
                    padding: EdgeInsets.all(8.0),
                    child: Center(child: Text('9')),
                  ),
                  Container(
                    width: 120,
                    color: Colors.deepOrange,
                    padding: EdgeInsets.all(8.0),
                    child: Center(child: Text('10')),
                  ),
                  Container(
                    width: 120,
                    color: Colors.purple,
                    padding: EdgeInsets.all(8.0),
                    child: Center(child: Text('11')),
                  ),
                  Container(
                    width: 120,
                    color: Colors.pink,
                    padding: EdgeInsets.all(8.0),
                    child: Center(child: Text('12')),
                  ),
                  Container(
                    width: 120,
                    color: Colors.tealAccent,
                    padding: EdgeInsets.all(8.0),
                    child: Center(child: Text('13')),
                  )
                ],
              ),
            ),
          ],
        )
    );
  }
}
