import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CupertinoContextMenu1Page extends StatefulWidget {
  @override
  _CupertinoContextMenu1PageState createState() => _CupertinoContextMenu1PageState();
}

class _CupertinoContextMenu1PageState extends State<CupertinoContextMenu1Page> {
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
              Container(
                child: _globalWidget.createDetailWidget(
                    title: 'Cupertino Context Menu 1 - Standart',
                    desc: 'This is the example of standart Cupertino Context Menu'
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                child: Text('Press long at the red box to show context menu'),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 8),
                child: SizedBox(
                  width: 100,
                  height: 100,
                  child: CupertinoContextMenu(
                    child: Container(
                      color: Colors.red,
                    ),
                    actions: <Widget>[
                      CupertinoContextMenuAction(
                        child: Text('Share'),
                        trailingIcon: Icons.share,
                        onPressed: () {
                          Fluttertoast.showToast(msg: 'Press Share', toastLength: Toast.LENGTH_SHORT);
                          Navigator.pop(context);
                        },
                      ),
                      CupertinoContextMenuAction(
                        child: Text('Love'),
                        trailingIcon: CupertinoIcons.heart,
                        onPressed: () {
                          Fluttertoast.showToast(msg: 'Press Love', toastLength: Toast.LENGTH_SHORT);
                          Navigator.pop(context);
                        },
                      ),
                      CupertinoContextMenuAction(
                        child: Text('Delete'),
                        isDestructiveAction: true,
                        trailingIcon: CupertinoIcons.delete,
                        onPressed: () {
                          Fluttertoast.showToast(msg: 'Press Delete', toastLength: Toast.LENGTH_SHORT);
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
