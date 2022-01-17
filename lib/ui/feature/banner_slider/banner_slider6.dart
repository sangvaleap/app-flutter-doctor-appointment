import 'package:carousel_slider/carousel_slider.dart';
import 'package:doctor_app/config/constant.dart';
import 'package:doctor_app/model/feature/banner_slider_model.dart';
import 'package:doctor_app/ui/reusable/cache_image_network.dart';
import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';

class BannerSlider6Page extends StatefulWidget {
  @override
  _BannerSlider6PageState createState() => _BannerSlider6PageState();
}

class _BannerSlider6PageState extends State<BannerSlider6Page> {
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
                title: 'Banner Slider 6',
                desc: 'This is the example of banner slider with multiple image in 1 screen'
            ),
          ),
          Column(
            children: [
              Container(
                  child: CarouselSlider.builder(
                    options: CarouselOptions(
                      aspectRatio: 2.0,
                      enlargeCenterPage: false,
                      viewportFraction: 1,
                      onPageChanged: (index, reason) {
                        setState(() {
                          _currentImageSlider = index;
                        });
                      }
                    ),
                    itemCount: (_bannerData.length / 2).round(),
                    itemBuilder: (context, index, realIdx) {
                      final int first = index * 2;
                      final int second = first + 1;
                      return Row(
                        children: [first, second].map((idx) {
                          if(idx%2==1 && idx==_bannerData.length){
                            return Expanded(
                              flex: 1,
                              child: Container(),
                            );
                          }
                          return Expanded(
                            flex: 1,
                            child: Container(
                              margin: EdgeInsets.symmetric(horizontal: 10),
                              child: ClipRRect(
                                borderRadius: BorderRadius.all(Radius.circular(12)),
                                child: buildCacheNetworkImage(width: 500, url: _bannerData[idx].image, plColor: Colors.transparent)
                              ),
                            ),
                          );
                        }).toList(),
                      );
                    },
                  )
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate((_bannerData.length/2).round(), (index) {
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
                }),
              )
            ],
          )
        ],
      ),
    );
  }
}
