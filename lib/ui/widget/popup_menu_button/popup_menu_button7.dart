import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

class PopupMenuButton7Page extends StatefulWidget {
  @override
  _PopupMenuButton7PageState createState() => _PopupMenuButton7PageState();
}

class _PopupMenuButton7PageState extends State<PopupMenuButton7Page> {
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
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.black, //change your color here
          ),
          elevation: 0,
          actions: [
            PopupMenuButton<int>(
              itemBuilder: (context) => [
                PopupMenuItem(
                  value: 1,
                  child: Text('Option 1'),
                ),
                PopupMenuItem(
                  value: 2,
                  child: Text('Option 2'),
                ),
                PopupMenuItem(
                  value: 3,
                  child: Text('Option 3'),
                ),
              ],
              initialValue: 2,
              onCanceled: () {
                Fluttertoast.showToast(msg: 'You have canceled the menu.', toastLength: Toast.LENGTH_SHORT);
              },
              onSelected: (value) {
                Fluttertoast.showToast(msg: 'value : '+value.toString(), toastLength: Toast.LENGTH_SHORT);
              },
              icon: Icon(Icons.menu),
            )
          ],
          backgroundColor: Colors.white,
          systemOverlayStyle: SystemUiOverlayStyle.dark,
          centerTitle: true,
          title: Image.asset('assets/images/logo_horizontal.png', height: 24),
          bottom: PreferredSize(
              child: Container(
                color: Colors.grey[100],
                height: 1.0,
              ),
              preferredSize: Size.fromHeight(1.0)),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(24, 24, 24, 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _globalWidget.createDetailWidget(
                  title: 'Popup Menu Button 7 - AppBar',
                  desc: 'This is the example of Popup Menu Button at AppBar'
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 8),
                child: Text('Check the menu at the top right of this application'),
              )
            ],
          ),
        )
    );
  }
}
