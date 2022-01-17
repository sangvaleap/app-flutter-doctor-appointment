import 'package:flutter/material.dart';

class SliverAppbar2Page extends StatefulWidget {
  @override
  _SliverAppbar2PageState createState() => _SliverAppbar2PageState();
}

class _SliverAppbar2PageState extends State<SliverAppbar2Page> {
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
              floating: true,
              pinned: true,
              backgroundColor: Colors.pinkAccent,
              flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  title: Text("Collapsing Toolbar",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                      )),
                  background: Image.asset('assets/images/lamp.jpg', fit: BoxFit.cover)),
              expandedHeight: 200,
              actions: <Widget>[
                IconButton(
                  icon: const Icon(Icons.add_circle),
                  tooltip: 'Add new entry',
                  onPressed: () {

                  },
                ),
              ],
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate((context, index){
                return ListTile(title: Text('Item #'+(index+1).toString()));
              },
                childCount: 100,
              ),
            ),
          ],
        )
    );
  }
}
