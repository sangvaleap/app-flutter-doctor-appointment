import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CupertinoScrollbar2Page extends StatefulWidget {
  @override
  _CupertinoScrollbar2PageState createState() => _CupertinoScrollbar2PageState();
}

class _CupertinoScrollbar2PageState extends State<CupertinoScrollbar2Page> {
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
      body: CupertinoScrollbar(
        thickness: 6.0,
        thicknessWhileDragging: 10.0,
        radius: Radius.circular(34.0),
        radiusWhileDragging: Radius.zero,
        child: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(24, 24, 24, 16),
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: _globalWidget.createDetailWidget(
                      title: 'Cupertino Scrollbar 2 - Properties',
                      desc: 'This is the example of Cupertino Scrollbar with properties'
                  ),
                ),
                Column(
                  children: List.generate(100, (index) {
                    return Container(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      child: Text('index '+index.toString()),
                    );
                  }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
