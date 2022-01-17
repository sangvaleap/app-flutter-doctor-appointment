import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';

class FlexibleRowPage extends StatefulWidget {
  @override
  _FlexibleRowPageState createState() => _FlexibleRowPageState();
}

class _FlexibleRowPageState extends State<FlexibleRowPage> {
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
                  title: 'Flexible Row',
                  desc: 'This is the example of flexible row'
              ),
              Row(
                children: [
                  Flexible(
                    flex: 1,
                    fit: FlexFit.tight,
                    child: Container(
                      height: 100,
                      color: Colors.redAccent,
                      child: Center(child: Text('1/6', style: TextStyle(color: Colors.white))),
                    ),
                  ),
                  Flexible(
                    flex: 2,
                    fit: FlexFit.tight,
                    child: Container(
                      height: 100,
                      color: Colors.blue,
                      child: Center(child: Text('2/6', style: TextStyle(color: Colors.white))),
                    ),
                  ),
                  Flexible(
                    flex: 3,
                    fit: FlexFit.tight,
                    child: Container(
                      height: 100,
                      color: Colors.green,
                      child: Center(child: Text('3/6', style: TextStyle(color: Colors.white))),
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
