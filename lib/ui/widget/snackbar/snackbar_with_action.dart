import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SnackbarWithActionPage extends StatefulWidget {
  @override
  _SnackbarWithActionPageState createState() => _SnackbarWithActionPageState();
}

class _SnackbarWithActionPageState extends State<SnackbarWithActionPage> {
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
              _globalWidget.createDetailWidget(
                  title: 'Snackbar with action',
                  desc: 'This is the example of snackbar with action'
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 8),
                child: Container(
                  child: _globalWidget.createButton(
                      buttonName: 'Show snackbar with action',
                      onPressed: (){
                        final snackBar = SnackBar(
                            action: SnackBarAction(
                              label: 'Undo',
                              onPressed: (){
                                Fluttertoast.showToast(msg: 'Undo is pressed', toastLength: Toast.LENGTH_SHORT);
                              },
                              disabledTextColor: Colors.yellow,
                              textColor: Colors.green,
                            ),
                            content: Text('Snackbar with action')
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }
                  ),
                ),
              ),
            ],
          ),
        )
    );
  }
}
