import 'package:doctor_app/config/constant.dart';
import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:doctor_app/ui/widget/card/border_radius_card.dart';
import 'package:doctor_app/ui/widget/card/elevation_card.dart';
import 'package:doctor_app/ui/widget/card/shadow_color_card.dart';
import 'package:doctor_app/ui/widget/card/standart_card.dart';
import 'package:flutter/material.dart';

class CardWidgetListPage extends StatefulWidget {
  @override
  _CardWidgetListPageState createState() => _CardWidgetListPageState();
}

class _CardWidgetListPageState extends State<CardWidgetListPage> {
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
              child: Text('Card Widget', style: TextStyle(
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
                        child: Text('Card Widget is one of the usefull widget in Flutter', style: TextStyle(
                            fontSize: 15, color: BLACK77,letterSpacing: 0.5
                        )),
                      )
                  ),
                  Flexible(
                      flex: 2,
                      child: Container(
                          alignment: Alignment.center,
                          child: Icon(Icons.collections, size: 50, color: SOFT_BLUE))
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
            _globalWidget.screenDetailList(context: context, title: 'Standart Card', page: StandartCardPage()),
            _globalWidget.screenDetailList(context: context, title: 'Border Radius Card', page: BorderRadiusCardPage()),
            _globalWidget.screenDetailList(context: context, title: 'Elevation Card', page: ElevationCardPage()),
            _globalWidget.screenDetailList(context: context, title: 'Shadow Color Card', page: ShadowColorCardPage()),
          ],
        )
    );
  }
}
