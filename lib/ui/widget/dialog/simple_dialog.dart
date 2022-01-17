import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SimpleDialogPage extends StatefulWidget {
  @override
  _SimpleDialogPageState createState() => _SimpleDialogPageState();
}

class _SimpleDialogPageState extends State<SimpleDialogPage> {
  // initialize global widget
  final _globalWidget = GlobalWidget();

  final FocusNode _focusField = FocusNode();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _focusField.dispose();
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
              _globalWidget.createDetailWidget(
                  title: 'Simple Dialog',
                  desc: 'This is the example of simple dialog'
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 8),
                // this is the start of example
                child: _globalWidget.createButton(
                    buttonName: 'Open Dialog',
                    onPressed: (){
                      _showPopup(context);
                    }
                ),
              ),
            ],
          ),
        )
    );
  }

  void _showPopup(BuildContext context){
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return SimpleDialog(
            title: Text('Set backup account'),
            children: [
              SimpleDialogOption(
                onPressed: (){
                  Navigator.pop(context, 'user01@gmail.com');
                  Fluttertoast.showToast(msg: 'user01@gmail.com', toastLength: Toast.LENGTH_SHORT);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.account_circle, size: 36.0, color: Colors.orange),
                    Padding(
                      padding: const EdgeInsetsDirectional.only(start: 16.0),
                      child: Text('user01@gmail.com'),
                    ),
                  ],
                ),
              ),
              SimpleDialogOption(
                onPressed: (){
                  Navigator.pop(context, 'user02@gmail.com');
                  Fluttertoast.showToast(msg: 'user02@gmail.com', toastLength: Toast.LENGTH_SHORT);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.account_circle, size: 36.0, color: Colors.green),
                    Padding(
                      padding: const EdgeInsetsDirectional.only(start: 16.0),
                      child: Text('user02@gmail.com'),
                    ),
                  ],
                ),
              ),
              SimpleDialogOption(
                onPressed: (){
                  Navigator.pop(context, 'Add account');
                  Fluttertoast.showToast(msg: 'Add account', toastLength: Toast.LENGTH_SHORT);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.account_circle, size: 36.0, color: Colors.grey),
                    Padding(
                      padding: const EdgeInsetsDirectional.only(start: 16.0),
                      child: Text('Add account'),
                    ),
                  ],
                ),
              )
            ],
          );
        });
  }
}
