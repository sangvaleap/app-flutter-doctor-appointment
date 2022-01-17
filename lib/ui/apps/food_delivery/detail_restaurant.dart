import 'package:doctor_app/config/apps/food_delivery/constant.dart';
import 'package:doctor_app/config/apps/food_delivery/global_style.dart';
import 'package:doctor_app/ui/apps/food_delivery/cart.dart';
import 'package:doctor_app/ui/apps/food_delivery/coupon.dart';
import 'package:doctor_app/model/apps/food_delivery/food_model.dart';
import 'package:doctor_app/ui/apps/food_delivery/restaurant_information.dart';
import 'package:doctor_app/ui/apps/food_delivery/reusable_widget.dart';
import 'package:doctor_app/ui/reusable/cache_image_network.dart';
import 'package:flutter/material.dart';

class DetailRestaurantPage extends StatefulWidget {
  @override
  _DetailRestaurantPageState createState() => _DetailRestaurantPageState();
}

class _DetailRestaurantPageState extends State<DetailRestaurantPage> {
  // initialize reusable widget
  final _reusableWidget = ReusableWidget();

  bool _showAppBar = false;

  late ScrollController _scrollController;

  List<FoodModel> _foodData = [];

  @override
  void initState() {
    setupAnimateAppbar();
    _getData();

    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void setupAnimateAppbar() {
    _scrollController = ScrollController()
      ..addListener(() {
        if (_scrollController.hasClients &&
            _scrollController.offset >
                (MediaQuery.of(context).size.width * 3 / 4) - 80) {
          setState(() {
            _showAppBar = true;
          });
        } else {
          setState(() {
            _showAppBar = false;
          });
        }
      });
  }

  void _getData() {
    /*
    Image Information
    width = 800px
    height = 600px
    ratio width height = 4:3
     */
    _foodData = [
      FoodModel(
          id: 8,
          restaurantName: "Chicken Specialties",
          name: "Chicken Rice Teriyaki",
          image: GLOBAL_URL + "/assets/images/apps/food_delivery/food/8.jpg",
          price: 5,
          discount: 10,
          rating: 4.7,
          distance: 3.9,
          location: "Liberty Avenue"),
      FoodModel(
          id: 6,
          restaurantName: "Bread and Cookies",
          name: "Delicious Croissant",
          image: GLOBAL_URL + "/assets/images/apps/food_delivery/food/6.jpg",
          price: 5,
          discount: 0,
          rating: 4.8,
          distance: 0.9,
          location: "Mapple Street"),
      FoodModel(
          id: 7,
          restaurantName: "Taco Salad Beef Classic",
          name: "Awesome Health",
          image: GLOBAL_URL + "/assets/images/apps/food_delivery/food/7.jpg",
          price: 4.9,
          discount: 10,
          rating: 4.9,
          distance: 1.1,
          location: "Fenimore Street"),
      FoodModel(
          id: 5,
          restaurantName: "Italian Food",
          name: "Chicken Penne With Tomato",
          image: GLOBAL_URL + "/assets/images/apps/food_delivery/food/5.jpg",
          price: 6.5,
          discount: 20,
          rating: 4.6,
          distance: 0.9,
          location: "New York Avenue"),
      FoodModel(
          id: 4,
          restaurantName: "Steam Boat Lovers",
          name: "Seafood shabu-shabu",
          image: GLOBAL_URL + "/assets/images/apps/food_delivery/food/4.jpg",
          price: 6,
          discount: 20,
          rating: 4.9,
          distance: 0.7,
          location: "Lefferts Avenue"),
      FoodModel(
          id: 3,
          restaurantName: "Salad Stop",
          name: "Sesame Salad",
          image: GLOBAL_URL + "/assets/images/apps/food_delivery/food/3.jpg",
          price: 4.8,
          discount: 10,
          rating: 4.3,
          distance: 0.7,
          location: "Empire Boulevard"),
      FoodModel(
          id: 2,
          restaurantName: "Beef Lovers",
          name: "Beef Yakiniku",
          image: GLOBAL_URL + "/assets/images/apps/food_delivery/food/2.jpg",
          price: 3.6,
          discount: 20,
          rating: 5,
          distance: 0.6,
          location: "Montgomery Street"),
      FoodModel(
          id: 1,
          restaurantName: "Mr. Hungry",
          name: "Hainam Chicken Rice",
          image: GLOBAL_URL + "/assets/images/apps/food_delivery/food/1.jpg",
          price: 5,
          discount: 50,
          rating: 4.9,
          distance: 0.4,
          location: "Crown Street"),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final double bannerWidth = MediaQuery.of(context).size.width;
    final double bannerHeight = MediaQuery.of(context).size.width * 3 / 4;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(bottom: kToolbarHeight + 22),
            child: ListView(
              controller: _scrollController,
              physics: AlwaysScrollableScrollPhysics(),
              padding: EdgeInsets.all(0),
              children: [
                buildCacheNetworkImage(
                    width: bannerWidth,
                    height: bannerHeight,
                    url:
                        "https://2micoaching.com/wp-content/uploads/2021/12/1.jpg"),
                _buildMerchantTop(),
                _reusableWidget.divider1(),
                _buildNewMenu(),
                _reusableWidget.divider1(),
                _buildChickenMenu(),
                _reusableWidget.divider1(),
                _buildBeefMenu(),
              ],
            ),
          ),
          Opacity(
            opacity: _showAppBar ? 1 : 0,
            child: Container(
              height: 80,
              child: AppBar(
                iconTheme: IconThemeData(
                  color: GlobalStyle.appBarIconThemeColor,
                ),
                systemOverlayStyle: GlobalStyle.appBarSystemOverlayStyle,
                centerTitle: true,
                title: Text('Steam Boat Lovers - Lefferts Avenue',
                    style: GlobalStyle.appBarTitle),
                backgroundColor: GlobalStyle.appBarBackgroundColor,
              ),
            ),
          ),
          _buildViewCartButton(),
        ],
      ),
    );
  }

  Widget _buildMerchantTop() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Preferred Merchants', style: GlobalStyle.preferredMerchant),
              GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RestaurantInformationPage()));
                  },
                  child: Icon(Icons.info_outline, size: 20, color: BLACK77)),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 16),
          child: Text('Steam Boat Lovers - Lefferts Avenue',
              style: GlobalStyle.restaurantTitle,
              maxLines: 2,
              overflow: TextOverflow.ellipsis),
        ),
        SizedBox(height: 4),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 16),
          child: Text('Hot, Fresh, Steam', style: GlobalStyle.restaurantTag),
        ),
        SizedBox(height: 8),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              Icon(Icons.star, color: Colors.orange, size: 15),
              SizedBox(width: 2),
              Text('4.9', style: GlobalStyle.textRatingDistances),
              SizedBox(width: 6),
              Icon(Icons.location_pin, color: ASSENT_COLOR, size: 15),
              SizedBox(width: 2),
              Text('0.7 miles', style: GlobalStyle.textRatingDistances),
            ],
          ),
        ),
        _reusableWidget.divider2(),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 16),
          child: GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => CouponPage()));
            },
            child: Row(
              children: [
                Icon(Icons.local_offer_outlined, color: ASSENT_COLOR, size: 16),
                SizedBox(width: 4),
                Text('Check for available coupons'),
                Spacer(),
                Text('See Coupons', style: GlobalStyle.couponAction),
              ],
            ),
          ),
        ),
        SizedBox(height: 16)
      ],
    );
  }

  Widget _buildNewMenu() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.fromLTRB(16, 16, 16, 0),
          child: Text('New Menu', style: GlobalStyle.menuTitle),
        ),
        ListView.builder(
          primary: false,
          shrinkWrap: true,
          itemCount: _foodData.length,
          padding: EdgeInsets.symmetric(vertical: 0),
          itemBuilder: (BuildContext context, int index) {
            return _reusableWidget.buildFoodDetailList(
                context, index, _foodData);
          },
        )
      ],
    );
  }

  Widget _buildChickenMenu() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.fromLTRB(16, 16, 16, 0),
          child: Text('Chicken Menu', style: GlobalStyle.menuTitle),
        ),
        ListView.builder(
          primary: false,
          shrinkWrap: true,
          itemCount: _foodData.length,
          padding: EdgeInsets.symmetric(vertical: 0),
          itemBuilder: (BuildContext context, int index) {
            return _reusableWidget.buildFoodDetailList(
                context, index, _foodData);
          },
        )
      ],
    );
  }

  Widget _buildBeefMenu() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.fromLTRB(16, 16, 16, 0),
          child: Text('Beef Menu', style: GlobalStyle.menuTitle),
        ),
        ListView.builder(
          primary: false,
          shrinkWrap: true,
          itemCount: _foodData.length,
          padding: EdgeInsets.symmetric(vertical: 0),
          itemBuilder: (BuildContext context, int index) {
            return _reusableWidget.buildFoodDetailList(
                context, index, _foodData);
          },
        )
      ],
    );
  }

  Widget _buildViewCartButton() {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: Border(
              top: BorderSide(
            color: Colors.grey[100]!,
          )),
        ),
        child: GestureDetector(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => CartPage()));
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            height: kToolbarHeight - 10,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(6)),
              color: ASSENT_COLOR,
            ),
            child: Row(
              children: [
                Text('View Cart',
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.bold)),
                SizedBox(width: 16),
                Text('3 Items',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    )),
                Spacer(),
                Text('\$14',
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
