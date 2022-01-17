import 'dart:async';

import 'package:doctor_app/config/apps/food_delivery/constant.dart';
import 'package:doctor_app/config/apps/food_delivery/global_style.dart';
import 'package:doctor_app/ui/apps/food_delivery/reusable_widget.dart';
import 'package:doctor_app/model/apps/food_delivery/food_model.dart';
import 'package:doctor_app/ui/reusable/shimmer_loading.dart';
import 'package:flutter/material.dart';

class FoodListPage extends StatefulWidget {
  final String title;

  const FoodListPage({Key? key, this.title = 'Food on Promotion'}) : super(key: key);

  @override
  _FoodListPageState createState() => _FoodListPageState();
}

class _FoodListPageState extends State<FoodListPage> {
  // initialize shimmer loading and reusable widget
  final _shimmerLoading = ShimmerLoading();
  final _reusableWidget = ReusableWidget();

  bool _loading = true;
  Timer? _timerDummy;

  List<FoodModel> _foodData = [];

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

  void _getData(){
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
    _foodData = [
      FoodModel(
          id: 8,
          restaurantName: "Chicken Specialties",
          name: "Chicken Rice Teriyaki",
          image: GLOBAL_URL+"/assets/images/apps/food_delivery/food/8.jpg",
          price: 5,
          discount: 10,
          rating: 4.7,
          distance: 3.9,
          location: "Liberty Avenue"
      ),
      FoodModel(
          id: 6,
          restaurantName: "Bread and Cookies",
          name: "Delicious Croissant",
          image: GLOBAL_URL+"/assets/images/apps/food_delivery/food/6.jpg",
          price: 5,
          discount: 0,
          rating: 4.8,
          distance: 0.9,
          location: "Mapple Street"
      ),
      FoodModel(
          id: 7,
          restaurantName: "Taco Salad Beef Classic",
          name: "Awesome Health",
          image: GLOBAL_URL+"/assets/images/apps/food_delivery/food/7.jpg",
          price: 4.9,
          discount: 10,
          rating: 4.9,
          distance: 1.1,
          location: "Fenimore Street"
      ),
      FoodModel(
          id: 5,
          restaurantName: "Italian Food",
          name: "Chicken Penne With Tomato",
          image: GLOBAL_URL+"/assets/images/apps/food_delivery/food/5.jpg",
          price: 6.5,
          discount: 20,
          rating: 4.6,
          distance: 0.9,
          location: "New York Avenue"
      ),
      FoodModel(
          id: 4,
          restaurantName: "Steam Boat Lovers",
          name: "Seafood shabu-shabu",
          image: GLOBAL_URL+"/assets/images/apps/food_delivery/food/4.jpg",
          price: 6,
          discount: 20,
          rating: 4.9,
          distance: 0.7,
          location: "Lefferts Avenue"
      ),
      FoodModel(
          id: 3,
          restaurantName: "Salad Stop",
          name: "Sesame Salad",
          image: GLOBAL_URL+"/assets/images/apps/food_delivery/food/3.jpg",
          price: 4.8,
          discount: 10,
          rating: 4.3,
          distance: 0.7,
          location: "Empire Boulevard"
      ),
      FoodModel(
          id: 2,
          restaurantName: "Beef Lovers",
          name: "Beef Yakiniku",
          image: GLOBAL_URL+"/assets/images/apps/food_delivery/food/2.jpg",
          price: 3.6,
          discount: 20,
          rating: 5,
          distance: 0.6,
          location: "Montgomery Street"
      ),
      FoodModel(
          id: 1,
          restaurantName: "Mr. Hungry",
          name: "Hainam Chicken Rice",
          image: GLOBAL_URL+"/assets/images/apps/food_delivery/food/1.jpg",
          price: 5,
          discount: 50,
          rating: 4.9,
          distance: 0.4,
          location: "Crown Street"
      ),
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
            itemCount: _foodData.length,
            padding: EdgeInsets.symmetric(vertical: 0),
            physics: AlwaysScrollableScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              return _reusableWidget.buildFoodList(context, index, _foodData);
            },
          ),
        ),
        floatingActionButton: _reusableWidget.fabCart(context),
    );
  }

  Future refreshData() async {
    setState(() {
      _foodData.clear();
      _loading = true;
      _getData();
    });
  }
}
