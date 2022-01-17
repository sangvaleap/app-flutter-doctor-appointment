import 'package:backdrop/backdrop.dart';
import 'package:badges/badges.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:doctor_app/config/apps/food_delivery/constant.dart';
import 'package:doctor_app/config/apps/food_delivery/global_style.dart';
import 'package:doctor_app/data/json.dart';
import 'package:doctor_app/model/apps/food_delivery/restaurant_model.dart';
import 'package:doctor_app/model/feature/banner_slider_model.dart';
import 'package:doctor_app/model/screen/product_model.dart';
import 'package:doctor_app/theme/colors.dart';
import 'package:doctor_app/ui/apps/food_delivery/restaurant_list.dart';
import 'package:doctor_app/ui/apps/food_delivery/reusable_widget.dart';
import 'package:doctor_app/ui/reusable/cache_image_network.dart';
import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:doctor_app/widgets/category_box.dart';
import 'package:doctor_app/widgets/popular_doctor.dart';
import 'package:doctor_app/widgets/textbox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:nb_utils/nb_utils.dart';

List<ProductModel> _trendingData = [
  ProductModel(
    id: 1,
    name: "Adidas Shirt",
    image: GLOBAL_URL + "/assets/images/product/21.jpg",
    sale: 12700,
  ),
  ProductModel(
    id: 2,
    name: "iPhone SE 2020",
    image: GLOBAL_URL + "/assets/images/product/22.jpg",
    sale: 8300,
  ),
  ProductModel(
    id: 3,
    name: "Macbook Air 2020",
    image: GLOBAL_URL + "/assets/images/product/23.jpg",
    sale: 31400,
  ),
  ProductModel(
    id: 4,
    name: "Gaming Chair",
    image: GLOBAL_URL + "/assets/images/product/24.jpg",
    sale: 11900,
  )
];

