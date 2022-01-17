import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';

class Dismissible2Page extends StatefulWidget {
  @override
  _Dismissible2PageState createState() => _Dismissible2PageState();
}

class _Dismissible2PageState extends State<Dismissible2Page> {
  // initialize global widget
  final _globalWidget = GlobalWidget();

  List<int> items = List<int>.generate(100, (int index) => index);

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
                  title: 'Dismissible 2 - Properties',
                  desc: 'This is the example of Dismissible with properties. Slide the item list to dismiss.'
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 8),
                child: ListView.builder(
                  primary: false,
                  shrinkWrap: true,
                  itemCount: items.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Dismissible(
                      child: ListTile(
                        title: Text(
                          'Item ${items[index]}',
                        ),
                      ),
                      background: Container(
                        color: Colors.pinkAccent,
                        child: Icon(Icons.delete, color: Colors.white),
                      ),
                      secondaryBackground: Container(
                        color: Colors.blueAccent,
                        child: Icon(Icons.clear, color: Colors.white),
                      ),
                      direction: DismissDirection.horizontal,
                      key: ValueKey<int>(items[index]),
                      onDismissed: (DismissDirection direction) {
                        setState(() {
                          items.removeAt(index);
                        });
                      },
                    );
                  },
                ),
              )
            ],
          ),
        )
    );
  }
}
