import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CupertinoTextField2Page extends StatefulWidget {
  @override
  _CupertinoTextField2PageState createState() => _CupertinoTextField2PageState();
}

class _CupertinoTextField2PageState extends State<CupertinoTextField2Page> {
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
                    title: 'Cupertino Text Field 2 - Font Style',
                    desc: 'This is the example of Cupertino Text Field with font style'
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                child: CupertinoTextField(
                  style: TextStyle(color: Colors.amber),
                  padding: EdgeInsets.all(16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
