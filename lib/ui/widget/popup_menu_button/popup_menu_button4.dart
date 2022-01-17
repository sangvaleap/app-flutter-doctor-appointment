import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';

class PopupMenuButton4Page extends StatefulWidget {
  @override
  _PopupMenuButton4PageState createState() => _PopupMenuButton4PageState();
}

class _PopupMenuButton4PageState extends State<PopupMenuButton4Page> {
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
                  title: 'Popup Menu Button 4 - Elevation',
                  desc: 'This is the example of Popup Menu Button with elevation'
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 8),
                child: PopupMenuButton<int>(
                  itemBuilder: (context) => [
                    PopupMenuItem(
                      value: 1,
                      child: Text('Option 1', style: TextStyle(
                          color: Colors.pinkAccent, fontWeight: FontWeight.w700
                      )),
                    ),
                    PopupMenuItem(
                      value: 2,
                      child: Text('Option 2', style: TextStyle(
                          color: Colors.pinkAccent, fontWeight: FontWeight.w700
                      )),
                    ),
                    PopupMenuItem(
                      value: 3,
                      child: Text('Option 3', style: TextStyle(
                          color: Colors.pinkAccent, fontWeight: FontWeight.w700
                      )),
                    ),
                  ],
                  elevation: 40,
                ),
              )
            ],
          ),
        )
    );
  }
}
