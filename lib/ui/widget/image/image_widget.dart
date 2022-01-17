import 'package:doctor_app/config/constant.dart';
import 'package:doctor_app/ui/reusable/cache_image_network.dart';
import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';

class ImageWidgetPage extends StatefulWidget {
  @override
  _ImageWidgetPageState createState() => _ImageWidgetPageState();
}

class _ImageWidgetPageState extends State<ImageWidgetPage> {
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
              _globalWidget.createDetailWidget2(
                  title: 'Image Widget',
                  desc: 'Image Widget used to show image.',
                  icon: Icons.image
              ),
              Container(
                  margin: EdgeInsets.only(top: 10),
                  child: Text('Image from assets')
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 8),
                child: Image.asset('assets/images/lamp.jpg', height: 150),
              ),
              Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Text('Image from network with cache image')
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 8),
                child: buildCacheNetworkImage(url: GLOBAL_URL+'/assets/images/product/1.jpg', width: 150),
              ),
              Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Text('Image with card and border radius')
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 8),
                child: Card(
                  elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(25),
                    child: Image.asset('assets/images/lamp.jpg', height: 150)
                  )
                ),
              )
            ],
          ),
        )
    );
  }
}
