import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CupertinoTextField5Page extends StatefulWidget {
  @override
  _CupertinoTextField5PageState createState() => _CupertinoTextField5PageState();
}

class _CupertinoTextField5PageState extends State<CupertinoTextField5Page> {
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
                    title: 'Cupertino Text Field 5 - Password',
                    desc: 'This is the example of Cupertino Text Field with password mode'
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                child: CupertinoTextField(
                  obscureText: true,
                  obscuringCharacter: '~',
                  placeholder: 'Password',
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
