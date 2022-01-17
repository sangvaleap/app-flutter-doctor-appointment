import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';

class ShadowColorCardPage extends StatefulWidget {
  @override
  _ShadowColorCardPageState createState() => _ShadowColorCardPageState();
}

class _ShadowColorCardPageState extends State<ShadowColorCardPage> {
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
                  title: 'Shadow Color Card',
                  desc: 'This is the example of card with some shadow color'
              ),
              Container(
                  margin: EdgeInsets.only(top: 10),
                  child: Text('Card with shadow color red')
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 8),
                child: Card(
                  shadowColor: Colors.red,
                  elevation: 10,
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
