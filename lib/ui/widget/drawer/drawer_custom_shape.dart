import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';

class DrawerCustomShapePage extends StatefulWidget {
  @override
  _DrawerCustomShapePageState createState() => _DrawerCustomShapePageState();
}

class _DrawerCustomShapePageState extends State<DrawerCustomShapePage> {
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
        drawer: Padding(
          padding: EdgeInsets.only(bottom: 80),
          child: ClipRRect(
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(150),
              topRight: Radius.circular(150),
            ),
            child: SizedBox(
              width: 200,
              child: Drawer(
                  child: ListView(
                    padding: EdgeInsets.zero,
                    children: <Widget>[
                      DrawerHeader(
                        child: Text('Drawer Header'),
                        decoration: BoxDecoration(
                          color: Colors.blue,
                        ),
                      ),
                      ListTile(
                        title: Text('Item 1'),
                        trailing: Icon(Icons.arrow_forward),
                        onTap: () {

                        },
                      ),
                      ListTile(
                        title: Text('Item 2'),
                        onTap: () {

                        },
                      ),
                      ListTile(
                        title: Text('Close this drawer'),
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  )
              ),
            ),
          ),
        ),
        body: Container(
          child: Center(
            child: Text('Drawer Custom Shape'),
          ),
        )
    );
  }
}
