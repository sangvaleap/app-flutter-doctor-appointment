import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';

class AppBar2Page extends StatefulWidget {
  @override
  _AppBar2PageState createState() => _AppBar2PageState();
}

class _AppBar2PageState extends State<AppBar2Page> {
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
                    title: 'App Bar 2 - Image Title',
                    desc: 'This is the example of App Bar with image title'
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 8),
                child: AppBar(
                  title: Image.asset('assets/images/logo_horizontal.png', height: 24),
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
