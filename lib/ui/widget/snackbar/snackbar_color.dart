import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';

class SnackbarColorPage extends StatefulWidget {
  @override
  _SnackbarColorPageState createState() => _SnackbarColorPageState();
}

class _SnackbarColorPageState extends State<SnackbarColorPage> {
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
                  title: 'Snackbar color',
                  desc: 'This is the example of snackbar with color'
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 8),
                child: Container(
                  child: _globalWidget.createButton(
                      buttonName: 'Show snackbar with color',
                      onPressed: (){
                        final snackBar = SnackBar(
                            backgroundColor: Colors.pinkAccent,
                            content: Text('Snackbar with color')
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
