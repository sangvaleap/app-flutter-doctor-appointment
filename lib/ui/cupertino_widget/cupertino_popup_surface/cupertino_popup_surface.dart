import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CupertinoPopupSurfacePage extends StatefulWidget {
  @override
  _CupertinoPopupSurfacePageState createState() => _CupertinoPopupSurfacePageState();
}

class _CupertinoPopupSurfacePageState extends State<CupertinoPopupSurfacePage> {
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
                title: 'Cupertino Popup Surface',
                desc: 'Rounded rectangle surface that looks like an iOS popup surface, such as an alert dialog or action sheet.',
                icon: Icons.call_to_action
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 8),
              child: _globalWidget.createButton(
                  buttonName: 'Show Bottom Sheet',
                  onPressed: (){
                    showModalBottomSheet<void>(
                      context: context,
                      builder: (BuildContext context) => CupertinoPopupSurface(
                        isSurfacePainted: false,
                        child: Center(
                          child: Container(
                            width: 80,
                            height: 80,
                            color: Colors.pinkAccent,
                            child: Center(
                              child: Text('DevKit', style: TextStyle(
                                color: Colors.white
                              )),
                            ),
                          ),
                        ),
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
