import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';

class MarginContainerPage extends StatefulWidget {
  @override
  _MarginContainerPageState createState() => _MarginContainerPageState();
}

class _MarginContainerPageState extends State<MarginContainerPage> {
  // initialize global widget
  final _globalWidget = GlobalWidget();

  Color _containerColor = Colors.indigoAccent;
  Color _textColor = Colors.white;

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
                  title: 'Margin on Container',
                  desc: 'This is the example of margin on container using different method'
              ),
              Container(
                  margin: EdgeInsets.only(top: 10),
                  child: Text('Margin left')
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 8),
                // this is the start of example
                child: Container(
                  color: _containerColor,
                  margin: EdgeInsets.only(left: 12),
                  child: Text('this text is inside container', style: TextStyle(color: _textColor)),
                ),
              ),
              Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Text('Margin right')
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 8),
                // this is the start of example
                child: Container(
                  color: _containerColor,
                  margin: EdgeInsets.fromLTRB(0, 0, 12, 0),
                  child: Text('this text is inside container', style: TextStyle(color: _textColor)),
                ),
              ),
              Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Text('Margin left and right with simetric')
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 8),
                // this is the start of example
                child: Container(
                  color: _containerColor,
                  margin: EdgeInsets.symmetric(horizontal: 12),
                  child: Text('this text is inside container', style: TextStyle(color: _textColor)),
                ),
              ),
              Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Text('Margin all with same value')
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 8),
                // this is the start of example
                child: Container(
                  color: _containerColor,
                  margin: EdgeInsets.all(12),
                  child: Text('this text is inside container', style: TextStyle(color: _textColor)),
                ),
              ),
              Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Text('Margin all with different value')
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 8),
                // this is the start of example
                child: Container(
                  color: _containerColor,
                  margin: EdgeInsets.fromLTRB(12, 24, 36, 48),
                  child: Text('this text is inside container', style: TextStyle(color: _textColor)),
                ),
              ),
            ],
          ),
        )
    );
  }
}
