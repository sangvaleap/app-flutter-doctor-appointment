import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class FabPositionPage extends StatefulWidget {
  @override
  _FabPositionPageState createState() => _FabPositionPageState();
}

class _FabPositionPageState extends State<FabPositionPage> {
  // initialize global widget
  final _globalWidget = GlobalWidget();

  FloatingActionButtonLocation _fabPosition = FloatingActionButtonLocation.endFloat;

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
                title: 'FAB position',
                desc: 'This is the example of fab with position'
            ),
            Wrap(
              spacing: 16,
              children: [
                _globalWidget.createButton(
                    buttonName: 'Left',
                    onPressed: (){
                      setState(() {
                        _fabPosition = FloatingActionButtonLocation.startFloat;
                      });
                    }
                ),
                _globalWidget.createButton(
                    buttonName: 'Left Docked',
                    onPressed: (){
                      setState(() {
                        _fabPosition = FloatingActionButtonLocation.startDocked;
                      });
                    }
                ),
                _globalWidget.createButton(
                    buttonName: 'Center',
                    onPressed: (){
                      setState(() {
                        _fabPosition = FloatingActionButtonLocation.centerFloat;
                      });
                    }
                ),
                _globalWidget.createButton(
                    buttonName: 'Center Docked',
                    onPressed: (){
                      setState(() {
                        _fabPosition = FloatingActionButtonLocation.centerDocked;
                      });
                    }
                ),
                _globalWidget.createButton(
                    buttonName: 'Right',
                    onPressed: (){
                      setState(() {
                        _fabPosition = FloatingActionButtonLocation.endFloat;
                      });
                    }
                ),
                _globalWidget.createButton(
                    buttonName: 'Right Docked',
                    onPressed: (){
                      setState(() {
                        _fabPosition = FloatingActionButtonLocation.endDocked;
                      });
                    }
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Fluttertoast.showToast(msg: 'FAB Pressed', toastLength: Toast.LENGTH_SHORT);
        },
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: _fabPosition,
    );
  }
}
