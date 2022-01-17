import 'package:doctor_app/config/constant.dart';
import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:doctor_app/ui/widget/transform/rotate_transform.dart';
import 'package:doctor_app/ui/widget/transform/scale_transform.dart';
import 'package:doctor_app/ui/widget/transform/skew_transform.dart';
import 'package:doctor_app/ui/widget/transform/translate_transform.dart';
import 'package:flutter/material.dart';

class TransformWidgetListPage extends StatefulWidget {
  @override
  _TransformWidgetListPageState createState() => _TransformWidgetListPageState();
}

class _TransformWidgetListPageState extends State<TransformWidgetListPage> {
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
              child: Text('Transform Widget', style: TextStyle(
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
                        child: Text('Transform Widget used to transform widget in Flutter.', style: TextStyle(
                            fontSize: 15, color: BLACK77,letterSpacing: 0.5
                        )),
                      )
                  ),
                  Flexible(
                      flex: 2,
                      child: Container(
                          alignment: Alignment.center,
                          child: Icon(Icons.transform, size: 50, color: SOFT_BLUE))
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
            _globalWidget.screenDetailList(context: context, title: 'Rotate Transform', page: RotateTransformPage()),
            _globalWidget.screenDetailList(context: context, title: 'Scale Transform', page: ScaleTransformPage()),
            _globalWidget.screenDetailList(context: context, title: 'Translate Transform', page: TranslateTransformPage()),
            _globalWidget.screenDetailList(context: context, title: 'Skew Transform', page: SkewTransformPage()),
          ],
        )
    );
  }
}
