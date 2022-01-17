import 'package:doctor_app/config/constant.dart';
import 'package:doctor_app/ui/feature/share_content/share_content1.dart';
import 'package:doctor_app/ui/feature/share_content/share_content2.dart';
import 'package:doctor_app/ui/feature/share_content/share_content3.dart';
import 'package:doctor_app/ui/feature/share_content/share_content4.dart';
import 'package:doctor_app/ui/feature/share_content/share_content5.dart';
import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';

class ShareContentListPage extends StatefulWidget {
  @override
  _ShareContentListPageState createState() => _ShareContentListPageState();
}

class _ShareContentListPageState extends State<ShareContentListPage> {
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
        body: ListView(
          padding: EdgeInsets.fromLTRB(24, 24, 24, 16),
          children: [
            Container(
              child: Text('Share Content', style: TextStyle(
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
                        child: Text('Share Content used to share your content.', style: TextStyle(
                            fontSize: 15, color: BLACK77,letterSpacing: 0.5
                        )),
                      )
                  ),
                  Flexible(
                      flex: 2,
                      child: Container(
                          alignment: Alignment.center,
                          child: Icon(Icons.share, size: 50, color: SOFT_BLUE))
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 48),
              child: Text('List', style: TextStyle(
                  fontSize: 18, color: BLACK21, fontWeight: FontWeight.w500
              )),
            ),
            SizedBox(height: 18),
            _globalWidget.screenDetailList(context: context, title: 'Share Content 1 (Text)', page: ShareContent1Page()),
            _globalWidget.screenDetailList(context: context, title: 'Share Content 2 (Text with Subject)', page: ShareContent2Page()),
            _globalWidget.screenDetailList(context: context, title: 'Share Content 3 (Image Only)', page: ShareContent3Page()),
            _globalWidget.screenDetailList(context: context, title: 'Share Content 4 (Image with Text)', page: ShareContent4Page()),
            _globalWidget.screenDetailList(context: context, title: 'Share Content 5 (Image with Text & Subject)', page: ShareContent5Page()),
          ],
        )
    );
  }
}
