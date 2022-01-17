import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';

class Dismissible1Page extends StatefulWidget {
  @override
  _Dismissible1PageState createState() => _Dismissible1PageState();
}

class _Dismissible1PageState extends State<Dismissible1Page> {
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
                  title: 'Dismissible 1 - Standart',
                  desc: 'This is the example of standart Dismissible. Slide the item list to dismiss.'
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
                        color: Colors.green,
                      ),
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
