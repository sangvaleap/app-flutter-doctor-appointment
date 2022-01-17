import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';

class ElevationCardPage extends StatefulWidget {
  @override
  _ElevationCardPageState createState() => _ElevationCardPageState();
}

class _ElevationCardPageState extends State<ElevationCardPage> {
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
                  title: 'Elevation Card',
                  desc: 'This is the example of card with some elevation'
              ),
              Container(
                  margin: EdgeInsets.only(top: 10),
                  child: Text('Card with elevation 0')
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 8),
                child: Card(
                  elevation: 0,
                  child: Container(
                      padding:EdgeInsets.all(15),
                      child: Text('This text is inside card')),
                ),
              ),
              Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Text('Card with elevation 1')
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 8),
                child: Card(
                  elevation: 1,
                  child: Container(
                      padding:EdgeInsets.all(15),
                      child: Text('This text is inside card')),
                ),
              ),
              Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Text('Card with elevation 5 and color')
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 8),
                child: Card(
                  elevation: 5,
                  color: Colors.yellow,
                  child: Container(
                      padding:EdgeInsets.all(15),
                      child: Text('This text is inside card')),
                ),
              ),
              Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Text('Card with elevation 20')
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 8),
                child: Card(
                  elevation: 20,
                  child: Container(
                      padding:EdgeInsets.all(15),
                      child: Text('This text is inside card')),
                ),
              ),
            ],
          ),
        )
    );
  }
}
