import 'dart:async';

import 'package:doctor_app/config/apps/food_delivery/constant.dart';
import 'package:doctor_app/config/apps/food_delivery/global_style.dart';
import 'package:doctor_app/ui/apps/food_delivery/reusable_widget.dart';
import 'package:doctor_app/model/apps/food_delivery/restaurant_model.dart';
import 'package:doctor_app/ui/reusable/shimmer_loading.dart';
import 'package:flutter/material.dart';

class RestaurantListPage extends StatefulWidget {
  final String title;

  const RestaurantListPage({Key? key, this.title = 'Food Around You'})
      : super(key: key);

  @override
  _RestaurantListPageState createState() => _RestaurantListPageState();
}

class _RestaurantListPageState extends State<RestaurantListPage> {
  // initialize shimmer loading and reusable widget
  final _shimmerLoading = ShimmerLoading();
  final _reusableWidget = ReusableWidget();

  bool _loading = true;
  Timer? _timerDummy;

  List<RestaurantModel> _restaurantData = [];

  @override
  void initState() {
    _getData();

    super.initState();
  }

  @override
  void dispose() {
    _timerDummy?.cancel();
    super.dispose();
  }

  void _getData() {
    // this timer function is just for demo, so after 1 second, the shimmer loading will disappear and show the content
    _timerDummy = Timer(Duration(seconds: 1), () {
      setState(() {
        _loading = false;
      });
    });

    /*
    Image Information
    width = 800px
    height = 600px
    ratio width height = 4:3
     */
    _restaurantData = [
      RestaurantModel(
          id: 1,
          name: "Rapid-Action Coaching",
          tag: "Chicken, Rice",
          image: "https://2micoaching.com/wp-content/uploads/2021/12/1.jpg",
          rating: 4.9,
          distance: 0.4,
          promo: '500/hr',
          location: "43-14271 60 Avenue"),
      RestaurantModel(
          id: 2,
          name: "Personal Impact Coaching",
          tag: "Beef, Yakiniku, Japanese Food",
          image: "https://2micoaching.com/wp-content/uploads/2021/12/1.jpg",
          rating: 5,
          distance: 0.6,
          promo: '500/hr',
          location: "43-14271 60 Avenue"),
      RestaurantModel(
          id: 3,
          name: "Executive Leadership Coaching",
          tag: "Healthy Food, Salad",
          image: "https://2micoaching.com/wp-content/uploads/2021/12/1.jpg",
          rating: 4.3,
          distance: 0.7,
          promo: '500/hr',
          location: "43-14271 60 Avenue"),
      RestaurantModel(
          id: 4,
          name: "Executive Leadership Team Coaching",
          tag: "Hot, Fresh, Steam",
          image: "https://2micoaching.com/wp-content/uploads/2021/12/1.jpg",
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
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: GlobalStyle.appBarIconThemeColor,
        ),
        systemOverlayStyle: GlobalStyle.appBarSystemOverlayStyle,
        centerTitle: true,
        title: Text(widget.title, style: GlobalStyle.appBarTitle),
        backgroundColor: GlobalStyle.appBarBackgroundColor,
        bottom: _reusableWidget.bottomAppBar(),
      ),
      body: RefreshIndicator(
        onRefresh: refreshData,
        child: (_loading == true)
            ? _shimmerLoading.buildShimmerContent()
            : ListView.builder(
                itemCount: _restaurantData.length,
                padding: EdgeInsets.symmetric(vertical: 0),
                physics: AlwaysScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return _reusableWidget.buildRestaurantList(
                      context, index, _restaurantData);
                },
              ),
      ),
      floatingActionButton: _reusableWidget.fabCart(context),
    );
  }

  Future refreshData() async {
    setState(() {
      _restaurantData.clear();
      _loading = true;
      _getData();
    });
  }
}
