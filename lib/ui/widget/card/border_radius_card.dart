import 'package:doctor_app/config/constant.dart';
import 'package:doctor_app/ui/reusable/cache_image_network.dart';
import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';

class BorderRadiusCardPage extends StatefulWidget {
  @override
  _BorderRadiusCardPageState createState() => _BorderRadiusCardPageState();
}

class _BorderRadiusCardPageState extends State<BorderRadiusCardPage> {
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
                  title: 'Border Radius Card',
                  desc: 'This is the example of border radius on card'
              ),
              Container(
                  margin: EdgeInsets.only(top: 10),
                  child: Text('Card border radius all')
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 8),
                // this is the start of example
                child: Card(
                    shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Container(
                    padding:EdgeInsets.all(15),
                    child: Text('This text is inside card')),
                ),
              ),
              Container(
                  margin: EdgeInsets.only(top: 10),
                  child: Text('Border radius with top left and bottom right radius')
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 8),
                // this is the start of example
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15.0),
                      bottomRight: Radius.circular(15.0),
                    ),
                  ),
                  child: Container(
                      padding:EdgeInsets.all(15),
                      child: Text('This text is inside card')),
                ),
              ),
              Container(
                  margin: EdgeInsets.only(top: 10),
                  child: Text('Border radius with image')
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 8),
                // this is the start of example
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15.0),
                      bottomRight: Radius.circular(15.0),
                    ),
                  ),
                  child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15.0),
                        bottomRight: Radius.circular(15.0),
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
