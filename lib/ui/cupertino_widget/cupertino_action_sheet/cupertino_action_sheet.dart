import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CupertinoActionSheetPage extends StatefulWidget {
  @override
  _CupertinoActionSheetPageState createState() => _CupertinoActionSheetPageState();
}

class _CupertinoActionSheetPageState extends State<CupertinoActionSheetPage> {
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
                title: 'Cupertino Action Sheet',
                desc: 'An iOS-style modal bottom action sheet to choose an option among many.',
                icon: Icons.open_in_browser
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 8),
              child: _globalWidget.createButton(
                  buttonName: 'Show Action Sheet',
                  onPressed: (){
                    showCupertinoModalPopup<void>(
                      context: context,
                      builder: (BuildContext context) => CupertinoActionSheet(
                        title: Text('Title'),
                        message: Text('Message'),
                        actions: <CupertinoActionSheetAction>[
                          CupertinoActionSheetAction(
                            child: Text('Action One'),
                            onPressed: () {
                              Fluttertoast.showToast(msg: 'Press Action One', toastLength: Toast.LENGTH_SHORT);
                              Navigator.pop(context);
                            },
                          ),
                          CupertinoActionSheetAction(
                            child: Text('Action Two'),
                            onPressed: () {
                              Fluttertoast.showToast(msg: 'Press Action Two', toastLength: Toast.LENGTH_SHORT);
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
