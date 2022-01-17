import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';

class BorderContainerPage extends StatefulWidget {
  @override
  _BorderContainerPageState createState() => _BorderContainerPageState();
}

class _BorderContainerPageState extends State<BorderContainerPage> {
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
                  title: 'Border Container',
                  desc: 'This is the example of border on container'
              ),
              Container(
                  margin: EdgeInsets.only(top: 10),
                  child: Text('Border all')
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 8),
                // this is the start of example
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1,
                    ),
                  ),
                  child: Text('This text is inside container'),
                ),
              ),
              Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Text('Border all with color')
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 8),
                // this is the start of example
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.pinkAccent,
                      width: 4,
                    ),
                  ),
                  child: Text('This text is inside container'),
                ),
              ),
              Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Text('Border only 1 side')
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 8),
                // this is the start of example
                child: Container(
                  decoration: BoxDecoration(
                    border: Border(
                        top: BorderSide(
                          color: Colors.black,
                        )
                    ),
                  ),
                  child: Text('This text is inside container'),
                ),
              ),
              Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Text('Border only 2 side')
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 8),
                // this is the start of example
                child: Container(
                  decoration: BoxDecoration(
                    border: Border(
                      left: BorderSide(
                        color: Colors.black,
                      ),
                      top: BorderSide(
                        color: Colors.black,
                      ),
                    ),
                  ),
                  child: Text('This text is inside container'),
                ),
              ),
              Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Text('Border width')
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 8),
                // this is the start of example
                child: Container(
                  decoration: BoxDecoration(
                    border: Border(
                        top: BorderSide(
                          color: Colors.black,
                          width: 4
                        )
                    ),
                  ),
                  child: Text('This text is inside container'),
                ),
              ),
              Container(
                  margin: EdgeInsets.only(top: 10),
                  child: Text('Border all width')
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 8),
                // this is the start of example
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 4,
                    ),
                  ),
                  child: Text('This text is inside container'),
                ),
              ),
              Container(
                  margin: EdgeInsets.only(top: 10),
                  child: Text('Border different color and width')
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 8),
                // this is the start of example
                child: Container(
                  decoration: BoxDecoration(
                    border: Border(
                        left: BorderSide(
                            color: Colors.redAccent,
                            width: 10
                        ),
                        top: BorderSide(
                            color: Colors.blue,
                            width: 30
                        ),
                        right: BorderSide(
                            color: Colors.purpleAccent,
                            width: 5
                        ),
                        bottom: BorderSide(
                            color: Colors.orangeAccent,
                            width: 20
                        )
                    ),
                  ),
                  child: Text('This text is inside container'),
                ),
              ),
            ],
          ),
        )
    );
  }
}
