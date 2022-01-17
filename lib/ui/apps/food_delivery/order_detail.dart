import 'package:doctor_app/config/apps/food_delivery/constant.dart';
import 'package:doctor_app/config/apps/food_delivery/global_style.dart';
import 'package:doctor_app/ui/apps/food_delivery/reusable_widget.dart';
import 'package:doctor_app/ui/reusable/cache_image_network.dart';
import 'package:flutter/material.dart';

class OrderDetailPage extends StatefulWidget {
  @override
  _OrderDetailPageState createState() => _OrderDetailPageState();
}

class _OrderDetailPageState extends State<OrderDetailPage> {
  // initialize reusable widget
  final _reusableWidget = ReusableWidget();
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
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
        title: Text('Feb 4, 2020 18:13', style: GlobalStyle.appBarTitle),
        backgroundColor: GlobalStyle.appBarBackgroundColor,
        bottom: _reusableWidget.bottomAppBar(),
      ),
      body: ListView(
        children: [
          _buildOrderInformation(),
          _buildRestaurantInformation(),
          _reusableWidget.divider1(),
          _reusableWidget.deliveryInformation(),
          _reusableWidget.divider1(),
          _buildOrderSummary(),
          _reusableWidget.divider1(),
          _buildTotalSummary()
        ],
      ),
    );
  }

  Widget _buildOrderInformation(){
    return Container(
      color: Colors.grey[100],
      padding: EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Order ID', style: TextStyle(
              color: BLACK77,
              fontSize: 12
          )),
          Text('FDA-XSJF-259', style: TextStyle(
              color: BLACK77,
              fontSize: 12
          ))
        ],
      ),
    );
  }

  Widget _buildRestaurantInformation(){
    double imageSize = MediaQuery.of(context).size.width/7;
    return Container(
      padding: EdgeInsets.all(16),
      child: Row(
        children: [
          ClipOval(
              child: buildCacheNetworkImage(width: imageSize, height: imageSize, url: GLOBAL_URL+"/assets/images/apps/food_delivery/food/1.jpg")
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Mr. Hungry - Crown Street', style: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                    fontWeight: FontWeight.bold
                ), maxLines: 1, overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 4),
                Text('Delivered', style: TextStyle(
                    fontSize: 12,
                    color: BLACK77
                ))
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildOrderSummary(){
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Order Summary', style: GlobalStyle.orderSummary),
          SizedBox(height: 8),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('1x', style: GlobalStyle.orderCount),
              SizedBox(width: 24),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Flexible(
                            child:Text('Hainam Chicken Rice', style: GlobalStyle.orderFoodTitle, maxLines: 2, overflow: TextOverflow.ellipsis)
                        ),
                        SizedBox(width: 8),
                        Text('\$4.5', style: GlobalStyle.orderPrice)
                      ],
                    ),
                    SizedBox(height: 4),
                    Text('Regular', style: GlobalStyle.orderOptions, maxLines: 1, overflow: TextOverflow.ellipsis),
                    SizedBox(height: 4),
                    Text('Hot', style: GlobalStyle.orderOptions, maxLines: 1, overflow: TextOverflow.ellipsis),
                    SizedBox(height: 4),
                    Text('Chicken Breast, Chicken Thighs', style: GlobalStyle.orderOptions, maxLines: 1, overflow: TextOverflow.ellipsis),
                    SizedBox(height: 8),
                    Text('No soy sauce please', style: GlobalStyle.orderNotes)
                  ],
                ),
              )
            ],
          ),
          SizedBox(height: 16),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('1x', style: GlobalStyle.orderCount),
              SizedBox(width: 24),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Flexible(
                            child:Text('Hainam Chicken Rice', style: GlobalStyle.orderFoodTitle, maxLines: 2, overflow: TextOverflow.ellipsis)
                        ),
                        SizedBox(width: 8),
                        Text('\$5.5', style: GlobalStyle.orderPrice)
                      ],
                    ),
                    SizedBox(height: 4),
                    Text('Large', style: GlobalStyle.orderOptions, maxLines: 1, overflow: TextOverflow.ellipsis),
                    SizedBox(height: 4),
                    Text('Extra Hot', style: GlobalStyle.orderOptions, maxLines: 1, overflow: TextOverflow.ellipsis),
                    SizedBox(height: 4),
                    Text('Chicken Wings, Chicken Thighs', style: GlobalStyle.orderOptions, maxLines: 1, overflow: TextOverflow.ellipsis),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _buildTotalSummary(){
    return Container(
      margin: EdgeInsets.all(16),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Subtotal', style: GlobalStyle.orderTotalSubtitle),
              Text('\$10', style: GlobalStyle.orderTotalSubtitle),
            ],
          ),
          SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Delivery fee', style: GlobalStyle.orderTotalSubtitle),
              Text('\$2', style: GlobalStyle.orderTotalSubtitle),
            ],
          ),
          SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Promo (CHICKENLOVERS)', style: GlobalStyle.orderTotalSubtitle),
              Text('-\$1', style: GlobalStyle.orderTotalSubtitle),
            ],
          ),
          Divider(
            height: 32,
            color: Colors.grey[400],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Total', style: GlobalStyle.orderTotalTitle),
              Text('\$11', style: GlobalStyle.orderTotalTitle),
            ],
          ),
        ],
      ),
    );
  }
}
