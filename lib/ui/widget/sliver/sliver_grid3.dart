import 'package:flutter/material.dart';

class SliverGrid3Page extends StatefulWidget {
  @override
  _SliverGrid3PageState createState() => _SliverGrid3PageState();
}

class _SliverGrid3PageState extends State<SliverGrid3Page> {
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
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              title: Text('Sliver Grid 3'),
              floating: true,
              backgroundColor: Colors.pinkAccent,
              expandedHeight: 200,
            ),
            SliverPadding(
              padding: EdgeInsets.all(8),
              sliver: SliverGrid.count(
                crossAxisCount: 4,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                children: [
                  Container(color: Colors.red, height: 150.0),
                  Container(color: Colors.purple, height: 150.0),
                  Container(color: Colors.green, height: 150.0),
                  Container(color: Colors.orange, height: 150.0),
                  Container(color: Colors.yellow, height: 150.0),
                  Container(color: Colors.pink, height: 150.0),
                  Container(color: Colors.cyan, height: 150.0),
                  Container(color: Colors.indigo, height: 150.0),
                  Container(color: Colors.blue, height: 150.0),
                ],
              ),
            ),
          ],
        )
    );
  }
}
