import 'package:doctor_app/config/constant.dart';
import 'package:doctor_app/ui/feature/url_launcher/url_launcher1.dart';
import 'package:doctor_app/ui/feature/url_launcher/url_launcher2.dart';
import 'package:doctor_app/ui/feature/url_launcher/url_launcher3.dart';
import 'package:doctor_app/ui/feature/url_launcher/url_launcher4.dart';
import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';

class UrlLauncherListPage extends StatefulWidget {
  @override
  _UrlLauncherListPageState createState() => _UrlLauncherListPageState();
}

class _UrlLauncherListPageState extends State<UrlLauncherListPage> {
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
              child: Text('URL Launcher', style: TextStyle(
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
                        child: Text('A Flutter plugin for launching a URL in the mobile platform. Supports iOS, Android, web, Windows, macOS, and Linux.\n\nSome function will not work properly if you run it on simulator.', style: TextStyle(
                            fontSize: 15, color: BLACK77,letterSpacing: 0.5
                        )),
                      )
                  ),
                  Flexible(
                      flex: 2,
                      child: Container(
                          alignment: Alignment.center,
                          child: Icon(Icons.launch, size: 50, color: SOFT_BLUE))
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
            _globalWidget.screenDetailList(context: context, title: 'URL Launcher 1 - Website', page: UrlLauncher1Page()),
            _globalWidget.screenDetailList(context: context, title: 'URL Launcher 2 - Send Email', page: UrlLauncher2Page()),
            _globalWidget.screenDetailList(context: context, title: 'URL Launcher 3 - Call Phone Number', page: UrlLauncher3Page()),
            _globalWidget.screenDetailList(context: context, title: 'URL Launcher 4 - Send SMS', page: UrlLauncher4Page()),
          ],
        )
    );
  }
}
