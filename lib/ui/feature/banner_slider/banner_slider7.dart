import 'package:carousel_slider/carousel_slider.dart';
import 'package:doctor_app/config/constant.dart';
import 'package:doctor_app/model/feature/banner_slider_model.dart';
import 'package:doctor_app/ui/reusable/cache_image_network.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

class BannerSlider7Page extends StatefulWidget {
  @override
  _BannerSlider7PageState createState() => _BannerSlider7PageState();
}

class _BannerSlider7PageState extends State<BannerSlider7Page> with TickerProviderStateMixin {
  Color _color1 = Color(0xff777777);
  
  Color _bulletColor = Color(0xff01aed6);

  int _currentImageSlider = 0;

  List<BannerSliderModel> _bannerData = [];

  late ScrollController _scrollController;
  Color _topIconColor = Colors.white;
  Color _topSearchColor = Colors.white;
  late AnimationController _topColorAnimationController;
  late Animation _appBarColor;
  SystemUiOverlayStyle _appBarSystemOverlayStyle = SystemUiOverlayStyle.light;

  @override
  void initState() {
    setupAnimateAppbar();

    _bannerData.add(BannerSliderModel(id: 1, image: GLOBAL_URL+'/assets/images/home_banner/1.jpg'));
    _bannerData.add(BannerSliderModel(id: 2, image: GLOBAL_URL+'/assets/images/home_banner/2.jpg'));
    _bannerData.add(BannerSliderModel(id: 3, image: GLOBAL_URL+'/assets/images/home_banner/3.jpg'));
    _bannerData.add(BannerSliderModel(id: 4, image: GLOBAL_URL+'/assets/images/home_banner/4.jpg'));
    _bannerData.add(BannerSliderModel(id: 5, image: GLOBAL_URL+'/assets/images/home_banner/5.jpg'));
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _topColorAnimationController.dispose();
    super.dispose();
  }

  void setupAnimateAppbar(){
    // use this function and paramater to animate top bar
    _topColorAnimationController = AnimationController(vsync: this, duration: Duration(seconds: 0));
    _appBarColor = ColorTween(begin: Colors.transparent, end: Colors.white).animate(_topColorAnimationController);
    _scrollController = ScrollController()..addListener((){
      _topColorAnimationController.animateTo(_scrollController.offset/120);
      // if scroll for above 150, then change app bar color to white, search button to dark, and top icon color to dark
      // if scroll for below 150, then change app bar color to transparent, search button to white and top icon color to light
      if(_scrollController.hasClients && _scrollController.offset > (150 - kToolbarHeight)){
        if(_topIconColor != _color1){
          _topIconColor = _color1;
          _topSearchColor = Colors.grey[100]!;
          _appBarSystemOverlayStyle = SystemUiOverlayStyle.dark;
        }
      } else {
        if(_topIconColor != Colors.white){
          _topIconColor = Colors.white;
          _topSearchColor = Colors.white;
          _appBarSystemOverlayStyle = SystemUiOverlayStyle.light;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          CustomScrollView(
            controller: _scrollController,
            slivers: [
              SliverList(
                delegate: SliverChildListDelegate(
                    [
                      _createHomeBannerSlider(),
                      _createList()
                    ]
                )
              )
            ],
          ),
          _createAppBar()
        ],
      ),
    );
  }

  Widget _createAppBar(){
    return Container(
      height: 80,
      child: AnimatedBuilder(
        animation: _topColorAnimationController,
        builder: (context, child) => AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: _appBarColor.value,
          systemOverlayStyle: _appBarSystemOverlayStyle,
          elevation: 0,
          title: Container(
            child: TextButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith<Color>(
                        (Set<MaterialState> states) => _topSearchColor,
                  ),
                  overlayColor: MaterialStateProperty.all(Colors.transparent),
                  shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      )
                  ),
                ),
                onPressed: () {
                  Fluttertoast.showToast(msg: 'Click search', toastLength: Toast.LENGTH_SHORT);
                },
                child: Row(
                  children: [
                    SizedBox(width: 8),
                    Icon(Icons.search, color: Colors.grey[500], size: 18,),
                    SizedBox(width: 8),
                    Text(
                      'Search product',
                      style: TextStyle(
                          color: Colors.grey[500],
                          fontWeight: FontWeight.normal),
                    )
                  ],
                )
            ),
          ),
          actions: [
            GestureDetector(
                onTap: () {
                  Fluttertoast.showToast(msg: 'Click message', toastLength: Toast.LENGTH_SHORT);
                },
                child: Icon(Icons.email, color: _topIconColor)),
            IconButton(
                icon: Icon(Icons.notifications, color: _topIconColor),
                onPressed: () {
                  Fluttertoast.showToast(msg: 'Click notification', toastLength: Toast.LENGTH_SHORT);
                }),
          ],
        ),
      ),
    );
  }

  Widget _createHomeBannerSlider(){
    return Column(
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
    );
  }

  Widget _createList(){
    return Column(
      children: List.generate(20, (index) {
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          color: Colors.pinkAccent,
          child: ListTile(
            leading: Container(
              width: 48,
              height: 48,
              padding: EdgeInsets.symmetric(vertical: 4),
              alignment: Alignment.center,
              child: CircleAvatar(
                child: Icon(Icons.person),
                backgroundColor: Colors.white,
              ),
            ),
            trailing: Icon(Icons.more_vert, color: Colors.white),
            title: Text('Title '+index.toString(), style: TextStyle(color: Colors.white)),
            subtitle: Text('Subtitle '+index.toString(), style: TextStyle(color: Colors.white)),
            onTap: (){
              print('index : '+index.toString());
            },
          ),
        );
      }),
    );
  }
}
