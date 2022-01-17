import 'package:carousel_slider/carousel_slider.dart';
import 'package:doctor_app/config/constant.dart';
import 'package:doctor_app/model/feature/banner_slider_model.dart';
import 'package:doctor_app/ui/reusable/cache_image_network.dart';
import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';

class BannerSlider1Page extends StatefulWidget {
  @override
  _BannerSlider1PageState createState() => _BannerSlider1PageState();
}

class _BannerSlider1PageState extends State<BannerSlider1Page> {
  // initialize global widget
  final _globalWidget = GlobalWidget();

  Color _bulletColor = Color(0xff01aed6);

  int _currentImageSlider = 0;
  
  List<BannerSliderModel> _bannerData = [];

  @override
  void initState() {
    _bannerData.add(BannerSliderModel(id: 1, image: GLOBAL_URL+'/assets/images/home_banner/1.jpg'));
    _bannerData.add(BannerSliderModel(id: 2, image: GLOBAL_URL+'/assets/images/home_banner/2.jpg'));
    _bannerData.add(BannerSliderModel(id: 3, image: GLOBAL_URL+'/assets/images/home_banner/3.jpg'));
    _bannerData.add(BannerSliderModel(id: 4, image: GLOBAL_URL+'/assets/images/home_banner/4.jpg'));
    _bannerData.add(BannerSliderModel(id: 5, image: GLOBAL_URL+'/assets/images/home_banner/5.jpg'));
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
          children: [
            Container(
              margin: EdgeInsets.all(16),
              child: _globalWidget.createDetailWidget(
                  title: 'Banner Slider 1',
                  desc: 'This is the example of banner slider with full width'
              ),
            ),
            Column(
              children: [
                CarouselSlider(
                  items: _bannerData.map((item) => Container(
                    child: buildCacheNetworkImage(width: 0, height: 0, url: item.image),
                  )).toList(),
                  options: CarouselOptions(
                      aspectRatio: 8/6,
                      viewportFraction: 1.0,
                      autoPlay: true,
                      autoPlayInterval: Duration(seconds: 6),
                      autoPlayAnimationDuration: Duration(milliseconds: 300),
                      enlargeCenterPage: false,
                      onPageChanged: (index, reason) {
                        setState(() {
                          _currentImageSlider = index;
                        });
                      }
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: _bannerData.map((item) {
                    int index = _bannerData.indexOf(item);
                    return Container(
                      width: 8.0,
                      height: 8.0,
                      margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _currentImageSlider == index
                            ? _bulletColor
                            : Colors.grey[300],
                      ),
                    );
                  }).toList(),
                ),
              ],
            )
          ],
        ),
    );
  }
}
