import 'dart:async';

import 'package:doctor_app/config/apps/food_delivery/constant.dart';
import 'package:doctor_app/config/apps/food_delivery/global_style.dart';
import 'package:doctor_app/model/apps/food_delivery/order_history_model.dart';
import 'package:doctor_app/ui/apps/food_delivery/order_detail.dart';
import 'package:doctor_app/ui/apps/food_delivery/reusable_widget.dart';
import 'package:doctor_app/ui/reusable/cache_image_network.dart';
import 'package:doctor_app/ui/reusable/shimmer_loading.dart';
import 'package:flutter/material.dart';

class OrderHistoryPage extends StatefulWidget {
  @override
  _OrderHistoryPageState createState() => _OrderHistoryPageState();
}

class _OrderHistoryPageState extends State<OrderHistoryPage> {
  // initialize shimmer loading and reusable widget
  final _shimmerLoading = ShimmerLoading();
  final _reusableWidget = ReusableWidget();

  bool _loading = true;
  Timer? _timerDummy;

  List<OrderHistoryModel> _orderData = [];

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

    _orderData = [
      OrderHistoryModel(
          id: 1,
          name: "Beef Lovers - Montgomery Street",
          countItem: 2,
          date: "Feb 10, 2020",
          time: "11:48"
      ),
      OrderHistoryModel(
          id: 2,
          name: "Steam Boat Lovers - Lefferts Avenue",
          countItem: 6,
          date: "Feb 8, 2020",
          time: "13:33"
      ),
      OrderHistoryModel(
          id: 3,
          name: "Bread and Cookies - Mapple Street",
          countItem: 3,
          date: "Feb 7, 2020",
          time: "07:27"
      ),
      OrderHistoryModel(
          id: 4,
          name: "Chicken Specialties - Liberty Avenue",
          countItem: 4,
          date: "Feb 4, 2020",
          time: "18:13"
      ),
      OrderHistoryModel(
          id: 5,
          name: "Mr. Hungry - Crown Street",
          countItem: 4,
          date: "Jan 31, 2020",
          time: "21:22"
      ),
      OrderHistoryModel(
          id: 6,
          name: "Salad Stop - Empire Boulevard",
          countItem: 3,
          date: "Jan 27, 2020",
          time: "22:25"
      ),
      OrderHistoryModel(
          id: 7,
          name: "Italian Food - New York Avenue",
          countItem: 2,
          date: "Jan 26, 2020",
          time: "10:55"
      ),
      OrderHistoryModel(
          id: 8,
          name: "Awesome Health - Fenimore Street",
          countItem: 3,
          date: "Jan 24, 2020",
          time: "12:48"
      ),
      OrderHistoryModel(
          id: 1,
          name: "Beef Lovers - Montgomery Street",
          countItem: 2,
          date: "Feb 10, 2020",
          time: "11:48"
      ),
      OrderHistoryModel(
          id: 2,
          name: "Steam Boat Lovers - Lefferts Avenue",
          countItem: 6,
          date: "Feb 8, 2020",
          time: "13:33"
      ),
      OrderHistoryModel(
          id: 3,
          name: "Bread and Cookies - Mapple Street",
          countItem: 3,
          date: "Feb 7, 2020",
          time: "07:27"
      ),
      OrderHistoryModel(
          id: 4,
          name: "Chicken Specialties - Liberty Avenue",
          countItem: 4,
          date: "Feb 4, 2020",
          time: "18:13"
      ),
      OrderHistoryModel(
          id: 5,
          name: "Mr. Hungry - Crown Street",
          countItem: 4,
          date: "Jan 31, 2020",
          time: "21:22"
      ),
      OrderHistoryModel(
          id: 6,
          name: "Salad Stop - Empire Boulevard",
          countItem: 3,
          date: "Jan 27, 2020",
          time: "22:25"
      ),
      OrderHistoryModel(
          id: 7,
          name: "Italian Food - New York Avenue",
          countItem: 2,
          date: "Jan 26, 2020",
          time: "10:55"
      ),
      OrderHistoryModel(
          id: 8,
          name: "Awesome Health - Fenimore Street",
          countItem: 3,
          date: "Jan 24, 2020",
          time: "12:48"
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
        title: Text('Order History', style: GlobalStyle.appBarTitle),
        backgroundColor: GlobalStyle.appBarBackgroundColor,
        bottom: _reusableWidget.bottomAppBar(),
      ),
      body: (_loading == true)
          ? _shimmerLoading.buildShimmerContent()
          : ListView.builder(
        itemCount: _orderData.length,
        padding: EdgeInsets.fromLTRB(16, 0, 16, 16),
        physics: AlwaysScrollableScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return _buildOrderHistoryCard(_orderData[index]);
        },
      ),
    );
  }

  Widget _buildOrderHistoryCard(OrderHistoryModel orderData){
    return Card(
      margin: EdgeInsets.only(top: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
      elevation: 2,
      color: Colors.white,
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => OrderDetailPage()));
        },
        child: Container(
          padding: EdgeInsets.all(16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildCacheNetworkImage(height: 40, url: GLOBAL_URL+'/assets/images/apps/food_delivery/merchant_logo.png', plColor: Colors.transparent),
              SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Text(orderData.name, style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.bold
                          ), maxLines: 2, overflow: TextOverflow.ellipsis),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(orderData.date, style: TextStyle(
                                fontSize: 11,
                                color: SOFT_GREY
                            )),
                            Text(orderData.time, style: TextStyle(
                                fontSize: 11,
                                color: SOFT_GREY
                            )),
                          ],
                        )
                      ],
                    ),
                    SizedBox(height: 8),
                    Text(orderData.countItem.toString()+' item', style: TextStyle(
                      fontSize: 12,
                      color: SOFT_GREY
                    ))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
