import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';

class BottomsheetDragdownToDismissPage extends StatefulWidget {
  @override
  _BottomsheetDragdownToDismissPageState createState() => _BottomsheetDragdownToDismissPageState();
}

class _BottomsheetDragdownToDismissPageState extends State<BottomsheetDragdownToDismissPage> {
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
                  title: 'BottomSheet dragdown to dismiss',
                  desc: 'This is the example of BottomSheet and must be dragdown or press back to dismiss'
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
      isDismissible: false,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.symmetric(vertical: 32),
          child: Text('BottomSheet', textAlign: TextAlign.center),
        );
      },
    );
  }
}
