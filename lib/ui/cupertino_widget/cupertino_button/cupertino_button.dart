import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CupertinoButtonPage extends StatefulWidget {
  @override
  _CupertinoButtonPageState createState() => _CupertinoButtonPageState();
}

class _CupertinoButtonPageState extends State<CupertinoButtonPage> {
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
              _globalWidget.createDetailWidget2(
                  title: 'Cupertino Button',
                  desc: 'An iOS-style button.',
                  icon: Icons.smart_button
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                child: Text('Standart'),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 8),
                child: CupertinoButton(
                  child: Text('Standart Button'),
                  onPressed: (){
                    Fluttertoast.showToast(msg: 'Press Standart Button', toastLength: Toast.LENGTH_SHORT);
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                child: Text('Button with Color'),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 8),
                child: CupertinoButton(
                  child: Text('Color Button'),
                  color: Colors.teal,
                  onPressed: (){
                    Fluttertoast.showToast(msg: 'Press Color Button', toastLength: Toast.LENGTH_SHORT);
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                child: Text('Border Radius Button'),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 8),
                child: CupertinoButton(
                  child: Text('Border Button'),
                  color: Colors.pinkAccent,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  onPressed: (){
                    Fluttertoast.showToast(msg: 'Press Border Radius Button', toastLength: Toast.LENGTH_SHORT);
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                child: Text('Padding Button'),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 8),
                child: CupertinoButton(
                  child: Text('Padding Button'),
                  color: Colors.lightBlue,
                  padding: EdgeInsets.all(10),
                  onPressed: (){
                    Fluttertoast.showToast(msg: 'Press Padding Button', toastLength: Toast.LENGTH_SHORT);
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                child: Text('Opacity When Press the Button'),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 8),
                child: CupertinoButton(
                  child: Text('Opacity Button'),
                  color: Colors.amber,
                  pressedOpacity: 0.8,
                  onPressed: (){
                    Fluttertoast.showToast(msg: 'Press Opacity Button', toastLength: Toast.LENGTH_SHORT);
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                child: Text('Cuppertino Button with Filled'),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 8),
                child: CupertinoButton.filled(
                  child: Text('Filled Button'),
                  onPressed: (){
                    Fluttertoast.showToast(msg: 'Press Filled Button', toastLength: Toast.LENGTH_SHORT);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
