import 'package:doctor_app/config/constant.dart';
import 'package:doctor_app/ui/feature/badges/badges1.dart';
import 'package:doctor_app/ui/feature/badges/badges10.dart';
import 'package:doctor_app/ui/feature/badges/badges2.dart';
import 'package:doctor_app/ui/feature/badges/badges3.dart';
import 'package:doctor_app/ui/feature/badges/badges4.dart';
import 'package:doctor_app/ui/feature/badges/badges5.dart';
import 'package:doctor_app/ui/feature/badges/badges6.dart';
import 'package:doctor_app/ui/feature/badges/badges7.dart';
import 'package:doctor_app/ui/feature/badges/badges8.dart';
import 'package:doctor_app/ui/feature/badges/badges9.dart';
import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';

class BadgesListPage extends StatefulWidget {
  @override
  _BadgesListPageState createState() => _BadgesListPageState();
}

class _BadgesListPageState extends State<BadgesListPage> {
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
              child: Text('Badges', style: TextStyle(
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
                        child: Text('Badges for Flutter.', style: TextStyle(
                            fontSize: 15, color: BLACK77,letterSpacing: 0.5
                        )),
                      )
                  ),
                  Flexible(
                      flex: 2,
                      child: Container(
                          alignment: Alignment.center,
                          child: Icon(Icons.label, size: 50, color: SOFT_BLUE))
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
            _globalWidget.screenDetailList(context: context, title: 'Badges 1 - Standart', page: Badges1Page()),
            _globalWidget.screenDetailList(context: context, title: 'Badges 2 - Chip', page: Badges2Page()),
            _globalWidget.screenDetailList(context: context, title: 'Badges 3 - Animation', page: Badges3Page()),
            _globalWidget.screenDetailList(context: context, title: 'Badges 4 - Color', page: Badges4Page()),
            _globalWidget.screenDetailList(context: context, title: 'Badges 5 - Position', page: Badges5Page()),
            _globalWidget.screenDetailList(context: context, title: 'Badges 6 - Only Circle', page: Badges6Page()),
            _globalWidget.screenDetailList(context: context, title: 'Badges 7 - Rectangle', page: Badges7Page()),
            _globalWidget.screenDetailList(context: context, title: 'Badges 8 - Only Badges', page: Badges8Page()),
            _globalWidget.screenDetailList(context: context, title: 'Badges 9 - With Border', page: Badges9Page()),
            _globalWidget.screenDetailList(context: context, title: 'Badges 10 - With Icon', page: Badges10Page()),
          ],
        )
    );
  }
}
