import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';

class StackWidgetPage extends StatefulWidget {
  @override
  _StackWidgetPageState createState() => _StackWidgetPageState();
}

class _StackWidgetPageState extends State<StackWidgetPage> {
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
              _globalWidget.createDetailWidget2(
                  title: 'Stack Widget',
                  desc: 'Stack Widget used to stacking widget.',
                  icon: Icons.layers
              ),
              Stack(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width-40,
                    height: 250,
                    color: Colors.grey[100],
                  ),
                  Container(
                    width: 50,
                    height: 50,
                    color: Colors.red,
                  ),
                  Positioned(
                    top: 25,
                    left: 25,
                    child: Container(
                      width: 50,
                      height: 50,
                      color: Colors.blue,
                    ),
                  ),
                  Positioned(
                    top: 50,
                    left: 50,
                    child: Container(
                      width: 50,
                      height: 50,
                      color: Colors.green,
                    ),
                  ),
                  Positioned(
                    top: 75,
                    left: 75,
                    child: Container(
                      width: 50,
                      height: 50,
                      color: Colors.pinkAccent,
                    ),
                  ),
                  Positioned(
                    top: 100,
                    left: 100,
                    child: Container(
                      width: 50,
                      height: 50,
                      color: Colors.orangeAccent,
                    ),
                  ),
                  Positioned(
                    top: 125,
                    left: 125,
                    child: Container(
                      width: 50,
                      height: 50,
                      color: Colors.purpleAccent,
                    ),
                  ),
                  Positioned(
                    top: 150,
                    left: 150,
                    child: Container(
                      width: 50,
                      height: 50,
                      color: Colors.white,
                    ),
                  )
                ],
              )
            ],
          ),
        )
    );
  }
}
