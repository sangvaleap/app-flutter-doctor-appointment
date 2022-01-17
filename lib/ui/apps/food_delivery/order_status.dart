import 'package:doctor_app/config/apps/food_delivery/constant.dart';
import 'package:doctor_app/config/apps/food_delivery/global_style.dart';
import 'package:doctor_app/ui/apps/food_delivery/reusable_widget.dart';
import 'package:doctor_app/ui/reusable/cache_image_network.dart';
import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

class OrderStatusPage extends StatefulWidget {
  @override
  _OrderStatusPageState createState() => _OrderStatusPageState();
}

class _OrderStatusPageState extends State<OrderStatusPage> {
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
        title: Text('Order Status', style: GlobalStyle.appBarTitle),
        backgroundColor: GlobalStyle.appBarBackgroundColor,
        bottom: _reusableWidget.bottomAppBar(),
      ),
      body: ListView(
        children: [
          _buildEstimatedArrival(),
          _reusableWidget.divider2(),
          _buildOrderStatus(),
          _reusableWidget.divider1(),
          _buildDriverInformation(),
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

  Widget _buildEstimatedArrival(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.fromLTRB(16, 16, 16, 0),
          child: Text('Estimated Arrival', style: TextStyle(
              fontSize: 15,
              color: Colors.black,
              fontWeight: FontWeight.bold
          ), maxLines: 1, overflow: TextOverflow.ellipsis,
          ),
        ),
        Container(
          padding: EdgeInsets.fromLTRB(16, 8, 16, 0),
          child: Text('18:00 - 18:25', style: TextStyle(
              fontSize: 24,
              color: Colors.black,
              fontWeight: FontWeight.bold
          ), maxLines: 1, overflow: TextOverflow.ellipsis,
          ),
        )
      ],
    );
  }

  Widget _buildOrderStatus(){
    return Container(
        margin: EdgeInsets.all(16),
        child: Column(
          children: [
            _timelineTile(orderStatus: 'On the way', orderDescription: 'Driver is on the way to deliver your order', position: 'first'),
            _timelineTile(orderStatus: 'At the restaurant', orderDescription: 'Driver is arrived at the restaurant'),
            _timelineTile(orderStatus: 'Go to restaurant', orderDescription: 'Driver is going to restaurant'),
            _timelineTile(orderStatus: 'Search driver', orderDescription: 'Search for driver'),
            _timelineTile(orderStatus: 'Order placed', orderDescription: 'We have received your order', position: 'last'),
          ],
        )
    );
  }

  Widget _timelineTile({required String orderStatus, required String orderDescription, String position = 'mid'}){
    return TimelineTile(
      indicatorStyle: IndicatorStyle(
          indicatorXY: 0,
          width: 16,
          color: position=='first'?PRIMARY_COLOR:Colors.grey[400]!
      ),
      beforeLineStyle: LineStyle(
          color: position=='first'?PRIMARY_COLOR:Colors.grey[400]!,
          thickness: 1.5
      ),
      isLast: position=='last'?true:false,
      endChild: Container(
          margin: EdgeInsets.only(left: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(orderStatus, style: TextStyle(
                  fontWeight: FontWeight.bold, color: BLACK55
              )),
              SizedBox(
                height: 4,
              ),
              Text(orderDescription, style: TextStyle(
                  color: BLACK77
              )),
              position!='last'
                  ? SizedBox(height: 12)
                  : SizedBox.shrink()
            ],
          )
      ),
    );
  }

  Widget _buildDriverInformation(){
    double imageSize = MediaQuery.of(context).size.width/7;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.fromLTRB(16, 16, 16, 0),
          child: Text('Driver Information', style: TextStyle(
              fontSize: 15,
              color: Colors.black,
              fontWeight: FontWeight.bold
          ), maxLines: 1, overflow: TextOverflow.ellipsis,
          ),
        ),
        Container(
          padding: EdgeInsets.all(16),
          child: Row(
            children: [
              ClipOval(
                  child: buildCacheNetworkImage(width: imageSize, height: imageSize, url: GLOBAL_URL+'/assets/images/user/avatar.png')
              ),
              SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Robert Steven', style: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                        fontWeight: FontWeight.bold
                    ), maxLines: 1, overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 4),
                    Text('HONDA CBR - B 4244 UGC', style: TextStyle(
                        fontSize: 12,
                        color: BLACK77
                    ), maxLines: 2, overflow: TextOverflow.ellipsis)
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }

  Widget _buildOrderSummary(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
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
        )
      ],
    );
  }

  Widget _buildTotalSummary(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
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
        )
      ],
    );
  }
}
