/*
https://pub.dev/packages/url_launcher
Add code on Android Manifest.xml for Android 11 (API 30)
*/
import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class UrlLauncher3Page extends StatefulWidget {
  @override
  _UrlLauncher3PageState createState() => _UrlLauncher3PageState();
}

class _UrlLauncher3PageState extends State<UrlLauncher3Page> {
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
            Container(
              child: _globalWidget.createDetailWidget(
                  title: 'URL Launcher 3 - Call Phone Number',
                  desc: 'This is the example of URL Launcher to call phone number'
              ),
            ),
            Container(
                margin: EdgeInsets.symmetric(vertical: 8),
                child: _globalWidget.createButton(
                    buttonName: 'Click to call phone number',
                    onPressed: (){
                      _makePhoneCall('tel:+62811888888');
                    }
                ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _makePhoneCall(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
