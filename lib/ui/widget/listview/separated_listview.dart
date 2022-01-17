import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';

class SeparatedListviewPage extends StatefulWidget {
  @override
  _SeparatedListviewPageState createState() => _SeparatedListviewPageState();
}

class _SeparatedListviewPageState extends State<SeparatedListviewPage> {
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
        body: ListView.separated(
          separatorBuilder: (context, index) {
            return Divider(
              color: Colors.grey,
            );
          },
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(androidVersions[index]),
            );
          },
          itemCount: androidVersions.length,
        )
    );
  }
}
