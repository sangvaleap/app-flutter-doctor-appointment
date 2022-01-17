import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class IconButtonPage extends StatefulWidget {
  @override
  _IconButtonPageState createState() => _IconButtonPageState();
}

class _IconButtonPageState extends State<IconButtonPage> {
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
                  title: 'Icon Button',
                  desc: 'This is the example of icon button'
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 8),
                child: Wrap(
                  spacing: 32,
                  children: [
                    IconButton(
                      icon: Icon(Icons.android_outlined),
                      onPressed: (){
                        Fluttertoast.showToast(msg: 'Icon 1', toastLength: Toast.LENGTH_SHORT);
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.android_outlined),
                      color: Colors.pinkAccent,
                      onPressed: (){
                        Fluttertoast.showToast(msg: 'Icon 2', toastLength: Toast.LENGTH_SHORT);
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.android_outlined),
                      color: Colors.pinkAccent,
                      iconSize: 40,
                      onPressed: (){
                        Fluttertoast.showToast(msg: 'Icon 3', toastLength: Toast.LENGTH_SHORT);
                      },
                    )
                  ],
                ),
              ),
            ],
          ),
        )
    );
  }
}
