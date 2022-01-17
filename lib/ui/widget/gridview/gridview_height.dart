import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';

class GridviewHeightPage extends StatefulWidget {
  @override
  _GridviewHeightPageState createState() => _GridviewHeightPageState();
}

class _GridviewHeightPageState extends State<GridviewHeightPage> {
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
        body: GridView.count(
            padding: EdgeInsets.all(8),
            // to change height of gridview, we should change childAspectRatio
            childAspectRatio: 0.5,
            crossAxisCount: 2,
            crossAxisSpacing: 8.0,
            mainAxisSpacing: 8.0,
            children: List.generate(24, (index) {
              return Card(
                elevation: 5,
                child: Container(
                  child: Center(
                    child: Text((index+1).toString()),
                  ),
                ),
              );
            })
        )
    );
  }
}
