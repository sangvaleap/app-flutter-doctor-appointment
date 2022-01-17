import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';

class DrawerCustomHeaderPage extends StatefulWidget {
  @override
  _DrawerCustomHeaderPageState createState() => _DrawerCustomHeaderPageState();
}

class _DrawerCustomHeaderPageState extends State<DrawerCustomHeaderPage> {
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
        drawer: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                UserAccountsDrawerHeader(
                  accountName: Text("Ashish Rawat"),
                  accountEmail: Text("ashishrawat2911@gmail.com"),
                  currentAccountPicture: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Text("A", style: TextStyle(
                        fontSize: 40.0
                    )),
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
                  leading: Icon(Icons.arrow_forward),
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
        body: Container(
          child: Center(
            child: Text('Drawer Custom Header'),
          ),
        )
    );
  }
}
