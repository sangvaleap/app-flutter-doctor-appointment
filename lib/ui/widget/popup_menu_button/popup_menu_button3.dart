import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class PopupMenuButton3Page extends StatefulWidget {
  @override
  _PopupMenuButton3PageState createState() => _PopupMenuButton3PageState();
}

class _PopupMenuButton3PageState extends State<PopupMenuButton3Page> {
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
                  title: 'Popup Menu Button 3 - On Selected',
                  desc: 'This is the example of Popup Menu Button with on selected'
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
                  initialValue: 2,
                  onCanceled: () {
                    Fluttertoast.showToast(msg: 'You have canceled the menu.', toastLength: Toast.LENGTH_SHORT);
                  },
                  onSelected: (value) {
                    Fluttertoast.showToast(msg: 'value : '+value.toString(), toastLength: Toast.LENGTH_SHORT);
                  },
                  icon: Icon(Icons.menu),
                ),
              )
            ],
          ),
        )
    );
  }
}
