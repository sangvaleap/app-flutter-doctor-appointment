import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';

class ListviewWithListTilePage extends StatefulWidget {
  @override
  _ListviewWithListTilePageState createState() => _ListviewWithListTilePageState();
}

class _ListviewWithListTilePageState extends State<ListviewWithListTilePage> {
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
        body: ListView(
          padding: EdgeInsets.fromLTRB(24, 24, 24, 16),
          children: List.generate(100, (index) {
            return Container(
              margin: EdgeInsets.only(top: 4, bottom: 4),
              color: Colors.pinkAccent,
              child: ListTile(
                leading: Container(
                  width: 48,
                  height: 48,
                  padding: EdgeInsets.symmetric(vertical: 4),
                  alignment: Alignment.center,
                  child: CircleAvatar(
                    child: Icon(Icons.person),
                    backgroundColor: Colors.white,
                  ),
                ),
                trailing: Icon(Icons.more_vert, color: Colors.white),
                title: Text('Title '+index.toString(), style: TextStyle(color: Colors.white)),
                subtitle: Text('Subtitle '+index.toString(), style: TextStyle(color: Colors.white)),
                onTap: (){
                  print('index : '+index.toString());
                },
              ),
            );
          }),
        )
    );
  }
}
