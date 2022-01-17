import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';

class HeroWidgetPage extends StatefulWidget {
  @override
  _HeroWidgetPageState createState() => _HeroWidgetPageState();
}

class _HeroWidgetPageState extends State<HeroWidgetPage> {
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
                  title: 'Hero Widget',
                  desc: 'The icon will be animated from before page to this page'
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 8),
                child: Container(
                  child: Hero(
                    tag: 'volley',
                    child: Icon(
                      Icons.sports_volleyball,
                      size: 280,
                      color: Colors.pinkAccent,
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
