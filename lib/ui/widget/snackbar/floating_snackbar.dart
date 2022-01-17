import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';

class FloatingSnackbarPage extends StatefulWidget {
  @override
  _FloatingSnackbarPageState createState() => _FloatingSnackbarPageState();
}

class _FloatingSnackbarPageState extends State<FloatingSnackbarPage> {
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
                  title: 'Floating Snackbar',
                  desc: 'This is the example of floating snackbar'
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 8),
                child: Container(
                  child: _globalWidget.createButton(
                      buttonName: 'Show floating snackbar',
                      onPressed: (){
                        final snackBar = SnackBar(
                            elevation: 5,
                            backgroundColor: Colors.blue,
                            behavior: SnackBarBehavior.floating,
                            content: Text('Floating snackbar')
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
