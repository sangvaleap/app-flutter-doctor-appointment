import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CupertinoTextField3Page extends StatefulWidget {
  @override
  _CupertinoTextField3PageState createState() => _CupertinoTextField3PageState();
}

class _CupertinoTextField3PageState extends State<CupertinoTextField3Page> {
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
                    title: 'Cupertino Text Field 3 - Placeholder',
                    desc: 'This is the example of Cupertino Text Field with placeholder'
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                child: CupertinoTextField(
                  padding: EdgeInsets.all(16),
                  placeholder: 'Full Name',
                  placeholderStyle: TextStyle(color: CupertinoColors.activeBlue),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
