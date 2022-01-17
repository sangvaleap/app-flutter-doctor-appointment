import 'package:flutter/material.dart';
import 'dart:math' as math;

class StickySliverPage extends StatefulWidget {
  @override
  _StickySliverPageState createState() => _StickySliverPageState();
}

class _StickySliverPageState extends State<StickySliverPage> {
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
              title: Text('Sticky Sliver'),
              floating: true,
              backgroundColor: Colors.pinkAccent,
              expandedHeight: 200,
            ),
            makeHeader('Header Section 1'),
            SliverList(
              delegate: SliverChildBuilderDelegate((context, index){
                return ListTile(title: Text('Item #'+(index+1).toString()));
              },
                childCount: 50,
              ),
            ),
            makeHeader('Header Section 2'),
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
              }, childCount: 50,),
            ),
            makeHeader('Header Section 3'),
            SliverList(
              delegate: SliverChildBuilderDelegate((context, index){
                return ListTile(title: Text('Item #'+(index+1).toString()));
              },
                childCount: 50,
              ),
            ),
          ],
        )
    );
  }

  SliverPersistentHeader makeHeader(String headerText) {
    return SliverPersistentHeader(
      pinned: true,
      delegate: _SliverAppBarDelegate(
        minHeight: 60.0,
        maxHeight: 200.0,
        child: Container(color: Colors.lightBlue, child: Center(child: Text(headerText))),
      ),
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

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });  final double minHeight;
  final double maxHeight;
  final Widget child;  @override
  double get minExtent => minHeight;  @override
  double get maxExtent => math.max(maxHeight, minHeight);  @override
  Widget build(
      BuildContext context,
      double shrinkOffset,
      bool overlapsContent)
  {
    return new SizedBox.expand(child: child);
  }  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}