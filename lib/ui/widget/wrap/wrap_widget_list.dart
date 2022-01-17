import 'package:doctor_app/config/constant.dart';
import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:doctor_app/ui/widget/wrap/alignment_wrap.dart';
import 'package:doctor_app/ui/widget/wrap/spacing_wrap.dart';
import 'package:doctor_app/ui/widget/wrap/standart_wrap.dart';
import 'package:doctor_app/ui/widget/wrap/text_direction_wrap.dart';
import 'package:doctor_app/ui/widget/wrap/vertical_direction_wrap.dart';
import 'package:doctor_app/ui/widget/wrap/wrap_direction.dart';
import 'package:flutter/material.dart';

class WrapWidgetListPage extends StatefulWidget {
  @override
  _WrapWidgetListPageState createState() => _WrapWidgetListPageState();
}

class _WrapWidgetListPageState extends State<WrapWidgetListPage> {
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
              child: Text('Wrap Widget', style: TextStyle(
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
                        child: Text('Wrap Widget usually used to list data from left to right.', style: TextStyle(
                            fontSize: 15, color: BLACK77,letterSpacing: 0.5
                        )),
                      )
                  ),
                  Flexible(
                      flex: 2,
                      child: Container(
                          alignment: Alignment.center,
                          child: Icon(Icons.wrap_text, size: 50, color: SOFT_BLUE))
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
            _globalWidget.screenDetailList(context: context, title: 'Standart Wrap', page: StandartWrapPage()),
            _globalWidget.screenDetailList(context: context, title: 'Wrap Direction', page: WrapDirectionPage()),
            _globalWidget.screenDetailList(context: context, title: 'Spacing Wrap', page: SpacingWrapPage()),
            _globalWidget.screenDetailList(context: context, title: 'Alignment Wrap', page: AlignmentWrapPage()),
            _globalWidget.screenDetailList(context: context, title: 'Vertical Direction Wrap', page: VerticalDirectionWrapPage()),
            _globalWidget.screenDetailList(context: context, title: 'Text Direction Wrap', page: TextDirectionWrapPage()),
          ],
        )
    );
  }
}
