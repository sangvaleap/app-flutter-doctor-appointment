import 'package:carousel_slider/carousel_slider.dart';
import 'package:doctor_app/config/constant.dart';
import 'package:doctor_app/model/feature/banner_slider_model.dart';
import 'package:doctor_app/ui/reusable/cache_image_network.dart';
import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';

class BannerSlider2Page extends StatefulWidget {
  @override
  _BannerSlider2PageState createState() => _BannerSlider2PageState();
}

class _BannerSlider2PageState extends State<BannerSlider2Page> {
  // initialize global widget
  final _globalWidget = GlobalWidget();

  Color _bulletColor = Color(0xff01aed6);

  int _currentImageSlider = 0;

  List<BannerSliderModel> _bannerData = [];

  @override
  void initState() {
    _bannerData.add(BannerSliderModel(id: 1, image: GLOBAL_URL+'/assets/images/category_banner/1.jpg'));
    _bannerData.add(BannerSliderModel(id: 2, image: GLOBAL_URL+'/assets/images/category_banner/2.jpg'));
    _bannerData.add(BannerSliderModel(id: 3, image: GLOBAL_URL+'/assets/images/category_banner/3.jpg'));
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
                title: 'Banner Slider 2',
                desc: 'This is the example of banner slider with custom bullet'
            ),
          ),
          Stack(
            children: [
              CarouselSlider(
                items: _bannerData.map((item) => Container(
                  child: buildCacheNetworkImage(width: 0, height: 0, url: item.image),
                )).toList(),
                options: CarouselOptions(
                    aspectRatio: 2,
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
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: _bannerData.map((item) {
                    int index = _bannerData.indexOf(item);
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
              ),
            ],
          )
        ],
      ),
    );
  }
}
