import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CupertinoTextField9Page extends StatefulWidget {
  @override
  _CupertinoTextField9PageState createState() => _CupertinoTextField9PageState();
}

class _CupertinoTextField9PageState extends State<CupertinoTextField9Page> {
  // initialize global widget
  final _globalWidget = GlobalWidget();

  TextEditingController _controller = TextEditingController();

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
                    title: 'Cupertino Text Field 9 - Icon & Controller',
                    desc: 'This is the example of Cupertino Text Field with icon & controller'
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                child: CupertinoTextField(
                  controller: _controller,
                  placeholder: 'Email',
                  prefix: CupertinoButton(
                    child: Icon(Icons.email),
                    onPressed: (){
                      Fluttertoast.showToast(msg: 'Press First Icon', toastLength: Toast.LENGTH_SHORT);
                    },
                  ),
                  suffix: CupertinoButton(
                    child: Icon(CupertinoIcons.clear),
                    onPressed: (){
                      setState(() {
                        _controller.text = '';
                      });
                    },
                  ),
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
