import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ActionChipPage extends StatefulWidget {
  @override
  _ActionChipPageState createState() => _ActionChipPageState();
}

class _ActionChipPageState extends State<ActionChipPage> {
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
                  title: 'Action Chip',
                  desc: 'This is the example of action chip'
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 8),
                // this is the start of example
                child: ActionChip(
                  label: Text('Start Download', style: TextStyle(
                    color: Colors.white
                  )),
                  backgroundColor: Colors.pinkAccent,
                  onPressed: () {
                    Fluttertoast.showToast(msg: 'Click start download', toastLength: Toast.LENGTH_SHORT);
                  },
                  avatar: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Icon(Icons.download_rounded, size: 16, color: Colors.pinkAccent),
                  ),
                ),
              ),
            ],
          ),
        )
    );
  }
}
