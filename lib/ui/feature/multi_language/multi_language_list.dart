import 'package:doctor_app/config/constant.dart';
import 'package:doctor_app/ui/feature/multi_language/custom_language.dart';
import 'package:doctor_app/ui/feature/multi_language/multi_language.dart';
import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';

class MultiLanguageListPage extends StatefulWidget {
  @override
  _MultiLanguageListPageState createState() => _MultiLanguageListPageState();
}

class _MultiLanguageListPageState extends State<MultiLanguageListPage> {
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
              child: Text('Multi Language', style: TextStyle(
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
                        child: Text('Multi language is used to define more than 1 language in this application.', style: TextStyle(
                            fontSize: 15, color: BLACK77,letterSpacing: 0.5
                        )),
                      )
                  ),
                  Flexible(
                      flex: 2,
                      child: Container(
                          alignment: Alignment.center,
                          child: Icon(Icons.language, size: 50, color: SOFT_BLUE))
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
            _globalWidget.screenDetailList(context: context, title: 'Multi Language Default', page: MultiLanguagePage()),
            _globalWidget.screenDetailList(context: context, title: 'Custom Language\n(Used if language is not supported by MaterialLocalizations)', page: CustomLanguagePage()),
          ],
        )
    );
  }
}
