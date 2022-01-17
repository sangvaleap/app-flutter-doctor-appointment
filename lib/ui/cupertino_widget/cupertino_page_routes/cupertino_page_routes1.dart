import 'package:doctor_app/ui/cupertino_widget/cupertino_page_routes/cupertino_page_routes2.dart';
import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CupertinoPageRoutes1Page extends StatefulWidget {
  @override
  _CupertinoPageRoutes1PageState createState() => _CupertinoPageRoutes1PageState();
}

class _CupertinoPageRoutes1PageState extends State<CupertinoPageRoutes1Page> {
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
                title: 'Cupertino Page Routes',
                desc: 'An iOS-style page routes.',
                icon: Icons.keyboard_tab
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 8),
              child: _globalWidget.createButton(
                  buttonName: 'Next Page',
                  onPressed: (){
                    Navigator.push(context, CupertinoPageRoute(builder: (context) => CupertinoPageRoutes2Page()));
                  }
              ),
            ),
          ],
        ),
      ),
    );
  }
}
