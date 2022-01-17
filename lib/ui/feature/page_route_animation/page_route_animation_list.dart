import 'package:doctor_app/config/constant.dart';
import 'package:doctor_app/ui/feature/page_route_animation/combine_route_animation.dart';
import 'package:doctor_app/ui/feature/page_route_animation/cupertino_page_route.dart';
import 'package:doctor_app/ui/feature/page_route_animation/fade_route_animation.dart';
import 'package:doctor_app/ui/feature/page_route_animation/material_page_route.dart';
import 'package:doctor_app/ui/feature/page_route_animation/rotation_route_animation.dart';
import 'package:doctor_app/ui/feature/page_route_animation/scale_route_animation.dart';
import 'package:doctor_app/ui/feature/page_route_animation/size_route_animation.dart';
import 'package:doctor_app/ui/feature/page_route_animation/slide_route_animation.dart';
import 'package:doctor_app/ui/feature/page_route_animation/without_animation.dart';
import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';

class PageRouteAnimationListPage extends StatefulWidget {
  @override
  _PageRouteAnimationListPageState createState() => _PageRouteAnimationListPageState();
}

class _PageRouteAnimationListPageState extends State<PageRouteAnimationListPage> {
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
              child: Text('Page Route Animation', style: TextStyle(
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
                        child: Text('Page route animation is used to animate transition when change between screen.', style: TextStyle(
                            fontSize: 15, color: BLACK77,letterSpacing: 0.5
                        )),
                      )
                  ),
                  Flexible(
                      flex: 2,
                      child: Container(
                          alignment: Alignment.center,
                          child: Icon(Icons.keyboard_tab, size: 50, color: SOFT_BLUE))
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
            _globalWidget.screenDetailList(context: context, title: 'Material Page Route', page: MaterialPageRoutePage()),
            _globalWidget.screenDetailList(context: context, title: 'Cupertino Page Route', page: CupertinoPageRoutePage()),
            _globalWidget.screenDetailList(context: context, title: 'Page Route Without Animation', page: WithoutAnimationPage()),
            _globalWidget.screenDetailList(context: context, title: 'Slide Route Animation', page: SlideRouteAnimationPage()),
            _globalWidget.screenDetailList(context: context, title: 'Scale Route Animation', page: ScaleRouteAnimationPage()),
            _globalWidget.screenDetailList(context: context, title: 'Rotation Route Animation', page: RotationRouteAnimationPage()),
            _globalWidget.screenDetailList(context: context, title: 'Size Route Animation', page: SizeRouteAnimationPage()),
            _globalWidget.screenDetailList(context: context, title: 'Fade Route Animation', page: FadeRouteAnimationPage()),
            _globalWidget.screenDetailList(context: context, title: 'Combine Route Animation (Scale & Rotate)', page: CombineRouteAnimationPage()),
          ],
        )
    );
  }
}
