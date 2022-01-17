import 'dart:async';

import 'package:doctor_app/config/apps/food_delivery/constant.dart';
import 'package:doctor_app/config/apps/food_delivery/global_style.dart';
import 'package:doctor_app/model/apps/food_delivery/restaurant_model.dart';
import 'package:doctor_app/model/apps/food_delivery/search_restaurant_model.dart';
import 'package:doctor_app/ui/apps/food_delivery/reusable_widget.dart';
import 'package:doctor_app/ui/reusable/shimmer_loading.dart';
import 'package:flutter/material.dart';

class SearchRestaurantPage extends StatefulWidget {
  @override
  _SearchRestaurantPageState createState() => _SearchRestaurantPageState();
}

class _SearchRestaurantPageState extends State<SearchRestaurantPage> {
  // initialize shimmer loading and reusable widget
  final _shimmerLoading = ShimmerLoading();
  final _reusableWidget = ReusableWidget();

  bool _loading = true;
  Timer? _timerDummy;

  List<SearchRestaurantModel> _searchData = [];
  List<RestaurantModel> _restaurantData = [];

  TextEditingController _etSearch = TextEditingController();
  bool _loadData = false;

  @override
  void initState() {
    _getData();
    super.initState();
  }

  @override
  void dispose() {
    _timerDummy?.cancel();
    _etSearch.dispose();
    super.dispose();
  }

  void _getData(){
    _searchData = [
      SearchRestaurantModel(
          id: 1,
          words: 'chicken'
      ),
      SearchRestaurantModel(
          id: 2,
          words: 'fried rice'
      ),
      SearchRestaurantModel(
          id: 3,
          words: 'steam'
      ),
      SearchRestaurantModel(
          id: 4,
          words: 'salad'
      ),
      SearchRestaurantModel(
          id: 5,
          words: 'beef'
      ),
    ];
  }

