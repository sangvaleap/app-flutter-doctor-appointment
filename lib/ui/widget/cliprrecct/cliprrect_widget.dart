import 'package:doctor_app/config/constant.dart';
import 'package:doctor_app/ui/reusable/cache_image_network.dart';
import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';

class ClipRRectWidgetPage extends StatefulWidget {
  @override
  _ClipRRectWidgetPageState createState() => _ClipRRectWidgetPageState();
}

class _ClipRRectWidgetPageState extends State<ClipRRectWidgetPage> {
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
                  title: 'ClipRRect Widget',
                  desc: 'A widget that clips its child using a rounded rectangle.',
                  icon: Icons.filter_center_focus
              ),
              Container(
                  margin: EdgeInsets.only(top: 10),
                  child: Text('ClipRRect on image')
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 8),
                // this is the start of example
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: buildCacheNetworkImage(url: GLOBAL_URL+'/assets/images/product/1.jpg', width: 200),
                ),
              ),
              Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Text('ClipRRect on container')
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 8),
                // this is the start of example
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Container(
                    width: 200,
                    height: 200,
                    color: Colors.pinkAccent,
                  ),
                ),
              ),
              Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Text('ClipRRect on container with text')
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 8),
                // this is the start of example
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Container(
                    width: 200,
                    height: 200,
                    color: Colors.pinkAccent,
                    child: Text('a b c a b c a b c a b c a b c a b c a b c a b c a b c '
                        'a c a b c a b c a b c a b c a b c a b c a b c a b c a b c a b c a b c a b c '
                        'a c a b c a b c a b c a b c a b c a b c a b c a b c a b c a b c a b c a b c '
                        'a c a b c a b c a b c a b c a b c a b c a b c a b c a b c a b c a b c a b c '
                        'a c a b c a b c a b c a b c a b c a b c a b c a b c a b c a b c a b c a b c '
                        'a c a b c a b c a b c a b c a b c a b c a b c a b c a b c a b c a b c a b c '),
                  ),
                ),
              ),
            ],
          ),
        )
    );
  }
}
