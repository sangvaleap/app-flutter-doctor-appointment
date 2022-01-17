import 'package:doctor_app/config/constant.dart';
import 'package:doctor_app/ui/reusable/cache_image_network.dart';
import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';

class BorderRadiusContainerPage extends StatefulWidget {
  @override
  _BorderRadiusContainerPageState createState() => _BorderRadiusContainerPageState();
}

class _BorderRadiusContainerPageState extends State<BorderRadiusContainerPage> {
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
                  title: 'Border Radius Container',
                  desc: 'This is the example of border radius on container'
              ),
              Container(
                  margin: EdgeInsets.only(top: 10),
                  child: Text('Border with radius')
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 8),
                // this is the start of example
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                        width: 1
                    ),
                    borderRadius: BorderRadius.all(
                        Radius.circular(10.0)
                    ),
                  ),
                  child: Text('This text is inside container'),
                ),
              ),
              Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Text('Border radius with top left radius')
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 8),
                // this is the start of example
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                        width: 1
                    ),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10.0),
                        bottomRight: Radius.circular(10.0)
                    ),
                  ),
                  child: Text('This text is inside container'),
                ),
              ),
              Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Text('Border radius with different method')
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 8),
                // this is the start of example
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                        width: 1
                    ),
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(10.0),
                    ),
                  ),
                  child: Text('This text is inside container'),
                ),
              ),
              Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Text('Border radius with different method')
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 8),
                // this is the start of example
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                        width: 1
                    ),
                    borderRadius: BorderRadius.horizontal(
                      left: Radius.circular(10.0),
                    ),
                  ),
                  child: Text('This text is inside container'),
                ),
              ),
              Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Text('Border radius with background color')
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 8),
                // this is the start of example
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                        width: 1,
                        color: Colors.blue
                    ),
                    color: Colors.pinkAccent,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10.0),
                    ),
                  ),
                  child: Text('This text is inside container'),
                ),
              ),
              Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Text('Border radius with image')
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 8),
                // this is the start of example
                child: Container(
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    border: Border.all(
                        width: 1,
                        color: Colors.pinkAccent
                    ),
                    color: Colors.yellow,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10.0),
                    ),
                  ),
                  child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10.0),
                      ),
                      child: buildCacheNetworkImage(url: GLOBAL_URL+'/assets/images/product/1.jpg')
                  ),
                ),
              ),
            ],
          ),
        )
    );
  }
}
