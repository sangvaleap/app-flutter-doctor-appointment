import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';

class ColoringContainerPage extends StatefulWidget {
  @override
  _ColoringContainerPageState createState() => _ColoringContainerPageState();
}

class _ColoringContainerPageState extends State<ColoringContainerPage> {
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
        body: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(24, 24, 24, 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _globalWidget.createDetailWidget(
                  title: 'Coloring on Container',
                  desc: 'This is the example of coloring on container using different method'
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 8),
                // this is the start of example
                child: Container(
                  height: 40,
                  color: Colors.pinkAccent,
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 8),
                // this is the start of example
                child: Container(
                  height: 40,
                  color: Color(0xFF00AAFF)
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 8),
                // this is the start of example
                child: Container(
                  height: 40,
                  color: Colors.green[400]
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 8),
                // this is the start of example
                child: Container(
                  height: 40,
                  color: Color.fromARGB(255, 204, 0, 255)
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 8),
                // this is the start of example
                // if using decoration color for coloring container, don't use color field in container again
                child: Container(
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.red
                  ),
                ),
              ),
            ],
          ),
        )
    );
  }
}
