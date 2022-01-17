import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class FabWithShapePage extends StatefulWidget {
  @override
  _FabWithShapePageState createState() => _FabWithShapePageState();
}

class _FabWithShapePageState extends State<FabWithShapePage> {
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
                title: 'FAB with shape',
                desc: 'This is the example of fab with shape'
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
        backgroundColor: Colors.pinkAccent,
        shape: RoundedRectangleBorder(),
      ),
    );
  }
}
