import 'package:carousel_slider/carousel_slider.dart';
import 'package:doctor_app/config/constant.dart';
import 'package:doctor_app/model/feature/banner_slider_model.dart';
import 'package:doctor_app/ui/reusable/cache_image_network.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class NavPage1 extends StatefulWidget {
  @override
  _NavPage1State createState() => _NavPage1State();
}

class _NavPage1State extends State<NavPage1> {
  Color _color = Color(0xFF37474f);

  int _currentImageSlider = 0;

  List<BannerSliderModel> _bannerData = [];
  List<BannerSliderModel> _movieData = [];
  late String _movieTitle;

  @override
  void initState() {
    _bannerData.add(BannerSliderModel(id: 1, image: GLOBAL_URL+'/assets/images/home_banner/1.jpg'));
    _bannerData.add(BannerSliderModel(id: 2, image: GLOBAL_URL+'/assets/images/home_banner/2.jpg'));
    _bannerData.add(BannerSliderModel(id: 3, image: GLOBAL_URL+'/assets/images/home_banner/3.jpg'));
    _bannerData.add(BannerSliderModel(id: 4, image: GLOBAL_URL+'/assets/images/home_banner/4.jpg'));
    _bannerData.add(BannerSliderModel(id: 5, image: GLOBAL_URL+'/assets/images/home_banner/5.jpg'));

    _movieData.add(BannerSliderModel(id: 1, name: 'Bloodshot', image: GLOBAL_URL+'/assets/images/movie/bloodshot.jpg'));
    _movieData.add(BannerSliderModel(id: 2, name: 'Dolittle', image: GLOBAL_URL+'/assets/images/movie/dolittle.jpg'));
    _movieData.add(BannerSliderModel(id: 3, name: 'The Invisible Man', image: GLOBAL_URL+'/assets/images/movie/invisible_man.jpg'));
    _movieData.add(BannerSliderModel(id: 4, name: 'Peninsula', image: GLOBAL_URL+'/assets/images/movie/peninsula.jpg'));
    _movieData.add(BannerSliderModel(id: 5, name: 'Train to Busan', image: GLOBAL_URL+'/assets/images/movie/train_to_busan.jpg'));
    _movieData.add(BannerSliderModel(id: 6, name: 'Venom', image: GLOBAL_URL+'/assets/images/movie/venom.jpg'));
    _movieData.add(BannerSliderModel(id: 7, name: '#Alive', image: GLOBAL_URL+'/assets/images/movie/alive.jpg'));
    _movieData.add(BannerSliderModel(id: 8, name: 'Avengers: Endgame', image: GLOBAL_URL+'/assets/images/movie/avenger.jpg'));

    _movieTitle = _movieData[0].name!;

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
          physics: AlwaysScrollableScrollPhysics(),
          children: [
            GestureDetector(
              onTap: (){
                Fluttertoast.showToast(msg: 'Click location', toastLength: Toast.LENGTH_SHORT);
              },
              child: Container(
                color: Colors.grey[100],
                padding: EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.location_on, color: Colors.grey[700]),
                        SizedBox(width: 8),
                        Text('NEW YORK')
                      ],
                    ),
                    Icon(Icons.keyboard_arrow_down, color: Colors.grey[700])
                  ],
                ),
              ),
            ),
            _buildHomeBanner(),
            _nowShowing(),
            _movieNews(),
            _comingSoon()
          ],
        ),
    );
  }

  Widget _buildHomeBanner(){
    return Stack(
      children: [
        CarouselSlider(
          items: _bannerData.map((item) => Container(
            child: GestureDetector(
                onTap: (){
                  Fluttertoast.showToast(msg: 'Click banner '+item.id.toString(), toastLength: Toast.LENGTH_SHORT);
                },
                child: buildCacheNetworkImage(width: 1000, height: 0, url: item.image)
            ),
          )).toList(),
          options: CarouselOptions(
              aspectRatio: 2.5,
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
                width: _currentImageSlider == index?10:5,
                height: _currentImageSlider == index?10:5,
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 4.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }

  Widget _nowShowing(){
    return Column(
      children: [
        Container(
          margin: EdgeInsets.fromLTRB(16, 24, 16, 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Now Showing', style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              )),
              GestureDetector(
                onTap: (){
                  Fluttertoast.showToast(msg: 'Click view all', toastLength: Toast.LENGTH_SHORT);
                },
                child: Text('View All', style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                )),
              )
            ],
          ),
        ),
        CarouselSlider(
          items: _movieData.map((item) => Container(
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(12)),
              child: buildCacheNetworkImage(height: 350, url: item.image),
            ),
          )).toList(),
          options: CarouselOptions(
              height: 350,
              viewportFraction: 0.62,
              autoPlay: false,
              enlargeCenterPage: false,
              onPageChanged: (index, reason) {
                setState(() {
                  _movieTitle = _movieData[index].name!;
                });
              }
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 16),
          child: Text(_movieTitle, style: TextStyle(
              fontSize: 28, color: _color, fontWeight: FontWeight.bold
          )),
        ),
        Divider(color: Colors.grey[300])
      ],
    );
  }

  Widget _movieNews(){
    double boxSize = MediaQuery.of(context).size.width/4;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.fromLTRB(16, 24, 16, 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Movie News', style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              )),
              GestureDetector(
                onTap: (){
                  Fluttertoast.showToast(msg: 'Click view all', toastLength: Toast.LENGTH_SHORT);
                },
                child: Text('View All', style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                )),
              )
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.fromLTRB(16, 0, 16, 16),
          child: Column(
            children: List.generate(5, (index) {
              return Column(
                children: [
                  GestureDetector(
                    onTap: (){
                      Fluttertoast.showToast(msg: 'Click '+_movieData[index].name!, toastLength: Toast.LENGTH_SHORT);
                    },
                    child: Container(
                      height: boxSize,
                      margin: EdgeInsets.symmetric(vertical: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          ClipRRect(
                              borderRadius:
                              BorderRadius.all(Radius.circular(4)),
                              child: buildCacheNetworkImage(width: boxSize, height: boxSize, url: _movieData[index].image)),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('This movie has a title, and the title of this movie is '+_movieData[index].name!, style: TextStyle(
                                    fontSize: 14,
                                    color: _color
                                ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Row(
                                  children: [
                                    Icon(Icons.visibility, color: Colors.grey, size: 11),
                                    SizedBox(width: 2),
                                    Text('134', style: TextStyle(
                                        color: Colors.grey, fontSize: 11
                                    )),
                                    SizedBox(width: 8),
                                    Icon(Icons.thumb_up, color: Colors.grey, size: 11),
                                    SizedBox(width: 2),
                                    Text('20', style: TextStyle(
                                        color: Colors.grey, fontSize: 11
                                    )),
                                    Spacer(),
                                    Text('1 week ago', style: TextStyle(
                                        color: Colors.grey, fontSize: 11
                                    ))
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  (index == _bannerData.length - 1)
                      ? Wrap()
                      : Divider(
                    height: 0,
                    color: Colors.grey[400],
                  )
                ],
              );
            }),
          ),
        ),
        Divider(color: Colors.grey[300])
      ],
    );
  }

  Widget _comingSoon(){
    double boxSize = MediaQuery.of(context).size.width/2.4;
    if(kIsWeb){
      boxSize = 180;
    }
    return Column(
      children: [
        Container(
          margin: EdgeInsets.fromLTRB(16, 24, 16, 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Coming Soon', style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              )),
              GestureDetector(
                onTap: (){
                  Fluttertoast.showToast(msg: 'Click view all', toastLength: Toast.LENGTH_SHORT);
                },
                child: Text('View All', style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                )),
              )
            ],
          ),
        ),
        Container(
          height: 330,
          child: ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 8),
            scrollDirection: Axis.horizontal,
            itemCount: _movieData.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                margin: EdgeInsets.symmetric(horizontal: 8),
                width: boxSize,
                child: GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: (){
                    Fluttertoast.showToast(msg: 'Click '+_movieData[index].name!, toastLength: Toast.LENGTH_SHORT);
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: buildCacheNetworkImage(width: boxSize, url: _movieData[index].image)
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 12),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(_movieData[index].name!,
                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold), maxLines: 2, overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
