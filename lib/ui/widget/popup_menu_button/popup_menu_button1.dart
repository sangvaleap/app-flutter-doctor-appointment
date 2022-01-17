import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';

class PopupMenuButton1Page extends StatefulWidget {
  @override
  _PopupMenuButton1PageState createState() => _PopupMenuButton1PageState();
}

class _PopupMenuButton1PageState extends State<PopupMenuButton1Page> {
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
                  title: 'Popup Menu Button 1 - Standart',
                  desc: 'This is the example of standart Popup Menu Button'
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 8),
                child: PopupMenuButton<int>(
                  itemBuilder: (context) => [
                    PopupMenuItem(
                      value: 1,
                      child: Text('Option 1'),
                    ),
                    PopupMenuItem(
                      value: 2,
                      child: Text('Option 2'),
                    ),
                    PopupMenuItem(
                      value: 3,
                      child: Text('Option 3'),
                    ),
                  ],
                ),
              )
            ],
          ),
        )
    );
  }
}
