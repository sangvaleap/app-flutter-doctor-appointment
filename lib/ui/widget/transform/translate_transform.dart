import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';

class TranslateTransformPage extends StatefulWidget {
  @override
  _TranslateTransformPageState createState() => _TranslateTransformPageState();
}

class _TranslateTransformPageState extends State<TranslateTransformPage> {
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
                  title: 'Translate Transform',
                  desc: 'This is the example of translate transform on container'
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
                  child: Text('Offset 100, 0')
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                // this is the start of example
                child: Transform.translate(
                  offset: Offset(100.0, 0.0),
                  child: Container(
                    height: 50,
                    width: 50,
                    color: Colors.pinkAccent,
                  ),
                ),
              ),
              Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Text('Offset 100, 50')
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                // this is the start of example
                child: Transform.translate(
                  offset: Offset(100.0, 50.0),
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
