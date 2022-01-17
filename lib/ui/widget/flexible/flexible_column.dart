import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';

class FlexibleColumnPage extends StatefulWidget {
  @override
  _FlexibleColumnPageState createState() => _FlexibleColumnPageState();
}

class _FlexibleColumnPageState extends State<FlexibleColumnPage> {
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
        body: Container(
          padding: EdgeInsets.fromLTRB(24, 24, 24, 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.max,
            children: [
              Flexible(
                flex: 1,
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 8),
                  color: Colors.red,
                  child: Center(
                    child: Text('1/6', style: TextStyle(color: Colors.white)),
                  ),
                ),
              ),
              Flexible(
                flex: 2,
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 8),
                  color: Colors.blue,
                  child: Center(
                    child: Text('2/6', style: TextStyle(color: Colors.white)),
                  ),
                ),
              ),
              Flexible(
                flex: 3,
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 8),
                  color: Colors.green,
                  child: Center(
                    child: Text('3/6', style: TextStyle(color: Colors.white)),
                  ),
                ),
              )
            ],
          ),
        )
    );
  }
}
