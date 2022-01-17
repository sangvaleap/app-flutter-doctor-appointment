import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';

class AppBar4Page extends StatefulWidget {
  @override
  _AppBar4PageState createState() => _AppBar4PageState();
}

class _AppBar4PageState extends State<AppBar4Page> {
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
                    title: 'App Bar 4 - Properties',
                    desc: 'This is the example of App Bar with properties'
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 8),
                child: AppBar(
                  title: Image.asset('assets/images/logo_horizontal.png', height: 24),
                  centerTitle: true,
                  iconTheme: IconThemeData(
                    color: Colors.black, //change your color here
                  ),
                  backgroundColor: Colors.white,
                  elevation: 20,
                  shadowColor: Colors.red,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
