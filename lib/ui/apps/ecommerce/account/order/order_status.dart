import 'package:doctor_app/config/apps/ecommerce/constant.dart';
import 'package:doctor_app/config/apps/ecommerce/global_style.dart';
import 'package:doctor_app/ui/apps/ecommerce/reusable_widget.dart';
import 'package:flutter/material.dart';

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
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: GlobalStyle.appBarIconThemeColor,
          ),
          elevation: GlobalStyle.appBarElevation,
          title: Text(
            'Order Status',
            style: GlobalStyle.appBarTitle,
          ),
          backgroundColor: GlobalStyle.appBarBackgroundColor,
          systemOverlayStyle: GlobalStyle.appBarSystemOverlayStyle,
          bottom: _reusableWidget.bottomAppBar(),
        ),
        body: Container(
          child: ListView(
            padding: EdgeInsets.all(32),
            children: [
              _createPathTop('11 Sep 2019 08:40', 'Order Completed', 'Your order is completed'),
              _createPath('11 Sep 2019 08:39', 'Order Arrived', 'Your order has arrived'),
              _createPath('9 Sep 2019 14:12', 'Order Sent', 'Your order is being shipped by courier'),
              _createPath('9 Sep 2019 14:12', 'Ready to Pickup', 'Your order is ready to be picked up by the courier'),
              _createPath('9 Sep 2019 12:12', 'Order Processed', 'Your order is being processed'),
              _createPath('9 Sep 2019 11:52', 'Payment Received', 'Payment has been received'),
              _createPath('9 Sep 2019 11:32', 'Waiting for Payment', 'We are waiting for your payment'),
              _createPathDown('9 Sep 2019 11:32', 'Order Placed', 'We have received your order'),
            ],
          ),
        )
    );
  }

  Widget _createPathTop(String date, String orderStatus, String orderDescription){
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.only(top: 0),
          width: 16,
          height: 16,
          decoration: new BoxDecoration(
            shape: BoxShape.circle,// You can use like this way or like the below line
            //borderRadius: new BorderRadius.circular(30.0),
            color: PRIMARY_COLOR,
          ),
        ),
        IntrinsicHeight(
          child: Row(
            children: <Widget>[
              Container(
                margin:EdgeInsets.only(left: 7.5, right: 7.5),
                child: Container(
                  width: 1,
                  color: PRIMARY_COLOR,
                ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(left: 32, right: 32),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(orderStatus, style: TextStyle(
                          fontWeight: FontWeight.bold, color: CHARCOAL
                      )),
                      SizedBox(
                        height: 4,
                      ),
                      Text(date, style: TextStyle(
                          color: Colors.grey[400], fontSize: 11
                      )),
                      SizedBox(
                        height: 8,
                      ),
                      Text(orderDescription, style: TextStyle(
                          color: BLACK_GREY
                      )),
                      SizedBox(
                        height: 24,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget _createPath(String date, String orderStatus, String orderDescription){
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.only(top: 0),
          width: 16,
          height: 16,
          decoration: new BoxDecoration(
            shape: BoxShape.circle,// You can use like this way or like the below line
            //borderRadius: new BorderRadius.circular(30.0),
            color: Colors.grey[400],
          ),
        ),
        IntrinsicHeight(
          child: Row(
            children: <Widget>[
              Container(
                margin:EdgeInsets.only(left: 7.5, right: 7.5),
                child: Container(
                  width: 1,
                  color: Colors.grey[400],
                ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(left: 32, right: 32),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(orderStatus, style: TextStyle(
                          fontWeight: FontWeight.bold, color: CHARCOAL
                      )),
                      SizedBox(
                        height: 4,
                      ),
                      Text(date, style: TextStyle(
                          color: Colors.grey[400], fontSize: 11
                      )),
                      SizedBox(
                        height: 8,
                      ),
                      Text(orderDescription, style: TextStyle(
                          color: BLACK_GREY
                      )),
                      SizedBox(
                        height: 24,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget _createPathDown(String date, String orderStatus, String orderDescription){
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.only(top: 0),
          width: 16,
          height: 16,
          decoration: new BoxDecoration(
            shape: BoxShape.circle,// You can use like this way or like the below line
            //borderRadius: new BorderRadius.circular(30.0),
            color: Colors.grey[400],
          ),
        ),
        IntrinsicHeight(
          child: Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(left: 48, right: 48),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(orderStatus, style: TextStyle(
                          fontWeight: FontWeight.bold, color: CHARCOAL
                      )),
                      SizedBox(
                        height: 4,
                      ),
                      Text(date, style: TextStyle(
                          color: Colors.grey[400], fontSize: 11
                      )),
                      SizedBox(
                        height: 8,
                      ),
                      Text(orderDescription, style: TextStyle(
                          color: BLACK_GREY
                      )),
                    ],
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
