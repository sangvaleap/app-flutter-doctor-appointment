import 'package:carousel_slider/carousel_slider.dart';
import 'package:doctor_app/config/constant.dart';
import 'package:doctor_app/model/feature/banner_slider_model.dart';
import 'package:doctor_app/ui/reusable/cache_image_network.dart';
import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';

class BannerSlider4Page extends StatefulWidget {
  @override
  _BannerSlider4PageState createState() => _BannerSlider4PageState();
}

class _BannerSlider4PageState extends State<BannerSlider4Page> {
  // initialize global widget
  final _globalWidget = GlobalWidget();

  List<BannerSliderModel> bannerData = [];

  Color _bulletColor = Color(0xff01aed6);

  int _currentImageSlider = 0;

  @override
  void initState() {
    bannerData.add(BannerSliderModel(id: 1, image: GLOBAL_URL+'/assets/images/home_banner/1.jpg'));
    bannerData.add(BannerSliderModel(id: 2, image: GLOBAL_URL+'/assets/images/home_banner/2.jpg'));
    bannerData.add(BannerSliderModel(id: 3, image: GLOBAL_URL+'/assets/images/home_banner/3.jpg'));
    bannerData.add(BannerSliderModel(id: 3, image: GLOBAL_URL+'/assets/images/home_banner/4.jpg'));
    bannerData.add(BannerSliderModel(id: 3, image: GLOBAL_URL+'/assets/images/home_banner/5.jpg'));
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
                title: 'Banner Slider 4',
                desc: 'This is the example of banner slider'
            ),
          ),
          Column(
            children: [
              CarouselSlider(
                items: bannerData.map((item) => Container(
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                    child: buildCacheNetworkImage(width: 1000, url: item.image),
                  ),
                )).toList(),
                options: CarouselOptions(
                    autoPlay: true,
                    autoPlayInterval: Duration(seconds: 6),
                    autoPlayAnimationDuration: Duration(milliseconds: 300),
                    enlargeCenterPage: true,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _currentImageSlider = index;
                      });
                  }
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: bannerData.map((item) {
                  int index = bannerData.indexOf(item);
                  return AnimatedContainer(
                    duration: Duration(milliseconds: 150),
                    width: _currentImageSlider == index?16.0:8.0,
                    height: 8.0,
                    margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 4.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
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