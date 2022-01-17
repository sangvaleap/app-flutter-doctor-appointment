import 'package:carousel_slider/carousel_slider.dart';
import 'package:doctor_app/config/constant.dart';
import 'package:doctor_app/model/feature/banner_slider_model.dart';
import 'package:doctor_app/model/feature/category_model.dart';
import 'package:doctor_app/model/screen/product_model.dart';
import 'package:doctor_app/ui/reusable/cache_image_network.dart';
import 'package:doctor_app/ui/reusable/global_function.dart';
import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Home3Page extends StatefulWidget {
  @override
  _Home3PageState createState() => _Home3PageState();
}

class _Home3PageState extends State<Home3Page> with TickerProviderStateMixin {
  final _globalWidget = GlobalWidget();
  final _globalFunction = GlobalFunction();

  Color _color1 = Color(0xff777777);
  Color _color2 = Color(0xFF515151);
  Color _color3 = Color(0xff777777);

  Color _bulletColor = Color(0xff01aed6);

  int _currentImageSlider = 0;

  List<BannerSliderModel> _bannerData = [];

  late ScrollController _scrollController;
  Color _topIconColor = Colors.white;
  Color _topSearchColor = Colors.white;
  late AnimationController _topColorAnimationController;
  late Animation _appBarColor;
  SystemUiOverlayStyle _appBarSystemOverlayStyle = SystemUiOverlayStyle.light;

  List<CategoryModel> _categoryData = [];

  List<ProductModel> _productData = [];

  List<ProductModel> _trendingData = [];

