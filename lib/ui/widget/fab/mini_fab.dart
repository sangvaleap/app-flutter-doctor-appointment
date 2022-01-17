import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class MiniFabPage extends StatefulWidget {
  @override
  _MiniFabPageState createState() => _MiniFabPageState();
}

class _MiniFabPageState extends State<MiniFabPage> {
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
                title: 'Mini FAB',
                desc: 'This is the example of mini fab'
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 8),
              child: Container(
                  child: Text('Below is the example')),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Fluttertoast.showToast(msg: 'FAB Pressed', toastLength: Toast.LENGTH_SHORT);
        },
        child: Icon(Icons.add),
        mini: true,
        backgroundColor: Colors.pinkAccent,
      ),
    );
  }
}
