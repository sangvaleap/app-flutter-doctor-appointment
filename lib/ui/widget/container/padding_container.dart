import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';

class PaddingContainerPage extends StatefulWidget {
  @override
  _PaddingContainerPageState createState() => _PaddingContainerPageState();
}

class _PaddingContainerPageState extends State<PaddingContainerPage> {
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
                  title: 'Padding on Container',
                  desc: 'This is the example of padding on container using different method'
              ),
              Container(
                  margin: EdgeInsets.only(top: 10),
                  child: Text('Padding left')
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 8),
                // this is the start of example
                child: Container(
                  color: _containerColor,
                  padding: EdgeInsets.only(left: 12),
                  child: Text('this text is inside container', style: TextStyle(color: _textColor)),
                ),
              ),
              Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Text('Padding right')
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 8),
                // this is the start of example
                child: Container(
                  color: _containerColor,
                  padding: EdgeInsets.fromLTRB(0, 0, 12, 0),
                  child: Text('this text is inside container', style: TextStyle(color: _textColor)),
                ),
              ),
              Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Text('Padding left and right with simetric')
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 8),
                // this is the start of example
                child: Container(
                  color: _containerColor,
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  child: Text('this text is inside container', style: TextStyle(color: _textColor)),
                ),
              ),
              Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Text('Padding all with same value')
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 8),
                // this is the start of example
                child: Container(
                  color: _containerColor,
                  padding: EdgeInsets.all(12),
                  child: Text('this text is inside container', style: TextStyle(color: _textColor)),
                ),
              ),
              Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Text('Padding all with different value')
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 8),
                // this is the start of example
                child: Container(
                  color: _containerColor,
                  padding: EdgeInsets.fromLTRB(12, 24, 36, 48),
                  child: Text('this text is inside container', style: TextStyle(color: _textColor)),
                ),
              ),
            ],
          ),
        )
    );
  }
}
