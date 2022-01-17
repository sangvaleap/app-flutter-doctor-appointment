import 'package:doctor_app/config/constant.dart';
import 'package:doctor_app/ui/feature/banner_slider/banner_slider1.dart';
import 'package:doctor_app/ui/feature/banner_slider/banner_slider2.dart';
import 'package:doctor_app/ui/feature/banner_slider/banner_slider3.dart';
import 'package:doctor_app/ui/feature/banner_slider/banner_slider4.dart';
import 'package:doctor_app/ui/feature/banner_slider/banner_slider5.dart';
import 'package:doctor_app/ui/feature/banner_slider/banner_slider6.dart';
import 'package:doctor_app/ui/feature/banner_slider/banner_slider7.dart';
import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';

class BannerSliderListPage extends StatefulWidget {
  @override
  _BannerSliderListPageState createState() => _BannerSliderListPageState();
}

class _BannerSliderListPageState extends State<BannerSliderListPage> {
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
              child: Text('Banner Slider', style: TextStyle(
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
                        child: Text('Banner Slider used to slide an image banner.', style: TextStyle(
                            fontSize: 15, color: BLACK77,letterSpacing: 0.5
                        )),
                      )
                  ),
                  Flexible(
                      flex: 2,
                      child: Container(
                          alignment: Alignment.center,
                          child: Icon(Icons.slideshow, size: 50, color: SOFT_BLUE))
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
            _globalWidget.screenDetailList(context: context, title: 'Banner Slider 1 (Full Width)', page: BannerSlider1Page()),
            _globalWidget.screenDetailList(context: context, title: 'Banner Slider 2 (Custom Indicator)', page: BannerSlider2Page()),
            _globalWidget.screenDetailList(context: context, title: 'Banner Slider 3 (Vertical Slider)', page: BannerSlider3Page()),
            _globalWidget.screenDetailList(context: context, title: 'Banner Slider 4', page: BannerSlider4Page()),
            _globalWidget.screenDetailList(context: context, title: 'Banner Slider 5 (Full Screen)', page: BannerSlider5Page()),
            _globalWidget.screenDetailList(context: context, title: 'Banner Slider 6 (Multiple Image in 1 screen)', page: BannerSlider6Page()),
            _globalWidget.screenDetailList(context: context, title: 'Banner Slider 7 (Banner Slider with AppBar animation)', page: BannerSlider7Page())
          ],
        )
    );
  }
}
