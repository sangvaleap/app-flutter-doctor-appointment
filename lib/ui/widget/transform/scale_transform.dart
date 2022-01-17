import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';

class ScaleTransformPage extends StatefulWidget {
  @override
  _ScaleTransformPageState createState() => _ScaleTransformPageState();
}

class _ScaleTransformPageState extends State<ScaleTransformPage> {
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
                  title: 'Scale Transform',
                  desc: 'This is the example of scale transform on container'
              ),
              Container(
                  margin: EdgeInsets.only(top: 10),
                  child: Text('Original')
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                // this is the start of example
                child: Container(
                  height: 50,
                  width: 50,
                  color: Colors.pinkAccent,
                ),
              ),
              Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Text('Scale 0.5 at the center')
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                // this is the start of example
                child: Transform.scale(
                  scale: 0.5,
                  child: Container(
                    height: 50,
                    width: 50,
                    color: Colors.pinkAccent,
                  ),
                ),
              ),
              Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Text('Scale 0.5 at the bottom right')
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                // this is the start of example
                child: Transform.scale(
                  scale: 0.5,
                  alignment: Alignment.bottomRight,
                  child: Container(
                    height: 50,
                    width: 50,
                    color: Colors.pinkAccent,
                  ),
                ),
              ),
              Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Text('Scale 1.3 at the center')
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                // this is the start of example
                child: Transform.scale(
                  scale: 1.3,
                  child: Container(
                    height: 50,
                    width: 50,
                    color: Colors.pinkAccent,
                  ),
                ),
              ),
            ],
          ),
        )
    );
  }
}
