import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';

class PopupMenuButton2Page extends StatefulWidget {
  @override
  _PopupMenuButton2PageState createState() => _PopupMenuButton2PageState();
}

class _PopupMenuButton2PageState extends State<PopupMenuButton2Page> {
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
                  title: 'Popup Menu Button 2 - Item Builder',
                  desc: 'This is the example of Popup Menu Button with item builder'
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 8),
                child: PopupMenuButton(
                  itemBuilder: (context) {
                    var list = <PopupMenuEntry<Object>>[];
                    list.add(
                      PopupMenuItem(
                        child: Text("Setting Language"),
                        value: 1,
                      ),
                    );
                    list.add(
                      PopupMenuDivider(
                        height: 10,
                      ),
                    );
                    list.add(
                      CheckedPopupMenuItem(
                        child: Text(
                          "English",
                          style: TextStyle(color: Colors.black),
                        ),
                        value: 2,
                        checked: true,
                      ),
                    );
                    list.add(
                      CheckedPopupMenuItem(
                        child: Text(
                          "Indonesia",
                          style: TextStyle(color: Colors.black),
                        ),
                        value: 3,
                        checked: false,
                      ),
                    );
                    list.add(
                      CheckedPopupMenuItem(
                        child: Text(
                          "Arabic",
                          style: TextStyle(color: Colors.black),
                        ),
                        value: 4,
                        checked: false,
                      ),
                    );
                    list.add(
                      CheckedPopupMenuItem(
                        child: Text(
                          "Chinese",
                          style: TextStyle(color: Colors.black),
                        ),
                        value: 5,
                        checked: false,
                      ),
                    );
                    list.add(
                      CheckedPopupMenuItem(
                        child: Text(
                          "Hindi",
                          style: TextStyle(color: Colors.black),
                        ),
                        value: 6,
                        checked: false,
                      ),
                    );
                    list.add(
                      CheckedPopupMenuItem(
                        child: Text(
                          "Thai",
                          style: TextStyle(color: Colors.black),
                        ),
                        value: 7,
                        checked: false,
                      ),
                    );
                    return list;
                  },
                  icon: Icon(
                    Icons.settings,
                    color: Colors.pinkAccent,
                  ),
                ),
              )
            ],
          ),
        )
    );
  }
}
