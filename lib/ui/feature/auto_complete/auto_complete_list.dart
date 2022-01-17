import 'package:doctor_app/config/constant.dart';
import 'package:doctor_app/ui/feature/auto_complete/auto_complete_form.dart';
import 'package:doctor_app/ui/feature/auto_complete/auto_complete_navigation.dart';
import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';

class AutoCompleteListPage extends StatefulWidget {
  @override
  _AutoCompleteListPageState createState() => _AutoCompleteListPageState();
}

class _AutoCompleteListPageState extends State<AutoCompleteListPage> {
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
              child: Text('Auto Complete List', style: TextStyle(
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
                        child: Text('Auto complete used to search data.', style: TextStyle(
                            fontSize: 15, color: BLACK77,letterSpacing: 0.5
                        )),
                      )
                  ),
                  Flexible(
                      flex: 2,
                      child: Container(
                          alignment: Alignment.center,
                          child: Icon(Icons.search_outlined, size: 50, color: SOFT_BLUE))
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
            _globalWidget.screenDetailList(context: context, title: 'Auto Complete with Navigation', page: AutoCompleteNavigationPage()),
            _globalWidget.screenDetailList(context: context, title: 'Auto Complete Form', page: AutoCompleteFormPage())
          ],
        )
    );
  }
}
