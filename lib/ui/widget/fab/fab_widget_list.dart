import 'package:doctor_app/config/constant.dart';
import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:doctor_app/ui/widget/fab/fab_animation.dart';
import 'package:doctor_app/ui/widget/fab/fab_position.dart';
import 'package:doctor_app/ui/widget/fab/fab_with_border_radius.dart';
import 'package:doctor_app/ui/widget/fab/fab_with_label.dart';
import 'package:doctor_app/ui/widget/fab/fab_with_shape.dart';
import 'package:doctor_app/ui/widget/fab/mini_fab.dart';
import 'package:doctor_app/ui/widget/fab/multi_fab_animation.dart';
import 'package:doctor_app/ui/widget/fab/standart_fab.dart';
import 'package:flutter/material.dart';

class FabWidgetListPage extends StatefulWidget {
  @override
  _FabWidgetListPageState createState() => _FabWidgetListPageState();
}

class _FabWidgetListPageState extends State<FabWidgetListPage> {
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
              child: Text('Floating Action Button Widget', style: TextStyle(
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
                        child: Text('A floating action button is a circular icon button that hovers over content to promote a primary action in the application.', style: TextStyle(
                            fontSize: 15, color: BLACK77,letterSpacing: 0.5
                        )),
                      )
                  ),
                  Flexible(
                      flex: 2,
                      child: Container(
                          alignment: Alignment.center,
                          child: Icon(Icons.add_circle, size: 50, color: SOFT_BLUE))
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
            _globalWidget.screenDetailList(context: context, title: 'Standart FAB', page: StandartFabPage()),
            _globalWidget.screenDetailList(context: context, title: 'FAB position', page: FabPositionPage()),
            _globalWidget.screenDetailList(context: context, title: 'FAB with label', page: FabWithLabelPage()),
            _globalWidget.screenDetailList(context: context, title: 'Mini FAB', page: MiniFabPage()),
            _globalWidget.screenDetailList(context: context, title: 'FAB with shape', page: FabWithShapePage()),
            _globalWidget.screenDetailList(context: context, title: 'FAB with border radius', page: FabWithBorderRadiusPage()),
            _globalWidget.screenDetailList(context: context, title: 'FAB animation', page: FabAnimationPage()),
            _globalWidget.screenDetailList(context: context, title: 'Multi FAB animation', page: MultiFabAnimationPage()),
          ],
        )
    );
  }
}
