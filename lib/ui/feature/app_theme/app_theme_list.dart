import 'package:doctor_app/config/constant.dart';
import 'package:doctor_app/ui/feature/app_theme/app_theme1.dart';
import 'package:doctor_app/ui/feature/app_theme/app_theme2.dart';
import 'package:doctor_app/ui/feature/app_theme/app_theme3.dart';
import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';

class AppThemeListPage extends StatefulWidget {
  @override
  _AppThemeListPageState createState() => _AppThemeListPageState();
}

class _AppThemeListPageState extends State<AppThemeListPage> {
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
              child: Text('App Theme', style: TextStyle(
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
                        child: Text('App theme is used for choose theme of your application (Light Theme, Dark Theme, Custom Theme).', style: TextStyle(
                            fontSize: 15, color: BLACK77,letterSpacing: 0.5
                        )),
                      )
                  ),
                  Flexible(
                      flex: 2,
                      child: Container(
                          alignment: Alignment.center,
                          child: Icon(Icons.invert_colors_on, size: 50, color: SOFT_BLUE))
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
            _globalWidget.screenDetailList(context: context, title: 'App Theme 1 (Default Light Theme / Dark Theme)', page: AppTheme1Page()),
            _globalWidget.screenDetailList(context: context, title: 'App Theme 2 (Custom Theme)', page: AppTheme2Page()),
            _globalWidget.screenDetailList(context: context, title: 'App Theme 3 (Change Theme From Another Screen)', page: AppTheme3Page()),
          ],
        )
    );
  }
}
