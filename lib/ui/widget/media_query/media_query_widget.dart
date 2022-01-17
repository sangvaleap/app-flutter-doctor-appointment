import 'package:doctor_app/config/constant.dart';
import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';

class MediaQueryWidgetPage extends StatefulWidget {
  @override
  _MediaQueryWidgetPageState createState() => _MediaQueryWidgetPageState();
}

class _MediaQueryWidgetPageState extends State<MediaQueryWidgetPage> {
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
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;
    String deviceOrientation = MediaQuery.of(context).orientation.toString();
    String deviceBrightness = MediaQuery.of(context).platformBrightness.toString();
    String devicePadding = MediaQuery.of(context).padding.toString();
    String devicePixel = MediaQuery.of(context).devicePixelRatio.toString();

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: _globalWidget.globalAppBar(),
        body: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(24, 24, 24, 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Text('Media Query Widget', style: TextStyle(
                    fontSize: 18, color: BLACK21, fontWeight: FontWeight.w500
                )),
              ),
              Container(
                margin: EdgeInsets.only(top: 24),
                child: Row(
                  children: [
                    Flexible(
                        flex:5,
                        child: Container(
                          child: Text('Media Query Widget used to get device information screen', style: TextStyle(
                              fontSize: 15, color: BLACK77,letterSpacing: 0.5
                          )),
                        )
                    ),
                    Flexible(
                        flex: 2,
                        child: Container(
                            alignment: Alignment.center,
                            child: Icon(Icons.add_to_home_screen_outlined, size: 50, color: SOFT_BLUE))
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 48),
                child: Text('Device Information', style: TextStyle(
                    fontSize: 18, color: BLACK21, fontWeight: FontWeight.w500
                )),
              ),
              SizedBox(height: 18),
              Container(
                  margin: EdgeInsets.symmetric(vertical: 8),
                  child: Text('Width : '+deviceWidth.toString())
              ),
              Container(
                  margin: EdgeInsets.symmetric(vertical: 8),
                  child: Text('Height : '+deviceHeight.toString())
              ),
              Container(
                  margin: EdgeInsets.symmetric(vertical: 8),
                  child: Text('Orientation : '+deviceOrientation)
              ),
              Container(
                  margin: EdgeInsets.symmetric(vertical: 8),
                  child: Text('Brightness : '+deviceBrightness)
              ),
              Container(
                  margin: EdgeInsets.symmetric(vertical: 8),
                  child: Text('System Padding : '+devicePadding)
              ),
              Container(
                  margin: EdgeInsets.symmetric(vertical: 8),
                  child: Text('Device Pixel Ratio : '+devicePixel)
              ),
            ],
          ),
        )
    );
  }
}
