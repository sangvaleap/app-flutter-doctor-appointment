import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';

class AppBar1Page extends StatefulWidget {
  @override
  _AppBar1PageState createState() => _AppBar1PageState();
}

class _AppBar1PageState extends State<AppBar1Page> {
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
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: _globalWidget.createDetailWidget(
                    title: 'App Bar 1 - Standart',
                    desc: 'This is the example of standart App Bar'
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 8),
                child: AppBar(
                  title: Text('Title'),
                  centerTitle: true,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
