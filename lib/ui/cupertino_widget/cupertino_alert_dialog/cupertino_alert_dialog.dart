import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CupertinoAlertDialogPage extends StatefulWidget {
  @override
  _CupertinoAlertDialogPageState createState() => _CupertinoAlertDialogPageState();
}

class _CupertinoAlertDialogPageState extends State<CupertinoAlertDialogPage> {
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
            _globalWidget.createDetailWidget2(
                title: 'Cupertino Alert Dialog',
                desc: 'An iOS-style alert dialog.',
                icon: Icons.event
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 8),
              child: _globalWidget.createButton(
                  buttonName: 'Show Alert Dialog',
                  onPressed: (){
                    showCupertinoDialog<void>(
                      context: context,
                      builder: (BuildContext context) => CupertinoAlertDialog(
                        title: Text('Alert'),
                        content: Text('Proceed with destructive action?'),
                        actions: <CupertinoDialogAction>[
                          CupertinoDialogAction(
                            child: Text('No'),
                            onPressed: () {
                              Fluttertoast.showToast(msg: 'Press No', toastLength: Toast.LENGTH_SHORT);
                              Navigator.pop(context);
                            },
                          ),
                          CupertinoDialogAction(
                            child: Text('Yes'),
                            isDestructiveAction: true,
                            onPressed: () {
                              Fluttertoast.showToast(msg: 'Press Yes', toastLength: Toast.LENGTH_SHORT);
                              Navigator.pop(context);
                            },
                          )
                        ],
                      ),
                    );
                  }
              ),
            ),
          ],
        ),
      ),
    );
  }
}
