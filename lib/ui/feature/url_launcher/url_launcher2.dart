/*
https://pub.dev/packages/url_launcher
Add code on Android Manifest.xml for Android 11 (API 30)
*/
import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class UrlLauncher2Page extends StatefulWidget {
  @override
  _UrlLauncher2PageState createState() => _UrlLauncher2PageState();
}

class _UrlLauncher2PageState extends State<UrlLauncher2Page> {
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
                  title: 'URL Launcher 2 - Send Email',
                  desc: 'This is the example of URL Launcher to send email'
              ),
            ),
            Container(
                margin: EdgeInsets.symmetric(vertical: 8),
                child: _globalWidget.createButton(
                    buttonName: 'Click to send email',
                    onPressed: (){
                      _sendEmail('mailto:cs@email.com');
                    }
                ),
            ),
            Container(
                margin: EdgeInsets.symmetric(vertical: 8),
                child: _globalWidget.createButton(
                    buttonName: 'Click to send email with subject',
                    onPressed: (){
                      _sendEmailWithSubject('cs@email.com', 'Example Subject & Symbols are allowed!');
                    }
                ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _sendEmail(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Future<void> _sendEmailWithSubject(String url, String subject) async {
    Uri emailLaunchUri = Uri(
        scheme: 'mailto',
        path: url,
        queryParameters: {
          'subject': subject
        }
    );

    if (await canLaunch(emailLaunchUri.toString())) {
      await launch(emailLaunchUri.toString());
    } else {
      throw 'Could not launch '+emailLaunchUri.toString();
    }
  }
}
