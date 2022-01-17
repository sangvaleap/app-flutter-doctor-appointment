import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';

class BottomsheetWithShapePage extends StatefulWidget {
  @override
  _BottomsheetWithShapePageState createState() => _BottomsheetWithShapePageState();
}

class _BottomsheetWithShapePageState extends State<BottomsheetWithShapePage> {
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
                  title: 'BottomSheet with shape',
                  desc: 'This is the example of BottomSheet with shape'
              ),
              Container(
                  margin: EdgeInsets.symmetric(vertical: 8),
                  child: _globalWidget.createButton(
                      buttonName: 'Open BottomSheet',
                      onPressed: (){
                        displayPopup(context);
                      }
                  ),
              ),
            ],
          ),
        )
    );
  }

  void displayPopup(BuildContext context){
    showModalBottomSheet<void>(
      context: context,
      backgroundColor: Colors.pinkAccent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(24), topRight: Radius.circular(24)),
      ),
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.symmetric(vertical: 32),
          child: Text('BottomSheet', textAlign: TextAlign.center, style: TextStyle(
            color: Colors.white
          )),
        );
      },
    );
  }
}
