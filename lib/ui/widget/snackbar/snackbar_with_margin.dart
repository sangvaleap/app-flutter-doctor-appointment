import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';

class SnackbarWithMarginPage extends StatefulWidget {
  @override
  _SnackbarWithMarginPageState createState() => _SnackbarWithMarginPageState();
}

class _SnackbarWithMarginPageState extends State<SnackbarWithMarginPage> {
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
                  title: 'Snackbar with margin',
                  desc: 'This is the example of snackbar with margin. You have to used floating snackbar to make it work'
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 8),
                child: Container(
                  child: _globalWidget.createButton(
                      buttonName: 'Show floating snackbar with margin',
                      onPressed: (){
                        final snackBar = SnackBar(
                            elevation: 5,
                            backgroundColor: Colors.blue,
                            behavior: SnackBarBehavior.floating,
                            margin: EdgeInsets.fromLTRB(40, 0, 40, 100),
                            content: Text('Snackbar with margin bottom')
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
