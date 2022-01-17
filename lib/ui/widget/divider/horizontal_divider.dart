import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';

class HorizontalDividerPage extends StatefulWidget {
  @override
  _HorizontalDividerPageState createState() => _HorizontalDividerPageState();
}

class _HorizontalDividerPageState extends State<HorizontalDividerPage> {
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
                  title: 'Horizontal Divider',
                  desc: 'This is the example of horizontal divider'
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 8),
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Menu 1'),
                      Divider(),
                      Text('Menu 2'),
                      Divider(
                        thickness: 8,
                      ),
                      Text('Menu 3'),
                      Divider(
                        height: 40,
                      ),
                      Text('Menu 4'),
                      Divider(
                        color: Colors.pinkAccent,
                      ),
                      Text('Menu 5'),
                      Divider(
                        color: Colors.pinkAccent,
                        indent: 24,
                      ),
                      Text('Menu 6'),
                      Divider(
                        color: Colors.pinkAccent,
                        endIndent: 24,
                      ),
                    ],
                  ), // please note that width of container will not work if the container is inside ListView
                ),
              ),
            ],
          ),
        )
    );
  }
}
