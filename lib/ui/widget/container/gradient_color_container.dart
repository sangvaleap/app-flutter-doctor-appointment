import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';

class GradientColorContainerPage extends StatefulWidget {
  @override
  _GradientColorContainerPageState createState() => _GradientColorContainerPageState();
}

class _GradientColorContainerPageState extends State<GradientColorContainerPage> {
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
                  title: 'Gradient Color Container',
                  desc: 'This is the example of gradient color on container using different method'
              ),
              Container(
                  margin: EdgeInsets.only(top: 10),
                  child: Text('Linear Gradient')
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 8),
                // this is the start of example
                child: Container(
                  height: 100,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Colors.green, Colors.blue])
                  ),
                ),
              ),
              Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Text('Linear Gradient from top left into bottom right')
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 8),
                // this is the start of example
                child: Container(
                  height: 100,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [Colors.green, Colors.blue])
                  ),
                ),
              ),
              Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Text('Linear Gradient from top left into bottom right with multiple color')
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 8),
                // this is the start of example
                child: Container(
                  height: 100,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          stops: [0.1, 0.3, 0.7, 1],
                          colors: [Colors.green, Colors.blue, Colors.orange, Colors.pink])
                  ),
                ),
              ),
              Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Text('Radial Gradient')
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 8),
                // this is the start of example
                child: Container(
                  height: 100,
                  decoration: BoxDecoration(
                    gradient: RadialGradient(
                        colors: [Colors.green, Colors.blue]
                    ),
                  ),
                ),
              ),
              Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Text('Radial Gradient with multiple color')
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 8),
                // this is the start of example
                child: Container(
                  height: 100,
                  decoration: BoxDecoration(
                    gradient: RadialGradient(
                        colors: [Colors.green, Colors.blue, Colors.orange,Colors.pink],
                        stops: [0.2, 0.5, 0.7, 1]
                    ),
                  ),
                ),
              ),
              Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Text('Radial Gradient with multiple color and move position of the gradient')
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 8),
                // this is the start of example
                child: Container(
                  height: 100,
                  decoration: BoxDecoration(
                    gradient: RadialGradient(
                      colors: [Colors.green, Colors.blue, Colors.orange, Colors.pink],
                      stops: [0.2, 0.5, 0.7, 1],
                      center: Alignment(0.4, 0.3),
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
    );
  }
}
