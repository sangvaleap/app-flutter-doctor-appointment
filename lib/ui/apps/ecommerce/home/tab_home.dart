/*
For this homepage, appBar is created at the bottom after CustomScrollView
we used AutomaticKeepAliveClientMixin to keep the state when moving from 1 navbar to another navbar, so the page is not refresh overtime
 */

import 'dart:async';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:doctor_app/model/apps/ecommerce/category_for_you_model.dart';
import 'package:doctor_app/model/apps/ecommerce/category_model.dart';
import 'package:doctor_app/model/apps/ecommerce/flashsale_model.dart';
import 'package:doctor_app/model/apps/ecommerce/home_banner_model.dart';
import 'package:doctor_app/model/apps/ecommerce/home_trending_model.dart';
import 'package:doctor_app/model/apps/ecommerce/last_search_model.dart';
import 'package:doctor_app/model/apps/ecommerce/recomended_product_model.dart';
import 'package:doctor_app/ui/apps/ecommerce/general/chat_us.dart';
import 'package:doctor_app/ui/apps/ecommerce/general/notification.dart';
import 'package:doctor_app/ui/apps/ecommerce/general/product_detail/product_detail.dart';
import 'package:doctor_app/ui/apps/ecommerce/home/coupon.dart';
import 'package:doctor_app/ui/apps/ecommerce/home/flashsale.dart';
import 'package:doctor_app/ui/apps/ecommerce/home/last_search.dart';
import 'package:doctor_app/ui/apps/ecommerce/home/product_category.dart';
import 'package:doctor_app/ui/apps/ecommerce/home/search.dart';
import 'package:doctor_app/ui/apps/ecommerce/home/search_product.dart';
import 'package:doctor_app/ui/apps/ecommerce/reusable_widget.dart';
import 'package:doctor_app/ui/reusable/cache_image_network.dart';
import 'package:doctor_app/ui/reusable/global_function.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:doctor_app/config/apps/ecommerce/constant.dart';
import 'package:doctor_app/config/apps/ecommerce/global_style.dart';


class TabHomePage extends StatefulWidget {
  @override
  _TabHomePageState createState() => _TabHomePageState();
}

