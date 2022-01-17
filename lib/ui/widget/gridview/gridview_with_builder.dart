import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';

class GridviewWithBuilderPage extends StatefulWidget {
  @override
  _GridviewWithBuilderPageState createState() => _GridviewWithBuilderPageState();
}

class _GridviewWithBuilderPageState extends State<GridviewWithBuilderPage> {
  // initialize global widget
  final _globalWidget = GlobalWidget();

  var androidVersions = [
    "Android Cupcake",
    "Android Donut",
    "Android Eclair",
    "Android Froyo",
    "Android Gingerbread",
    "Android Honeycomb",
    "Android Ice Cream Sandwich",
    "Android Jelly Bean",
    "Android Kitkat",
    "Android Lollipop",
    "Android Marshmallow",
    "Android Nougat",
    "Android Oreo",
    "Android Pie",
    "Android Other 1",
    "Android Other 2",
    "Android Other 3",
    "Android Other 4",
    "Android Other 5",
    "Android Other 6",
    "Android Other 7",
    "Android Other 8",
    "Android Other 9",
    "Android Other 10"
  ];

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
        body: GridView.builder(
            padding: EdgeInsets.all(8),
            itemCount: androidVersions.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 8.0,
            ),
            itemBuilder: (BuildContext context, int index){
              return Card(
                elevation: 5,
                child: Container(
                  child: Center(
                    child: Text(androidVersions[index].toString(), textAlign: TextAlign.center),
                  ),
                ),
              );
            },
        )
    );
  }
}
