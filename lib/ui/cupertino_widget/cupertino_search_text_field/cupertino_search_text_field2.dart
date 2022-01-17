import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CupertinoSearchTextField2Page extends StatefulWidget {
  @override
  _CupertinoSearchTextField2PageState createState() => _CupertinoSearchTextField2PageState();
}

class _CupertinoSearchTextField2PageState extends State<CupertinoSearchTextField2Page> {
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
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: _globalWidget.createDetailWidget(
                    title: 'Cupertino Search Text Field 2 - Properties',
                    desc: 'This is the example of Cupertino Search Text Field properties'
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                child: CupertinoSearchTextField(
                  backgroundColor: Colors.lightBlueAccent,
                  placeholder: "Search your product here...", // placeholder text
                  style: TextStyle(color: Colors.white), // search text style
                  placeholderStyle: TextStyle(color: Colors.pinkAccent), // placeholder text style
                  itemColor: Colors.white, // icon color
                  itemSize: 30, // icon size
                  padding: EdgeInsets.all(20),
                  prefixIcon: Icon(Icons.settings), // first icon
                  suffixIcon: Icon(Icons.motion_photos_on), // last icon
                  borderRadius: BorderRadius.all(Radius.circular(32)),
                  onChanged: (String value) {
                    print('The text has changed to: $value');
                  },
                  onSubmitted: (String value) {
                    print('Submitted text: $value');
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