class _TabHomePageState extends State<TabHomePage> with TickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  // initialize global function and reusable widget
  final _globalFunction = GlobalFunction();
  final _reusableWidget = ReusableWidget();

  int _currentImageSlider = 0;

  late ScrollController _scrollController;
  Color _topIconColor = Colors.white;
  Color _topSearchColor = Colors.white;
  late AnimationController _topColorAnimationController;
  late Animation _appBarColor;
  SystemUiOverlayStyle _appBarSystemOverlayStyle = SystemUiOverlayStyle.light;

  Timer? _flashsaleTimer;
  late int _flashsaleSecond;

  void _startFlashsaleTimer() {
    const period = const Duration(seconds: 1);
    _flashsaleTimer = Timer.periodic(period, (timer) {
      setState(() {
        _flashsaleSecond--;
      });
      if (_flashsaleSecond == 0) {
        _cancelFlashsaleTimer();
        Fluttertoast.showToast(msg: 'Flash sale is over', toastLength: Toast.LENGTH_LONG);
      }
    });
  }

  void _cancelFlashsaleTimer() {
    if (_flashsaleTimer != null) {
      _flashsaleTimer?.cancel();
      _flashsaleTimer = null;
    }
  }

  // keep the state to do not refresh when switch navbar
  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    _setupAnimateAppbar();

    // set how many times left for flashsale
    var timeNow = DateTime.now();

    // 8000 second = 2 hours 13 minutes 20 second for flashsale timer
    var flashsaleTime = timeNow.add(Duration(seconds: 8000)).difference(timeNow);
    _flashsaleSecond = flashsaleTime.inSeconds;
    _startFlashsaleTimer();

    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _topColorAnimationController.dispose();

    _cancelFlashsaleTimer();
    super.dispose();
  }

  void _setupAnimateAppbar(){
    // use this function and paramater to animate top bar
    _topColorAnimationController = AnimationController(vsync: this, duration: Duration(seconds: 0));
    _appBarColor = ColorTween(begin: Colors.transparent, end: Colors.white).animate(_topColorAnimationController);
    _scrollController = ScrollController()..addListener((){
      _topColorAnimationController.animateTo(_scrollController.offset/120);
      // if scroll for above 150, then change app bar color to white, search button to dark, and top icon color to dark
      // if scroll for below 150, then change app bar color to transparent, search button to white and top icon color to light
      if(_scrollController.hasClients && _scrollController.offset > (150 - kToolbarHeight)){
        if(_topIconColor != BLACK_GREY){
          _topIconColor = BLACK_GREY;
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
    // if we used AutomaticKeepAliveClientMixin, we must call super.build(context);
    super.build(context);

    final double boxImageSize = (MediaQuery.of(context).size.width / 3);
    final double categoryForYouHeightShort = boxImageSize;
    final double categoryForYouHeightLong = (boxImageSize * 2);

    return Scaffold(
      body: Stack(
        children: [
          CustomScrollView(
            controller: _scrollController,
            slivers: [
              SliverList(
                  delegate: SliverChildListDelegate(
                      [
                        _createHomeBannerSlider(),
                        _createCoupon(),
                        _createGridCategory(),
                        Container(
                          margin: EdgeInsets.only(top:10, left: 16, right: 16),
                          child: Text('Flash Sale', style: GlobalStyle.sectionTitle),
                        ),
                        Container(
                          margin: EdgeInsets.only(top:4, left: 16, right: 16),
                          child: Row(
                            children: [
                              Text('Flash sale end in ', style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 13,
                                  color: CHARCOAL
                              )),
                              _buildFlashsaleTime(),
                              Expanded(
                                child: GestureDetector(
                                  onTap: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => FlashSalePage(seconds: _flashsaleSecond)));
                                  },
                                  child: Text('View All', style: GlobalStyle.viewAll, textAlign: TextAlign.end),
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 16),
                          height: boxImageSize*GlobalStyle.horizontalProductHeightMultiplication,
                          child: ListView.builder(
                            padding: EdgeInsets.only(left: 12, right: 12),
                            scrollDirection: Axis.horizontal,
                            itemCount: flashsaleData.length,
                            itemBuilder: (BuildContext context, int index) {
                              return _buildFlashsaleCard(index, boxImageSize);
                            },
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top:30, left: 16, right: 16),
                          child: Text('Trending Product', style: GlobalStyle.sectionTitle),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(12, 0, 12, 0),
                          child: GridView.count(
                            padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
                            primary: false,
                            childAspectRatio: 4/1.6,
                            shrinkWrap: true,
                            crossAxisSpacing: 2,
                            mainAxisSpacing: 2,
                            crossAxisCount: 2,
                            children: List.generate(homeTrendingData.length, (index) {
                              return _buildTrendingProductCard(index);
                            }),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top:30, left: 16, right: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Last Search', style: GlobalStyle.sectionTitle),
                              GestureDetector(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => LastSearchPage()));
                                },
                                child: Text('View All', style: GlobalStyle.viewAll, textAlign: TextAlign.end),
                              )
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 16),
                          height: boxImageSize*GlobalStyle.horizontalProductHeightMultiplication,
                          child: ListView.builder(
                            padding: EdgeInsets.only(left: 12, right: 12),
                            scrollDirection: Axis.horizontal,
                            itemCount: lastSearchData.length,
                            itemBuilder: (BuildContext context, int index) {
                              return _buildLastSearchCard(index, boxImageSize);
                            },
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top:30, left: 16, right: 16),
                          child: Text('Category For You', style: GlobalStyle.sectionTitle),
                        ),
                        _createCategoryForYou(boxImageSize, categoryForYouHeightShort, categoryForYouHeightLong),
                        Container(
                          margin: EdgeInsets.only(top:30, left: 16, right: 16),
                          child: Text('Recomended Product', style: GlobalStyle.sectionTitle),
                        ),
                        CustomScrollView(
                            shrinkWrap: true,
                            primary: false,
                            slivers: <Widget>[
                              SliverPadding(
                                padding: EdgeInsets.fromLTRB(12, 8, 12, 8),
                                sliver: SliverGrid(
                                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    mainAxisSpacing: 8,
                                    crossAxisSpacing: 8,
                                    childAspectRatio: GlobalStyle.gridDelegateRatio,
                                  ),
                                  delegate: SliverChildBuilderDelegate(
                                        (BuildContext context, int index) {
                                      return _buildRecomendedProductCard(index);
                                    },
                                    childCount: recomendedProductData.length,
                                  ),
                                ),
                              ),
                            ]),
                      ]
                  )
              ),
            ],
          ),
          // Create AppBar with Animation
          Container(
            height: 80,
            child: AnimatedBuilder(
              animation: _topColorAnimationController,
              builder: (context, child) => AppBar(
                automaticallyImplyLeading: false,
                backgroundColor: _appBarColor.value,
                systemOverlayStyle: _appBarSystemOverlayStyle,
                elevation: GlobalStyle.appBarElevation,
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
                        Navigator.push(context, MaterialPageRoute(builder: (context) => SearchPage()));
                      },
                      child: Row(
                        children: [
                          SizedBox(width: 8),
                          Icon(Icons.search, color: Colors.grey[500], size: 18,),
                          SizedBox(width: 8),
                          Text(
                            'Search Product',
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
                        Navigator.push(context, MaterialPageRoute(builder: (context) => ChatUsPage()));
                      },
                      child: Icon(Icons.email, color: _topIconColor)),
                  IconButton(
                      icon: _reusableWidget.customNotifIcon(count: 8, notifColor: _topIconColor),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => NotificationPage()));
                      }),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _createHomeBannerSlider(){
    return Column(
      children: [
        CarouselSlider(
          items: homeBannerData.map((item) => Container(
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
          children: homeBannerData.map((item) {
            int index = homeBannerData.indexOf(item);
            return Container(
              width: 8.0,
              height: 8.0,
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _currentImageSlider == index
                    ? PRIMARY_COLOR
                    : Colors.grey[300],
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _createCoupon(){
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => CouponPage()));
      },
      child: Container(
        padding: EdgeInsets.all(12),
        margin: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
            color: SOFT_BLUE,
            borderRadius: BorderRadius.circular(5)
        ),
        child: Row(
          children: [
            Expanded(
              child: Container(
                child: Text(
                  'There are 10 coupon waiting',
                  style: TextStyle(fontSize: 14, color: Color(0xffffffff), fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Icon(Icons.local_offer, color: Colors.white)
          ],
        ),
      ),
    );
  }

  Widget _buildFlashsaleTime(){
    int hour = _flashsaleSecond ~/ 3600;
    int minute = _flashsaleSecond % 3600 ~/ 60;
    int second = _flashsaleSecond % 60;

    return Row(
      children: [
        Container(
          padding: EdgeInsets.fromLTRB(3, 4, 3, 4),
          decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(5)
          ), //
          child: Text(_globalFunction.formatTime(hour), style: TextStyle(
              color: Colors.white,
              fontSize: 13,
              fontWeight: FontWeight.bold
          )),
        ),
        Text(' : ', style: TextStyle(
            color: Colors.red,
            fontSize: 13,
            fontWeight: FontWeight.bold
        )),
        Container(
          padding: EdgeInsets.fromLTRB(3, 4, 3, 4),
          decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(5)
          ), //
          child: Text(_globalFunction.formatTime(minute), style: TextStyle(
              color: Colors.white,
              fontSize: 13,
              fontWeight: FontWeight.bold
          )),
        ),
        Text(' : ', style: TextStyle(
            color: Colors.red,
            fontSize: 13,
            fontWeight: FontWeight.bold
        )),
        Container(
          padding: EdgeInsets.fromLTRB(3, 4, 3, 4),
          decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(5)
          ), //
          child: Text(_globalFunction.formatTime(second), style: TextStyle(
              color: Colors.white,
              fontSize: 13,
              fontWeight: FontWeight.bold
          )),
        )
      ],
    );
  }

  Widget _createGridCategory(){
    return GridView.count(
      padding: EdgeInsets.fromLTRB(16, 16, 16, 0),
      primary: false,
      childAspectRatio: 1.1,
      shrinkWrap: true,
      crossAxisSpacing: 0,
      mainAxisSpacing: 0,
      crossAxisCount: 4,
      children: List.generate(categoryData.length, (index) {
        return GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => ProductCategoryPage(categoryId: categoryData[index].id, categoryName: categoryData[index].name)));
            },
            child: Column(
                children: [
                  buildCacheNetworkImage(width: 40, height: 40, url: categoryData[index].image, plColor: Colors.transparent),
                  Flexible(
                    child: Container(
                      margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                      child: Text(
                        categoryData[index].name,
                        style: TextStyle(
                          color: CHARCOAL,
                          fontWeight: FontWeight.normal,
                          fontSize: 12,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  )
                ]));
      }),
    );
  }

  Widget _buildFlashsaleCard(index, boxImageSize){
    return Container(
      width: boxImageSize+10,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 2,
        color: Colors.white,
        child: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDetailPage(name: flashsaleData[index].name, image: flashsaleData[index].image, price: flashsaleData[index].price, rating: 4, review: 45, sale: flashsaleData[index].sale)));
          },
          child: Column(
            children: <Widget>[
              Stack(
                children: [
                  ClipRRect(
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                      child: buildCacheNetworkImage(width: boxImageSize+10, height: boxImageSize+10, url: flashsaleData[index].image)
                  ),
                  Positioned(
                    right: 0,
                    top:10,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(6), bottomLeft: Radius.circular(6))
                      ),
                      padding: EdgeInsets.fromLTRB(8, 4, 8, 4),
                      child: Text(flashsaleData[index].discount.toString()+'%', style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12
                      )),
                    ),
                  )
                ],
              ),
              Container(
                margin: EdgeInsets.fromLTRB(8, 8, 8, 8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      flashsaleData[index].name,
                      style: GlobalStyle.productName, maxLines: 2, overflow: TextOverflow.ellipsis,
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 5),
                      child: Text('\$ '+_globalFunction.removeDecimalZeroFormat(flashsaleData[index].price), style: GlobalStyle.productPriceDiscounted),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 2),
                      child: Text('\$ '+_globalFunction.removeDecimalZeroFormat(((100-flashsaleData[index].discount)*flashsaleData[index].price/100)), style: GlobalStyle.productPrice),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTrendingProductCard(index){
    return GestureDetector(
      onTap: () {
        StatefulWidget menuPage = SearchProductPage(words: homeTrendingData[index].name);
        Navigator.push(context, MaterialPageRoute(builder: (context) => menuPage));
      },
      child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          elevation: 2,
          color: Colors.white,
          child: Row(
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(10), bottomLeft: Radius.circular(10)),
                  child: buildCacheNetworkImage(width: (MediaQuery.of(context).size.width/2)*(1.6/4)-12-1, height: (MediaQuery.of(context).size.width/2)*(1.6/4)-12-1, url: homeTrendingData[index].image)
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(homeTrendingData[index].name, style: TextStyle(
                          fontSize: 11, fontWeight: FontWeight.bold
                      )),
                      SizedBox(height: 4),
                      Text(homeTrendingData[index].sale+' Product', style: TextStyle(
                          fontSize: 9, color: BLACK_GREY
                      ))
                    ],
                  ),
                ),
              )
            ],
          )
      ),
    );
  }

  Widget _buildLastSearchCard(index, boxImageSize){
    return Container(
      width: boxImageSize+10,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 2,
        color: Colors.white,
        child: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDetailPage(name: lastSearchData[index].name, image: lastSearchData[index].image, price: lastSearchData[index].price, rating: lastSearchData[index].rating, review: lastSearchData[index].review, sale: lastSearchData[index].sale)));
          },
          child: Column(
            children: <Widget>[
              ClipRRect(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                  child: buildCacheNetworkImage(width: boxImageSize+10, height: boxImageSize+10, url: lastSearchData[index].image)
              ),
              Container(
                margin: EdgeInsets.fromLTRB(8, 8, 8, 8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      lastSearchData[index].name,
                      style: GlobalStyle.productName, maxLines: 2, overflow: TextOverflow.ellipsis,
                    ),
                    Container(
                      margin: EdgeInsets.only(top:5),
                      child: Text('\$ '+_globalFunction.removeDecimalZeroFormat(lastSearchData[index].price), style: GlobalStyle.productPrice),
                    ),
                    Container(
                      margin: EdgeInsets.only(top:5),
                      child: Row(
                        children: [
                          _reusableWidget.createRatingBar(rating: lastSearchData[index].rating, size: 12),
                          Text('('+lastSearchData[index].review.toString()+')', style: GlobalStyle.productTotalReview)
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _createCategoryForYou(boxImageSize, categoryForYouHeightShort, categoryForYouHeightLong){
    return Container(
      margin: EdgeInsets.only(top:8),
      width: MediaQuery.of(context).size.width,
      height:categoryForYouHeightLong,
      child: Row(
        children: [
          GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => ProductCategoryPage(categoryId: categoryForYouData[0].id, categoryName: categoryData[0].name)));
            },
            child: Container(
              width: boxImageSize,
              height: categoryForYouHeightLong,
              child: buildCacheNetworkImage(width: 0, height: 0, url: categoryForYouData[0].image),
            ),
          ),
          Column(
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ProductCategoryPage(categoryId: categoryForYouData[1].id, categoryName: categoryData[1].name)));
                    },
                    child: Container(
                      width: boxImageSize,
                      height: categoryForYouHeightShort,
                      child: buildCacheNetworkImage(width: 0, height: 0, url: categoryForYouData[1].image),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ProductCategoryPage(categoryId: categoryForYouData[2].id, categoryName: categoryData[2].name)));
                    },
                    child: Container(
                      width: boxImageSize,
                      height: categoryForYouHeightShort,
                      child: buildCacheNetworkImage(width: 0, height: 0, url: categoryForYouData[2].image),
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ProductCategoryPage(categoryId: categoryForYouData[3].id, categoryName: categoryData[3].name)));
                    },
                    child: Container(
                      width: boxImageSize,
                      height: categoryForYouHeightShort,
                      child: buildCacheNetworkImage(width: 0, height: 0, url: categoryForYouData[3].image),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ProductCategoryPage(categoryId: categoryForYouData[4].id, categoryName: categoryData[4].name)));
                    },
                    child: Container(
                      width: boxImageSize,
                      height: categoryForYouHeightShort,
                      child: buildCacheNetworkImage(width: 0, height: 0, url: categoryForYouData[4].image),
                    ),
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _buildRecomendedProductCard(index){
    final double boxImageSize = ((MediaQuery.of(context).size.width)-24)/2-12;
    return Container(
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 2,
        color: Colors.white,
        child: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDetailPage(name: recomendedProductData[index].name, image: recomendedProductData[index].image, price: recomendedProductData[index].price, rating: recomendedProductData[index].rating, review: recomendedProductData[index].review, sale: recomendedProductData[index].sale)));
          },
          child: Column(
            children: <Widget>[
              ClipRRect(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                  child: buildCacheNetworkImage(width: boxImageSize, height: boxImageSize, url: recomendedProductData[index].image)
              ),
              Container(
                margin: EdgeInsets.fromLTRB(8, 8, 8, 8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      recomendedProductData[index].name,
                      style: GlobalStyle.productName, maxLines: 2, overflow: TextOverflow.ellipsis,
                    ),
                    Container(
                      margin: EdgeInsets.only(top:5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('\$ '+_globalFunction.removeDecimalZeroFormat(recomendedProductData[index].price), style: GlobalStyle.productPrice),
                          Text(recomendedProductData[index].sale.toString()+' Sale', style: TextStyle(fontSize: 11, color: SOFT_GREY))
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top:5),
                      child: Row(
                        children: [
                          Icon(Icons.location_on, color: SOFT_GREY, size: 12),
                          Text(' '+recomendedProductData[index].location, style: GlobalStyle.productSale)
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top:5),
                      child: Row(
                        children: [
                          _reusableWidget.createRatingBar(rating: recomendedProductData[index].rating, size: 12),
                          Text('('+recomendedProductData[index].review.toString()+')', style: GlobalStyle.productTotalReview)
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
