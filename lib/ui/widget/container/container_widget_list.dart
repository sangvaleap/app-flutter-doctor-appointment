import 'package:doctor_app/config/constant.dart';
import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:doctor_app/ui/widget/container/border_container.dart';
import 'package:doctor_app/ui/widget/container/border_radius_container.dart';
import 'package:doctor_app/ui/widget/container/coloring_container.dart';
import 'package:doctor_app/ui/widget/container/gradient_color_container.dart';
import 'package:doctor_app/ui/widget/container/margin_container.dart';
import 'package:doctor_app/ui/widget/container/padding_container.dart';
import 'package:doctor_app/ui/widget/container/shadow_container.dart';
import 'package:doctor_app/ui/widget/container/standart_container.dart';
import 'package:flutter/material.dart';

class ContainerWidgetListPage extends StatefulWidget {
  @override
  _ContainerWidgetListPageState createState() => _ContainerWidgetListPageState();
}

class _ContainerWidgetListPageState extends State<ContainerWidgetListPage> {
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
              child: Text('Container Widget', style: TextStyle(
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
                        child: Text('Container Widget is one of the main widget in Flutter.', style: TextStyle(
                            fontSize: 15, color: BLACK77,letterSpacing: 0.5
                        )),
                      )
                  ),
                  Flexible(
                      flex: 2,
                      child: Container(
                          alignment: Alignment.center,
                          child: Icon(Icons.highlight_alt, size: 50, color: SOFT_BLUE))
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
            _globalWidget.screenDetailList(context: context, title: 'Standart Container', page: StandartContainerPage()),
            _globalWidget.screenDetailList(context: context, title: 'Coloring Container', page: ColoringContainerPage()),
            _globalWidget.screenDetailList(context: context, title: 'Gradient Color Container', page: GradientColorContainerPage()),
            _globalWidget.screenDetailList(context: context, title: 'Margin on Container', page: MarginContainerPage()),
            _globalWidget.screenDetailList(context: context, title: 'Padding on Container', page: PaddingContainerPage()),
            _globalWidget.screenDetailList(context: context, title: 'Border Container', page: BorderContainerPage()),
            _globalWidget.screenDetailList(context: context, title: 'Border Radius Container', page: BorderRadiusContainerPage()),
            _globalWidget.screenDetailList(context: context, title: 'Shadow Container', page: ShadowContainerPage()),
          ],
        )
    );
  }
}
