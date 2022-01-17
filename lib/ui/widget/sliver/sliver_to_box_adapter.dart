import 'package:flutter/material.dart';

class SliverToBoxAdapterPage extends StatefulWidget {
  @override
  _SliverToBoxAdapterPageState createState() => _SliverToBoxAdapterPageState();
}

class _SliverToBoxAdapterPageState extends State<SliverToBoxAdapterPage> {
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
              title: Text('Sliver To Box Adapter'),
              floating: true,
              backgroundColor: Colors.pinkAccent,
              expandedHeight: 200,
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate((context, index){
                return ListTile(title: Text('Item #'+(index+1).toString()));
              },
                childCount: 5,
              ),
            ),
            SliverToBoxAdapter(
                child: Center(
                  child: Container(
                    width: 100,
                    height: 50,
                    color: Colors.blue,
                    child: Center(child: Text('I am bottom', style: TextStyle(
                      color: Colors.white
                    ))),
                  ),
                )
            ),
          ],
        )
    );
  }
}
