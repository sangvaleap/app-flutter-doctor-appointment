/*
https://pub.dev/packages/share_plus
*/
import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class ShareContent2Page extends StatefulWidget {
  @override
  _ShareContent2PageState createState() => _ShareContent2PageState();
}

class _ShareContent2PageState extends State<ShareContent2Page> {
  // initialize global widget
  final _globalWidget = GlobalWidget();
  final String _subject = 'DevKit is Awesome';
  final String _textShare = 'DevKit has 6 cores which include screens, widgets, cupertino widgets, features, integrations and apps that will be useful for your project. You can check it at this link: https://1.envato.market/QVNqa';

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
                  title: 'Share Content 2 (Text with Subject)',
                  desc: 'This is the example of share text with subject'
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 8),
              child: Text('Subject : ', style: TextStyle(
                  fontWeight: FontWeight.w600
              )),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 8),
              child: Text(_subject),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 8),
              child: Text('Text : ', style: TextStyle(
                  fontWeight: FontWeight.w600
              )),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 8),
              child: Text(_textShare),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 8),
              child: _globalWidget.createButton(
                  buttonName: 'Share',
                  onPressed: (){
                    Share.share(_textShare, subject: _subject);
                  }
              ),
            ),
          ],
        ),
      ),
    );
  }
}
