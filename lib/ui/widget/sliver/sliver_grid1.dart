import 'package:flutter/material.dart';

class SliverGrid1Page extends StatefulWidget {
  @override
  _SliverGrid1PageState createState() => _SliverGrid1PageState();
}

class _SliverGrid1PageState extends State<SliverGrid1Page> {
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
              title: Text('Sliver Grid 1'),
              floating: true,
              backgroundColor: Colors.pinkAccent,
              expandedHeight: 200,
            ),
            SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
              ) ,
              delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
                return new Container(
                  color: _randomColor(index),
                  child: Center(
                    child: Text((index+1).toString()),
                  ),
                );
              }, childCount: 52,),
            ),
          ],
        )
    );
  }

  Color _randomColor(int index) {
    if (index % 3 == 0) {
      return Colors.yellow;
    } else if (index % 3 == 1) {
      return Colors.green;
    }
    return Colors.pinkAccent;
  }
}
