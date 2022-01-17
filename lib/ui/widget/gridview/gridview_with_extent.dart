import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';

class GridviewWithExtentPage extends StatefulWidget {
  @override
  _GridviewWithExtentPageState createState() => _GridviewWithExtentPageState();
}

class _GridviewWithExtentPageState extends State<GridviewWithExtentPage> {
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
        body: GridView.extent(
          padding: EdgeInsets.all(8),
          maxCrossAxisExtent: MediaQuery.of(context).size.width/2,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
          children: [
            Container(
              padding: EdgeInsets.all(8),
              child: Text('First', style: TextStyle(fontSize: 20)),
              color: Colors.yellow,
            ),
            Container(
              margin: EdgeInsets.all(8),
              padding: EdgeInsets.all(8),
              child: Text('Second', style: TextStyle(fontSize: 20)),
              color: Colors.blue,
            ),
            Container(
              margin: EdgeInsets.only(top: 16),
              padding: EdgeInsets.all(8),
              child: Text('Third', style: TextStyle(fontSize: 20)),
              color: Colors.blue,
            ),
            Container(
              margin: EdgeInsets.only(bottom: 16),
              padding: EdgeInsets.all(8),
              child: Text('Four', style: TextStyle(fontSize: 20)),
              color: Colors.yellow,
            ),
            Container(
              margin: EdgeInsets.only(left: 16),
              padding: EdgeInsets.all(8),
              child: Text('Fifth', style: TextStyle(fontSize: 20)),
              color: Colors.yellow,
            ),
            Container(
              margin: EdgeInsets.only(right: 16),
              padding: EdgeInsets.all(8),
              child: Text('Six', style: TextStyle(fontSize: 20)),
              color: Colors.blue,
            ),
          ],
        )
    );
  }
}