  @override
  void initState() {
    setupAnimateAppbar();

    _bannerData.add(BannerSliderModel(id: 5, image: GLOBAL_URL+'/assets/images/home_banner/5.jpg'));
    _bannerData.add(BannerSliderModel(id: 4, image: GLOBAL_URL+'/assets/images/home_banner/4.jpg'));
    _bannerData.add(BannerSliderModel(id: 1, image: GLOBAL_URL+'/assets/images/home_banner/1.jpg'));
    _bannerData.add(BannerSliderModel(id: 2, image: GLOBAL_URL+'/assets/images/home_banner/2.jpg'));
    _bannerData.add(BannerSliderModel(id: 3, image: GLOBAL_URL+'/assets/images/home_banner/3.jpg'));

    _categoryData.add(CategoryModel(id: 1, name: 'Fashion', image: GLOBAL_URL+'/assets/images/category/fashion.png'));
    _categoryData.add(CategoryModel(id: 2, name: 'Smartphone & Tablets', image: GLOBAL_URL+'/assets/images/category/smartphone.png'));
    _categoryData.add(CategoryModel(id: 3, name: 'Electronic', image: GLOBAL_URL+'/assets/images/category/electronic.png'));
    _categoryData.add(CategoryModel(id: 4, name: 'Otomotif', image: GLOBAL_URL+'/assets/images/category/otomotif.png'));
    _categoryData.add(CategoryModel(id: 5, name: 'Sport', image: GLOBAL_URL+'/assets/images/category/sport.png'));
    _categoryData.add(CategoryModel(id: 6, name: 'Food', image: GLOBAL_URL+'/assets/images/category/food.png'));
    _categoryData.add(CategoryModel(id: 7, name: 'Voucher\nGame', image: GLOBAL_URL+'/assets/images/category/voucher_game.png'));
    _categoryData.add(CategoryModel(id: 8, name: 'Health & Care', image: GLOBAL_URL+'/assets/images/category/health.png'));
    _categoryData.add(CategoryModel(id: 9, name: 'Food', image: GLOBAL_URL+'/assets/images/category/food.png'));
    _categoryData.add(CategoryModel(id: 10, name: 'Electronic', image: GLOBAL_URL+'/assets/images/category/electronic.png'));
    _categoryData.add(CategoryModel(id: 11, name: 'Fashion', image: GLOBAL_URL+'/assets/images/category/fashion.png'));
    _categoryData.add(CategoryModel(id: 12, name: 'Sport', image: GLOBAL_URL+'/assets/images/category/sport.png'));
    _categoryData.add(CategoryModel(id: 13, name: 'Voucher\nGame', image: GLOBAL_URL+'/assets/images/category/voucher_game.png'));
    _categoryData.add(CategoryModel(id: 14, name: 'Smartphone & Tablets', image: GLOBAL_URL+'/assets/images/category/smartphone.png'));
    _categoryData.add(CategoryModel(id: 15, name: 'Health & Care', image: GLOBAL_URL+'/assets/images/category/health.png'));
    _categoryData.add(CategoryModel(id: 16, name: 'Otomotif', image: GLOBAL_URL+'/assets/images/category/otomotif.png'));

    _productData = [
      ProductModel(
          id: 21,
          name: "Delta Boots Import 8 Inch",
          price: 18.3,
          image: GLOBAL_URL+"/assets/images/product/25.jpg",
          rating: 5,
          review: 212,
          sale: 735,
          location: "Brooklyn"
      ),
      ProductModel(
          id: 20,
          name: "Fimi X8 SE Black",
          price: 567,
          image: GLOBAL_URL+"/assets/images/product/26.jpg",
          rating: 5,
          review: 63,
          sale: 115,
          location: "Brooklyn"
      ),
      ProductModel(
          id: 19,
          name: "Guess Collection Watch Ceramic Type GC 6004 ",
          price: 52,
          image: GLOBAL_URL+"/assets/images/product/27.jpg",
          rating: 5,
          review: 7,
          sale: 7,
          location: "Brooklyn"
      ),
      ProductModel(
          id: 17,
          name: "NEW Original Apple TV 4K 64GB 5th Generation",
          price: 261,
          image: GLOBAL_URL+"/assets/images/product/29.jpg",
          rating: 5,
          review: 98,
          sale: 263,
          location: "Brooklyn"
      ),
      ProductModel(
          id: 16,
          name: "SAMSUNG GALAXY S20 PLUS RAM 8/128GB",
          price: 751,
          image: GLOBAL_URL+"/assets/images/product/30.jpg",
          rating: 5,
          review: 14,
          sale: 17,
          location: "Brooklyn"
      ),
      ProductModel(
          id: 15,
          name: "Xiaomi Smart LED TV Mi 4",
          price: 224.14,
          image: GLOBAL_URL+"/assets/images/product/31.jpg",
          rating: 5,
          review: 701,
          sale: 1558,
          location: "Brooklyn"
      ),
      ProductModel(
          id: 14,
          name: "Adidas EQT Adv Premium Original",
          price: 28.67,
          image: GLOBAL_URL+"/assets/images/product/32.jpg",
          rating: 5,
          review: 146,
          sale: 398,
          location: "Brooklyn"
      ),
      ProductModel(
          id: 13,
          name: "Xiaomi Air Purifier 3 Mijia OLED Touch Sterilization Air Ionizer - 3",
          price: 139,
          image: GLOBAL_URL+"/assets/images/product/33.jpg",
          rating: 5,
          review: 275,
          sale: 1055,
          location: "Brooklyn"
      )
    ];

    _trendingData = [
      ProductModel(
        id: 1,
        name: "Adidas Shirt",
        image: GLOBAL_URL+"/assets/images/product/21.jpg",
        sale: 12700,
      ),
      ProductModel(
        id: 2,
        name: "iPhone SE 2020",
        image: GLOBAL_URL+"/assets/images/product/22.jpg",
        sale: 8300,
      ),
      ProductModel(
        id: 3,
        name: "Macbook Air 2020",
        image: GLOBAL_URL+"/assets/images/product/23.jpg",
        sale: 31400,
      ),
      ProductModel(
        id: 4,
        name: "Gaming Chair",
        image: GLOBAL_URL+"/assets/images/product/24.jpg",
        sale: 11900,
      )
    ];

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
                          SizedBox(height: 16),
                          _createCategoryMenu(),
                          SizedBox(height: 16),
                          _createLastSearch(),
                          SizedBox(height: 16),
                          _createTrending(),
                          SizedBox(height: 16),
                          _createAllProduct(),
                        ]
                    )
                )
              ],
            ),
            _createAppBar()
          ],
        )
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
                        borderRadius: BorderRadius.circular(3.0),
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

  Widget _createCategoryMenu(){
    return Container(
      height: 180,
      child: GridView.count(
        padding: EdgeInsets.symmetric(horizontal: 16),
        childAspectRatio: 1.04,
        shrinkWrap: true,
        crossAxisSpacing: 0,
        mainAxisSpacing: 0,
        crossAxisCount: 2,
        scrollDirection: Axis.horizontal,
        children: List.generate(_categoryData.length, (index) {
          return GestureDetector(
              onTap: () {
                Fluttertoast.showToast(msg: 'Click '+_categoryData[index].name, toastLength: Toast.LENGTH_SHORT);
              },
              child: Column(
                  children: [
                    ClipOval(
                        child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                  width: 1,
                                  color: Colors.grey[300]!
                              ),
                              borderRadius: BorderRadius.all(
                                  Radius.circular(30.0)
                              ),
                            ),
                            padding: EdgeInsets.all(10),
                            child: buildCacheNetworkImage(width: 20, height: 20, url: _categoryData[index].image, plColor: Colors.transparent)
                        )
                    ),
                    Flexible(
                      child: Container(
                        margin: EdgeInsets.only(top: 8),
                        child: Text(
                          _categoryData[index].name,
                          style: TextStyle(
                            color: _color2,
                            fontWeight: FontWeight.normal,
                            fontSize: 11,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    )
                  ]));
        }),
      ),
    );
  }

  Widget _createLastSearch(){
    final double boxImageSize = (MediaQuery.of(context).size.width / 3);
    return Column(
      children: [
        Container(
          padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Last Search', style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold
              )),
              GestureDetector(
                onTap: (){
                  Fluttertoast.showToast(msg: 'Click last search', toastLength: Toast.LENGTH_SHORT);
                },
                child: Text('view all', style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: PRIMARY_COLOR
                ), textAlign: TextAlign.end),
              )
            ],
          ),
        ),
        Container(
            margin: EdgeInsets.only(top: 16),
            height: boxImageSize*1.90,
            child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 12),
              scrollDirection: Axis.horizontal,
              itemCount: _productData.length,
              itemBuilder: (BuildContext context, int index) {
                return _buildLastSearchCard(index, boxImageSize);
              },
            )
        ),
      ],
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
            Fluttertoast.showToast(msg: 'Click '+_productData[index].name, toastLength: Toast.LENGTH_SHORT);
          },
          child: Column(
            children: <Widget>[
              ClipRRect(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                  child: buildCacheNetworkImage(width: boxImageSize+10, height: boxImageSize+10, url: _productData[index].image)
              ),
              Container(
                margin: EdgeInsets.fromLTRB(8, 8, 8, 8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _productData[index].name,
                      style: TextStyle(
                          fontSize: 12,
                          color: _color1
                      ), maxLines: 2, overflow: TextOverflow.ellipsis,
                    ),
                    Container(
                      margin: EdgeInsets.only(top:5),
                      child: Text('\$ '+_globalFunction.removeDecimalZeroFormat(_productData[index].price!), style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold
                      )),
                    ),
                    Container(
                      margin: EdgeInsets.only(top:5),
                      child: Row(
                        children: [
                          _globalWidget.createRatingBar(rating: _productData[index].rating!, size: 12),
                          Text('('+_productData[index].review.toString()+')', style: TextStyle(
                              fontSize: 11,
                              color: SOFT_GREY
                          ))
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

  Widget _createTrending(){
    return Column(
      children: [
        Container(
          padding: EdgeInsets.fromLTRB(16, 16, 16, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Trending', style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold
              )),
              GestureDetector(
                onTap: (){
                  Fluttertoast.showToast(msg: 'Click trending', toastLength: Toast.LENGTH_SHORT);
                },
                child: Text('view all', style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: PRIMARY_COLOR
                ), textAlign: TextAlign.end),
              )
            ],
          ),
        ),
        GridView.count(
          padding: EdgeInsets.all(12),
          primary: false,
          childAspectRatio: 4/1.6,
          shrinkWrap: true,
          crossAxisSpacing: 2,
          mainAxisSpacing: 2,
          crossAxisCount: 2,
          children: List.generate(4, (index) {
            return _buildTrendingProductCard(index);
          }),
        ),
      ],
    );
  }

  Widget _buildTrendingProductCard(index){
    return GestureDetector(
      onTap: () {
        Fluttertoast.showToast(msg: 'Click '+_trendingData[index].name, toastLength: Toast.LENGTH_SHORT);
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
                  child: buildCacheNetworkImage(width: (MediaQuery.of(context).size.width/2)*(1.6/4)-12-1, height: (MediaQuery.of(context).size.width/2)*(1.6/4)-12-1, url: _trendingData[index].image)
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(_trendingData[index].name, style: TextStyle(
                          fontSize: 11, fontWeight: FontWeight.bold
                      )),
                      SizedBox(height: 4),
                      Text(_trendingData[index].sale.toString()+' product', style: TextStyle(
                          fontSize: 9, color: _color3
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

  Widget _createAllProduct(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
          child: Text('All Product', style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold
          )),
        ),
        CustomScrollView(
            primary: false,
            shrinkWrap: true,
            slivers: <Widget>[
              SliverPadding(
                padding: EdgeInsets.fromLTRB(12, 8, 12, 8),
                sliver: SliverGrid(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 8,
                    childAspectRatio: 0.625,
                  ),
                  delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                      return _buildItem(index);
                    },
                    childCount: _productData.length,
                  ),
                ),
              ),
            ]
        )
      ],
    );
  }

  Widget _buildItem(index) {
    final double boxImageSize = ((MediaQuery.of(context).size.width) - 24) / 2 - 12;
    return Container(
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 2,
        color: Colors.white,
        child: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () {
            Fluttertoast.showToast(msg: 'Click '+_productData[index].name, toastLength: Toast.LENGTH_SHORT);
          },
          child: Column(
            children: <Widget>[
              ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10)),
                  child: buildCacheNetworkImage(width: boxImageSize, height: boxImageSize, url: _productData[index].image)),
              Container(
                margin: EdgeInsets.fromLTRB(8, 8, 8, 8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _productData[index].name,
                      style: TextStyle(
                          fontSize: 12,
                          color: _color1
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('\$ ' + _globalFunction.removeDecimalZeroFormat(_productData[index].price!), style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.bold
                          )),
                          Text(_productData[index].sale.toString() + ' '+'Sale', style: TextStyle(
                              fontSize: 11,
                              color: SOFT_GREY
                          ))
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 5),
                      child: Row(
                        children: [
                          Icon(Icons.location_on, color: SOFT_GREY, size: 12),
                          Text(' ' + _productData[index].location!,
                              style: TextStyle(
                                  fontSize: 11,
                                  color: SOFT_GREY
                              ))
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 5),
                      child: Row(
                        children: [
                          _globalWidget.createRatingBar(rating: _productData[index].rating!, size: 12),
                          Text('(' + _productData[index].review.toString() + ')', style: TextStyle(
                              fontSize: 11,
                              color: SOFT_GREY
                          )
                          )
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