List<RestaurantModel> _nearbyFoodData = [
  RestaurantModel(
      id: 1,
      name: "Rapid-Action Coaching",
      tag: "Chicken, Rice",
      image: "assets/images/onboarding/1.jpeg",
      rating: 4.9,
      distance: 0.4,
      promo: '500/hr',
      location: "43-14271 60 Avenue"),
  RestaurantModel(
      id: 2,
      name: "Personal Impact Coaching",
      tag: "Beef, Yakiniku, Japanese Food",
      image: "assets/images/onboarding/2.jpeg",
      rating: 5,
      distance: 0.6,
      promo: '500/hr',
      location: "43-14271 60 Avenue"),
  RestaurantModel(
      id: 3,
      name: "Executive Leadership Coaching",
      tag: "Healthy Food, Salad",
      image: "assets/images/onboarding/3.jpeg",
      rating: 4.3,
      distance: 0.7,
      promo: '500/hr',
      location: "43-14271 60 Avenue"),
  RestaurantModel(
      id: 4,
      name: "Executive Leadership Team Coaching",
      tag: "Hot, Fresh, Steam",
      image: "assets/images/onboarding/4.jpeg",
      rating: 4.9,
      distance: 0.7,
      promo: '500/hr',
      location: "Online"),
  RestaurantModel(
      id: 5,
      name: "Transition Coaching",
      tag: "Penne, Western Food",
      image: "https://2micoaching.com/wp-content/uploads/2021/12/1.jpg",
      rating: 4.6,
      distance: 0.9,
      promo: '500/hr',
      location: "Online"),
  // RestaurantModel(
  //     id: 6,
  //     name: "Transition Coaching",
  //     tag: "Bread",
  //     image: GLOBAL_URL + "/assets/images/apps/food_delivery/food/6.jpg",
  //     rating: 4.8,
  //     distance: 0.9,
  //     promo: '',
  //     location: "Mapple Street"),
  // RestaurantModel(
  //     id: 7,
  //     name: "Awesome Health",
  //     tag: "Salad, Healthy Food, Fresh",
  //     image: GLOBAL_URL + "/assets/images/apps/food_delivery/food/7.jpg",
  //     rating: 4.9,
  //     distance: 1.1,
  //     promo: '10% Off',
  //     location: "Fenimore Street"),
  // RestaurantModel(
  //     id: 8,
  //     name: "Chicken Specialties",
  //     tag: "Chicken, Rice, Teriyaki",
  //     image: GLOBAL_URL + "/assets/images/apps/food_delivery/food/8.jpg",
  //     rating: 4.7,
  //     distance: 3.9,
  //     promo: '10% Off',
  //     location: "Liberty Avenue"),
];
final _globalWidget = GlobalWidget();

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _reusableWidget = ReusableWidget();
  List<BannerSliderModel> bannerData = [];
  Color _bulletColor = Color(0xff01aed6);
  Color bgcolor = Color(0xfff2b036);
  Color _color3 = Color(0xff777777);
  Color _color1 = Color(0xff777777);
  Color _color2 = Color(0xFF515151);

  int _currentImageSlider = 0;

  int _currentIndex = 0;
  final List<Widget> _pages = [_Widget1(), _Widget2(), _Widget3()];
  @override
  void initState() {
    bannerData.add(BannerSliderModel(
        id: 1,
        image:
            'https://2micoaching.com/wp-content/uploads/2021/12/Untitled-1.jpg'));
    bannerData.add(BannerSliderModel(
        id: 2,
        image:
            'https://2micoaching.com/wp-content/uploads/2021/09/pexels-rfstudio-3810762-1024x731.jpg'));
    bannerData.add(BannerSliderModel(
        id: 3,
        image:
            'https://2micoaching.com/wp-content/uploads/2021/09/3810792.jpg'));
    // bannerData.add(BannerSliderModel(
    //     id: 3, image: GLOBAL_URL + '/assets/images/home_banner/4.jpg'));
    // bannerData.add(BannerSliderModel(
    //     id: 3, image: GLOBAL_URL + '/assets/images/home_banner/5.jpg'));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBgColor,
      // appBar:
      //_globalWidget.globalAppBar(),
      // backLayer: BackdropNavigationBackLayer(
      //   items: [
      //     ListTile(
      //         title: Text(
      //       "At 2Mi, we have a stable of diverse, certified, and experienced coaches.",
      //       textAlign: TextAlign.justify,
      //       style: TextStyle(
      //           fontSize: 27, color: black, fontWeight: FontWeight.w500),
      //     )),
      //     // ListTile(
      //     //     title: Text("Coaches", style: TextStyle(color: Colors.white))),
      //     // ListTile(
      //     //     title:
      //     //         Text("Appointments", style: TextStyle(color: Colors.white))),
      //   ],
      //   onTap: (int position) => {setState(() => _currentIndex = position)},
      // ),

      // appBar: AppBar(
      //   elevation: 0,
      //   backgroundColor: Colors.transparent,
      //   actions: [
      //     Container(
      //       padding: EdgeInsets.only(right: 10),
      //       child: Badge(
      //         position: BadgePosition.topEnd(top: 7, end: -4),
      //         badgeContent: Text(
      //           '1',
      //           style: TextStyle(color: Colors.white),
      //         ),
      //         child: Icon(
      //           Icons.notifications_sharp,
      //           color: primary,
      //         ),
      //       ),
      //     )
      //   ],
      // ),
      body: getBody(),
    );
  }

  Widget _createTrending() {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.fromLTRB(16, 16, 16, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Services',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              RestaurantListPage(title: 'Services')));
                },
                child: Text('view all',
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: PRIMARY_COLOR),
                    textAlign: TextAlign.end),
              )
            ],
          ),
        ),
        GridView.count(
          padding: EdgeInsets.all(12),
          primary: false,
          childAspectRatio: 4 / 1.6,
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

  Widget _buildTrendingProductCard(index) {
    return GestureDetector(
      onTap: () {
        Fluttertoast.showToast(
            msg: 'Click ' + _nearbyFoodData[index].name,
            toastLength: Toast.LENGTH_SHORT);
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
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomLeft: Radius.circular(10)),
                  child: new Image.asset(
                    _nearbyFoodData[index].image!,
                    width: (MediaQuery.of(context).size.width / 2) * (1.6 / 4) -
                        12 -
                        1,
                    height:
                        (MediaQuery.of(context).size.width / 2) * (1.6 / 4) -
                            12 -
                            1,
                  )
                  // buildCacheNetworkImage(
                  //     width:
                  //         (MediaQuery.of(context).size.width / 2) * (1.6 / 4) -
                  //             12 -
                  //             1,
                  //     height:
                  //         (MediaQuery.of(context).size.width / 2) * (1.6 / 4) -
                  //             12 -
                  //             1,
                  //     url: _nearbyFoodData[index].image)
                  ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(_nearbyFoodData[index].name,
                          style: TextStyle(
                              fontSize: 11, fontWeight: FontWeight.bold)),
                      SizedBox(height: 4),
                      Text(_nearbyFoodData[index].promo.toString() + ' product',
                          style: TextStyle(fontSize: 9, color: _color3))
                    ],
                  ),
                ),
              )
            ],
          )),
    );
  }

  Widget _buildNearbyFood(boxImageSize) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.fromLTRB(16, 16, 16, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Services', style: GlobalStyle.horizontalTitle),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              RestaurantListPage(title: 'Services')));
                },
                child: Text('View All',
                    style: GlobalStyle.viewAll, textAlign: TextAlign.end),
              )
            ],
          ),
        ),

        // Container(
        //     margin: EdgeInsets.only(top: 8),
        //     height: boxImageSize * GlobalStyle.cardHeightMultiplication,
        //     child: GridView.builder(
        //       padding: EdgeInsets.all(8),
        //       itemCount: 4,
        //       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        //         crossAxisCount: 3,
        //         crossAxisSpacing: 8.0,
        //         mainAxisSpacing: 8.0,
        //       ),
        //       itemBuilder: (BuildContext context, int index) {
        //         return _reusableWidget.buildHorizontalListCard(
        //             context, _nearbyFoodData[index]);
        //       },
        //     )),
        Container(
            margin: EdgeInsets.only(top: 8),
            height: boxImageSize * GlobalStyle.cardHeightMultiplication,
            child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 12),
              scrollDirection: Axis.horizontal,
              itemCount: _nearbyFoodData.length,
              itemBuilder: (BuildContext context, int index) {
                return _reusableWidget.buildHorizontalListCard(
                    context, _nearbyFoodData[index]);
              },
            )),
      ],
    );
  }

  Widget _createAllProduct() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Services',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              RestaurantListPage(title: 'Services')));
                },
                child: Text('view all',
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: PRIMARY_COLOR),
                    textAlign: TextAlign.end),
              )
            ],
          ),
        ),
        CustomScrollView(primary: false, shrinkWrap: true, slivers: <Widget>[
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
                childCount: 4,
              ),
            ),
          ),
        ])
      ],
    );
  }

  Widget _buildItem(index) {
    final double boxImageSize =
        ((MediaQuery.of(context).size.width) - 24) / 2 - 12;
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
            Fluttertoast.showToast(
                msg: 'Click ' + _nearbyFoodData[index].name,
                toastLength: Toast.LENGTH_SHORT);
          },
          child: Column(
            children: <Widget>[
              ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10)),
                  child: new Image.asset(
                    _nearbyFoodData[index].image!,
                    width: boxImageSize,
                    height: boxImageSize,
                  )
                  // buildCacheNetworkImage(
                  //     width: boxImageSize,
                  //     height: boxImageSize,
                  //     url: _nearbyFoodData[index].image)
                  ),
              Container(
                margin: EdgeInsets.fromLTRB(8, 8, 8, 8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _nearbyFoodData[index].name,
                      style: TextStyle(fontSize: 12, color: _color1),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('\$ ' + _nearbyFoodData[index].promo!,
                              style: TextStyle(
                                  fontSize: 13, fontWeight: FontWeight.bold)),
                          Text(
                              _nearbyFoodData[index].promo.toString() +
                                  ' ' +
                                  'Sale',
                              style: TextStyle(fontSize: 11, color: SOFT_GREY))
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 5),
                      child: Row(
                        children: [
                          Icon(Icons.location_on, color: SOFT_GREY, size: 12),
                          Text(' ' + _nearbyFoodData[index].location!,
                              style: TextStyle(fontSize: 11, color: SOFT_GREY))
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 5),
                      child: Row(
                        children: [
                          _globalWidget.createRatingBar(
                              rating: _nearbyFoodData[index].rating!, size: 12),
                          Text('(' + _nearbyFoodData[index].location + ')',
                              style: TextStyle(fontSize: 11, color: SOFT_GREY))
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

  getBody() {
    final double boxImageSize = (MediaQuery.of(context).size.width / 3);
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          // SizedBox(
          //   height: 5,
          // ),
          // Container(
          //   child: Text(
          //     "Hi, Victor",
          //     style: TextStyle(
          //         fontSize: 27, color: primary, fontWeight: FontWeight.w500),
          //   ),
          // ),
          SizedBox(
            height: 5,
          ),
          Container(
              child: Text(
            "Raising Conscious Leaders",
            style: TextStyle(fontSize: 35, fontWeight: FontWeight.w600),
            textAlign: TextAlign.center,
          )),
          // SizedBox(
          //   height: 5,
          // ),
          // Column(
          //   children: [
          //     CarouselSlider(
          //       items: bannerData
          //           .map((item) => Container(
          //                 child: ClipRRect(
          //                   borderRadius: BorderRadius.all(Radius.circular(12)),
          //                   child: buildCacheNetworkImage(
          //                       width: 1000, url: item.image),
          //                 ),
          //               ))
          //           .toList(),
          //       options: CarouselOptions(
          //           autoPlay: true,
          //           autoPlayInterval: Duration(seconds: 6),
          //           autoPlayAnimationDuration: Duration(milliseconds: 300),
          //           enlargeCenterPage: true,
          //           onPageChanged: (index, reason) {
          //             setState(() {
          //               _currentImageSlider = index;
          //             });
          //           }),
          //     ),
          //     Row(
          //       mainAxisAlignment: MainAxisAlignment.center,
          //       children: bannerData.map((item) {
          //         int index = bannerData.indexOf(item);
          //         return AnimatedContainer(
          //           duration: Duration(milliseconds: 150),
          //           width: _currentImageSlider == index ? 16.0 : 8.0,
          //           height: 8.0,
          //           margin:
          //               EdgeInsets.symmetric(vertical: 10.0, horizontal: 4.0),
          //           decoration: BoxDecoration(
          //             borderRadius: BorderRadius.circular(10),
          //             color: _currentImageSlider == index
          //                 ? _bulletColor
          //                 : Colors.grey[300],
          //           ),
          //         );
          //       }).toList(),
          //     ),
          //   ],
          // ),
          // getSlide(context),
          // Container(
          //   width: double.infinity,
          //   padding: EdgeInsets.all(20),
          //   height: 160,
          //   decoration: BoxDecoration(
          //       borderRadius: BorderRadius.circular(30),
          //       image: DecorationImage(
          //         image: NetworkImage(
          //             "https://2micoaching.com/wp-content/uploads/2021/11/executive-coaching-and-leadership-coaching.jpg"),
          //         fit: BoxFit.cover,
          //       )),
          // ),
          SizedBox(
            height: 15,
          ),
          // _buildNearbyFood(boxImageSize),
          // _createTrending(),
          // SizedBox(
          //   height: 25,
          // ),
          // Container(
          //     child: Text(
          //   "Services",
          //   style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          // )),

          CustomTextBox(), SizedBox(height: 10),
          _createAllProduct(),
          // SingleChildScrollView(
          //   padding: EdgeInsets.only(bottom: 5),
          //   scrollDirection: Axis.horizontal,
          //   child: Row(
          //     children: [
          //       CategoryBox(
          //         title: "Heart",
          //         icon: Icons.favorite,
          //         color: Colors.red,
          //       ),
          //       CategoryBox(
          //         title: "Medical",
          //         icon: Icons.local_hospital,
          //         color: Colors.blue,
          //       ),
          //       CategoryBox(
          //         title: "Dental",
          //         icon: Icons.details_rounded,
          //         color: Colors.purple,
          //       ),
          //       CategoryBox(
          //         title: "Healing",
          //         icon: Icons.healing_outlined,
          //         color: Colors.green,
          //       ),
          //     ],
          //   ),
          // ),
          SizedBox(
            height: 20,
          ),
          // Container(
          //     child: Text(
          //   "Popular Doctors",
          //   style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          // )),
          // SizedBox(height: 10),
          // SingleChildScrollView(
          //   padding: EdgeInsets.only(bottom: 5),
          //   scrollDirection: Axis.horizontal,
          //   child: Row(
          //     children: [
          //       PopularDoctor(
          //         doctor: doctors[0],
          //       ),
          //       PopularDoctor(
          //         doctor: doctors[1],
          //       ),
          //       PopularDoctor(
          //         doctor: doctors[2],
          //       ),
          //     ],
          //   ),
          // ),
          // SizedBox(
          //   height: 20,
          // ),
        ]),
      ),
    );
  }
}

class _Widget1 extends StatelessWidget {
  _Widget1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(child: Text("Widget 1")),
        SizedBox(height: 12),
        Center(
          child: _globalWidget.createButton(
              backgroundColor: Colors.blue,
              textColor: Colors.white,
              buttonName: 'Back',
              onPressed: () {
                Navigator.pop(context);
              }),
        )
      ],
    );
  }
}

class _Widget2 extends StatelessWidget {
  _Widget2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(child: Text("Widget 2")),
        SizedBox(height: 12),
        Center(
          child: _globalWidget.createButton(
              backgroundColor: Colors.blue,
              textColor: Colors.white,
              buttonName: 'Back',
              onPressed: () {
                Navigator.pop(context);
              }),
        )
      ],
    );
  }
}

class _Widget3 extends StatelessWidget {
  _Widget3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(child: Text("Widget 3")),
        SizedBox(height: 12),
        Center(
          child: _globalWidget.createButton(
              backgroundColor: Colors.blue,
              textColor: Colors.white,
              buttonName: 'Back',
              onPressed: () {
                Navigator.pop(context);
              }),
        )
      ],
    );
  }
}
