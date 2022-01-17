import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';

class ListviewWithBuilderPage extends StatefulWidget {
  @override
  _ListviewWithBuilderPageState createState() => _ListviewWithBuilderPageState();
}

class _ListviewWithBuilderPageState extends State<ListviewWithBuilderPage> {
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
        body: ListView.builder(
          padding: EdgeInsets.fromLTRB(24, 24, 24, 16),
          itemBuilder: (context, index) {
            return Container(
              padding: EdgeInsets.all(8.0),
              child: Text(androidVersions[index]),
            );
          },
          itemCount: androidVersions.length,
        )
    );
  }
}
