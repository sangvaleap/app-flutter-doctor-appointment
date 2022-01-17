import 'package:doctor_app/config/apps/food_delivery/constant.dart';
import 'package:doctor_app/config/apps/food_delivery/global_style.dart';
import 'package:doctor_app/ui/apps/food_delivery/coupon.dart';
import 'package:doctor_app/ui/apps/food_delivery/detail_food.dart';
import 'package:doctor_app/ui/apps/food_delivery/detail_restaurant.dart';
import 'package:doctor_app/ui/apps/food_delivery/order_status.dart';
import 'package:doctor_app/ui/apps/food_delivery/reusable_widget.dart';
import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  // initialize reusable widget
  final _reusableWidget = ReusableWidget();

  List<String> _addressData = [];
  String _address = 'Home Address';

  @override
  void initState() {
    _getData();

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _getData(){
    _addressData.add('Home Address');
    _addressData.add('Office Address');
    _addressData.add('Apartment Address');
    _addressData.add('Mom Address');
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
        title: Text('Steam Boat Lovers - Lefferts Avenue', style: GlobalStyle.appBarTitle),
        backgroundColor: GlobalStyle.appBarBackgroundColor,
        bottom: _reusableWidget.bottomAppBar(),
      ),
      body: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(bottom: kToolbarHeight+22),
            child: ListView(
              physics: AlwaysScrollableScrollPhysics(),
              padding: EdgeInsets.all(0),
              children: [
                _buildDeliveryInformation(),
                _reusableWidget.divider1(),
                _buildOrderSummary(),
                _reusableWidget.divider1(),
                _buildPayment()
              ],
            ),
          ),
          _buildPlaceOrderButton(),
        ],
      ),
    );
  }

  Widget _buildDeliveryInformation(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          color: Colors.grey[100],
          padding: EdgeInsets.all(16),
          child: Text('Deliver To', style: TextStyle(
              color: BLACK77,
              fontSize: 13,
              fontWeight: FontWeight.bold
          )),
        ),
        Container(
          margin: EdgeInsets.all(16),
          child: GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: (){
              showModalBottomSheet<void>(
                isScrollControlled:true,
                context: context,
                builder: (BuildContext context) {
                  return _reusableWidget.showPopup(_address, _addressData, (String newAddress){
                    setState((){
                      _address = newAddress;
                    });
                  });
                },
              );
            },
            child: Row(
              children: [
                Container(
                    margin:EdgeInsets.only(right:16),
                    child: Icon(Icons.place, color: ASSENT_COLOR, size: 20)
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(_address, style: TextStyle(
                          color: Colors.black, fontSize: 14
                      ), maxLines: 1, overflow: TextOverflow.ellipsis),
                      SizedBox(height: 2),
                      Text('Hilltop Playground', style: TextStyle(
                          color: SOFT_GREY, fontSize: 13
                      ), maxLines: 1, overflow: TextOverflow.ellipsis),
                    ],
                  ),
                ),
                Icon(Icons.chevron_right, size: 30, color: SOFT_GREY)
              ],
            ),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.fromLTRB(52, 0, 16, 16),
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.all(
                Radius.circular(4)
            ),
          ),
          child: Text('Meet me at the car park', style: TextStyle(
            color: BLACK77,
            fontSize: 13,
          )),
        )
      ],
    );
  }

  Widget _buildOrderSummary(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Order Summary', style: GlobalStyle.orderSummary),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => DetailRestaurantPage()));
                    },
                    child: Text('Add items', style: GlobalStyle.orderAction),
                  ),
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
                        Text('No soy sauce please', style: GlobalStyle.orderNotes),
                        SizedBox(height: 8),
                        GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => DetailFoodPage()));
                          },
                          child: Text('Edit', style: GlobalStyle.orderAction),
                        ),
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
                        SizedBox(height: 8),
                        GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => DetailFoodPage()));
                          },
                          child: Text('Edit', style: GlobalStyle.orderAction),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Divider(
                height: 32,
                color: Colors.grey[400],
              ),
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
              Divider(
                height: 32,
                color: Colors.grey[400],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Total', style: GlobalStyle.orderTotalTitle),
                  Text('\$12', style: GlobalStyle.orderTotalTitle),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget _buildPayment(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Payment', style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.bold
              ),
              ),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      border: Border.all(
                          width: 1,
                          color: BLACK55
                      ),
                      borderRadius: BorderRadius.all(
                          Radius.circular(2)
                      ),
                    ),
                    child: Text('Cash on Delivery', style: TextStyle(
                        color: BLACK55,
                        fontSize: 12,
                        fontWeight: FontWeight.bold
                    )),
                  ),
                  GestureDetector(
                    onTap:(){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => CouponPage()));
                    },
                    child: Text('Add a coupon', style: GlobalStyle.couponAction),
                  ),
                ],
              )
            ],
          ),
        )
      ],
    );
  }

  Widget _buildPlaceOrderButton(){
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
              )
          ),
        ),
        child: GestureDetector(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => OrderStatusPage()));
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            height: kToolbarHeight-10,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                  Radius.circular(6)
              ),
              color: ASSENT_COLOR,
            ),
            child: Center(
              child: Text('Place Order', style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.bold
              )),
            ),
          ),
        ),
      ),
    );
  }
}
