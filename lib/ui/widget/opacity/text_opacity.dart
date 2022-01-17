import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';

class TextOpacityPage extends StatefulWidget {
  @override
  _TextOpacityPageState createState() => _TextOpacityPageState();
}

class _TextOpacityPageState extends State<TextOpacityPage> {
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
                  title: 'Text Opacity',
                  desc: 'This is the example of opacity on text'
              ),
              Container(
                  margin: EdgeInsets.only(top: 10),
                  child: Text('Text color black, opacity 1')
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 8),
                // this is the start of example
                child: Opacity(
                  opacity: 1,
                  child: Text('This text has opacity', style: TextStyle(
                      color: Colors.black, fontSize: 18
                  )),
                ),
              ),
              Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Text('Text color black, opacity 0.1')
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 8),
                // this is the start of example
                child: Opacity(
                  opacity: 0.1,
                  child: Text('This text has opacity', style: TextStyle(
                      color: Colors.black, fontSize: 18
                  )),
                ),
              ),
              Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Text('Text color black, opacity 0.5')
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 8),
                // this is the start of example
                child: Opacity(
                  opacity: 0.5,
                  child: Text('This text has opacity', style: TextStyle(
                      color: Colors.black, fontSize: 18
                  )),
                ),
              ),
              Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Text('Text color black, opacity 0.9')
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 8),
                // this is the start of example
                child: Opacity(
                  opacity: 0.9,
                  child: Text('This text has opacity', style: TextStyle(
                      color: Colors.black, fontSize: 18
                  )),
                ),
              ),
              Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Text('Text color using opacity hex color (50-000000)')
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 8),
                // this is the start of example
                child: Text('This text has opacity', style: TextStyle(
                    color: Color(0x50000000), fontSize: 18
                )),
              ),
            ],
          ),
        )
    );
  }
}