  void _getRestaurantData(){
    setState(() {
      _loading = true;
      _loadData = true;
    });

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
          name: "Mr. Hungry",
          tag: "Chicken, Rice",
          image: GLOBAL_URL+"/assets/images/apps/food_delivery/food/1.jpg",
          rating: 4.9,
          distance: 0.4,
          promo: '50% Off | Get Gift Voucher If You Buy 4 pcs',
          location: "Crown Street"
      ),
      RestaurantModel(
          id: 2,
          name: "Beef Lovers",
          tag: "Beef, Yakiniku, Japanese Food",
          image: GLOBAL_URL+"/assets/images/apps/food_delivery/food/2.jpg",
          rating: 5,
          distance: 0.6,
          promo: 'Buy 1 Get 1',
          location: "Montgomery Street"
      ),
      RestaurantModel(
          id: 3,
          name: "Salad Stop",
          tag: "Healthy Food, Salad",
          image: GLOBAL_URL+"/assets/images/apps/food_delivery/food/3.jpg",
          rating: 4.3,
          distance: 0.7,
          promo: '',
          location: "Empire Boulevard"
      ),
      RestaurantModel(
          id: 4,
          name: "Steam Boat Lovers",
          tag: "Hot, Fresh, Steam",
          image: GLOBAL_URL+"/assets/images/apps/food_delivery/food/4.jpg",
          rating: 4.9,
          distance: 0.7,
          promo: '20% Off',
          location: "Lefferts Avenue"
      ),
      RestaurantModel(
          id: 5,
          name: "Italian Food",
          tag: "Penne, Western Food",
          image: GLOBAL_URL+"/assets/images/apps/food_delivery/food/5.jpg",
          rating: 4.6,
          distance: 0.9,
          promo: '',
          location: "New York Avenue"
      ),
      RestaurantModel(
          id: 6,
          name: "Bread and Cookies",
          tag: "Bread",
          image: GLOBAL_URL+"/assets/images/apps/food_delivery/food/6.jpg",
          rating: 4.8,
          distance: 0.9,
          promo: '',
          location: "Mapple Street"
      ),
      RestaurantModel(
          id: 7,
          name: "Awesome Health",
          tag: "Salad, Healthy Food, Fresh",
          image: GLOBAL_URL+"/assets/images/apps/food_delivery/food/7.jpg",
          rating: 4.9,
          distance: 1.1,
          promo: '10% Off',
          location: "Fenimore Street"
      ),
      RestaurantModel(
          id: 8,
          name: "Chicken Specialties",
          tag: "Chicken, Rice, Teriyaki",
          image: GLOBAL_URL+"/assets/images/apps/food_delivery/food/8.jpg",
          rating: 4.7,
          distance: 3.9,
          promo: '10% Off',
          location: "Liberty Avenue"
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
          titleSpacing: 0.0,
          backgroundColor: GlobalStyle.appBarBackgroundColor,
          elevation: 0,
          // create search text field in the app bar
          title: Container(
            margin: EdgeInsets.only(right: 16),
            height: kToolbarHeight - 16,
            child: TextField(
              controller: _etSearch,
              autofocus: true,
              textInputAction: TextInputAction.search,
              onChanged: (textValue) {
                setState(() {});
              },
              onTap: (){
                setState(() {
                  _loadData = false;
                });
              },
              onSubmitted: (textValue){
                if(textValue != ''){
                  _getRestaurantData();
                }
              },
              maxLines: 1,
              style: TextStyle(fontSize: 13, color: Colors.grey[500]),
              decoration: InputDecoration(
                prefixIcon:
                Icon(Icons.search, color: Colors.grey[500], size: 18),
                suffixIcon: (_etSearch.text == '')
                    ? null
                    : GestureDetector(
                    onTap: () {
                      setState(() {
                        _etSearch = TextEditingController(text: '');
                      });
                    },
                    child: Icon(Icons.close, color: Colors.grey[500], size: 18)),
                contentPadding: EdgeInsets.all(0),
                isDense: true,
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.all(
                    Radius.circular(5),
                  ),
                ),
                filled: true,
                fillColor: Colors.grey[100],
                hintText: 'Find foods',
                hintStyle: TextStyle(fontSize: 13, color: Colors.grey[500]),
              ),
            ),
          )),
      body: WillPopScope(
        onWillPop: () {
          Navigator.pop(context);
          FocusScope.of(context).unfocus();
          return Future.value(true);
        },
        // if search field is empty, show history search
        // if search field not empty, show search text
        child: _loadData
            ? _loadNewData()
            : _etSearch.text == ''
              ? _showHistorySearch()
              : _showSearchText(),
      ));
  }

  Widget _loadNewData(){
    return (_loading==true)
        ? _shimmerLoading.buildShimmerContent()
        : ListView.builder(
            itemCount: _restaurantData.length,
            padding: EdgeInsets.symmetric(vertical: 0),
            physics: AlwaysScrollableScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              return _reusableWidget.buildRestaurantList(context, index, _restaurantData);
            },
          );
  }

  Widget _showHistorySearch(){
    return ListView(
      padding: EdgeInsets.all(16),
      children: [
        _searchData.length==0?Wrap():Container(
          child: Text('Last Search', style: GlobalStyle.lastSearchTitle),
        ),
        _searchData.length==0?Wrap():Column(
          children: List.generate(_searchData.length, (index) {
            return _buildLastSearchList(index);
          }),
        ),
      ],
    );
  }

  Widget _buildLastSearchList(index){
    return Container(
      margin: EdgeInsets.only(top: 16),
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          FocusScope.of(context).unfocus();
          _getRestaurantData();
          setState(() {
            _etSearch.text = _searchData[index].words;
          });
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Container(
                child: Row(
                  children: [
                    Icon(Icons.access_time, color: SOFT_GREY, size: 16),
                    SizedBox(width: 12),
                    Flexible(
                      child: Text(_searchData[index].words,
                          style: TextStyle(color: BLACK55), maxLines: 1, overflow: TextOverflow.ellipsis),
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
                onTap: (){
                  setState(() {
                    _searchData.removeAt(index);
                  });
                },
                child: Icon(Icons.close, color: BLACK77, size: 18)
            ),
          ],
        ),
      ),
    );
  }

  Widget _showSearchText(){
    return ListView(
      padding: EdgeInsets.all(16),
      children: [
        Container(
          child: GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () {
              FocusScope.of(context).unfocus();
              _getRestaurantData();
            },
            child: Row(
              children: [
                Icon(Icons.access_time, color: SOFT_GREY, size: 16),
                SizedBox(width: 12),
                Text(_etSearch.text, style: TextStyle(color: BLACK55)),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
