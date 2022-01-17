import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';

class PopupMenuButton5Page extends StatefulWidget {
  @override
  _PopupMenuButton5PageState createState() => _PopupMenuButton5PageState();
}

class _PopupMenuButton5PageState extends State<PopupMenuButton5Page> {
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
                  title: 'Popup Menu Button 5 - Child',
                  desc: 'This is the example of Popup Menu Button with child'
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
                  child: Container(
                    height: 50,
                    width: 200,
                    decoration: ShapeDecoration(
                      color: Colors.pinkAccent,
                      shape: StadiumBorder(
                        side: BorderSide(color: Colors.pink, width: 2),
                      ),
                    ),
                    child: Icon(Icons.airplanemode_active, color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        )
    );
  }
}
