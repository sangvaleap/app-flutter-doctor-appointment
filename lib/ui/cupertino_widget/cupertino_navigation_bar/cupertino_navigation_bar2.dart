import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CupertinoNavigationBar2Page extends StatefulWidget {
  @override
  _CupertinoNavigationBar2PageState createState() => _CupertinoNavigationBar2PageState();
}

class _CupertinoNavigationBar2PageState extends State<CupertinoNavigationBar2Page> {
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
                    title: 'Cupertino Navigation Bar 2 - Trailing',
                    desc: 'This is the example of Cupertino Navigation Bar with trailing'
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 8),
                child: CupertinoNavigationBar(
                  middle: Text('Add Image'),
                  trailing: CupertinoButton(
                    padding: EdgeInsets.zero,
                    child: Text('Done'),
                    onPressed: (){
                      Navigator.pop(context);
                    },
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
