import 'package:doctor_app/config/apps/ecommerce/constant.dart';
import 'package:doctor_app/config/apps/ecommerce/global_style.dart';
import 'package:doctor_app/ui/apps/ecommerce/reusable_widget.dart';
import 'package:flutter/material.dart';

class DeliveryEstimatedPage extends StatefulWidget {
  @override
  _DeliveryEstimatedPageState createState() => _DeliveryEstimatedPageState();
}

class _DeliveryEstimatedPageState extends State<DeliveryEstimatedPage> {
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
            'Delivery Estimated',
            style: GlobalStyle.appBarTitle,
          ),
          backgroundColor: GlobalStyle.appBarBackgroundColor,
          systemOverlayStyle: GlobalStyle.appBarSystemOverlayStyle,
          bottom: _reusableWidget.bottomAppBar(),
        ),
        body: ListView(
          children: [
            _createLocationInformation(),
            _createCourierInformation()
          ],
        )
    );
  }

  Widget _createLocationInformation(){
    return Container(
      padding: EdgeInsets.all(16),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Location', style: TextStyle(
              fontSize: 16, fontWeight: FontWeight.bold
          )),
          SizedBox(
            height: 16,
          ),
          Text('Delivery from :', style: TextStyle(
              color: SOFT_GREY, fontSize: 14
          )),
          SizedBox(
            height: 4,
          ),
          Text('Brooklyn, NY 11204, USA', style: TextStyle(
              color: CHARCOAL, fontSize: 14
          )),
          SizedBox(
            height: 12,
          ),
          Text('Delivery to :', style: TextStyle(
              color: SOFT_GREY, fontSize: 14
          )),
          SizedBox(
            height: 4,
          ),
          Container(
            child: Text('Robert Steven', style: TextStyle(
                color: CHARCOAL, fontSize: 14
            )),
          ),
          Container(
            margin: EdgeInsets.only(top: 4),
            child: Text('0811888999', style: TextStyle(
                color: CHARCOAL, fontSize: 14
            )),
          ),
          Container(
            margin: EdgeInsets.only(top: 4),
            child: Text('6019 Madison St', style: TextStyle(
                color: CHARCOAL, fontSize: 14
            )),
          ),
          Container(
            margin: EdgeInsets.only(top: 4),
            child: Text('West New York, NJ 07093', style: TextStyle(
                color: CHARCOAL, fontSize: 14
            )),
          ),
          Container(
            margin: EdgeInsets.only(top: 4),
            child: Text('USA', style: TextStyle(
                color: CHARCOAL, fontSize: 14
            )),
          )
        ],
      ),
    );
  }

  Widget _createCourierInformation(){
    return Container(
      margin: EdgeInsets.only(top: 16),
      padding: EdgeInsets.all(16),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Courier', style: GlobalStyle.chooseCourier),
          SizedBox(
            height: 8,
          ),
          Text('Courier price based on weight per 1000gr', style: TextStyle(
              color: SOFT_GREY, fontSize: 14
          )),
          Divider(
            height: 32,
            color: Colors.grey[400],
          ),
          Text('DHL', style: GlobalStyle.courierTitle),
          SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Regular', style: GlobalStyle.courierType),
              Text('\$13', style: GlobalStyle.deliveryPrice),
            ],
          ),
          SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Express', style: GlobalStyle.courierType),
              Text('\$22', style: GlobalStyle.deliveryPrice),
            ],
          ),
          Divider(
            height: 32,
            color: Colors.grey[400],
          ),
          Text('FedEx', style: GlobalStyle.courierTitle),
          SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Regular', style: GlobalStyle.courierType),
              Text('\$9', style: GlobalStyle.deliveryPrice),
            ],
          ),
          SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Express', style: GlobalStyle.courierType),
              Text('\$17', style: GlobalStyle.deliveryPrice),
            ],
          ),
          Divider(
            height: 32,
            color: Colors.grey[400],
          ),
          Text('Other 1', style: GlobalStyle.courierTitle),
          SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Regular', style: GlobalStyle.courierType),
              Text('\$9', style: GlobalStyle.deliveryPrice),
            ],
          ),
          SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Express', style: GlobalStyle.courierType),
              Text('\$17', style: GlobalStyle.deliveryPrice),
            ],
          ),
          Divider(
            height: 32,
            color: Colors.grey[400],
          ),
          Text('Other 2', style: GlobalStyle.courierTitle),
          SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Regular', style: GlobalStyle.courierType),
              Text('\$9', style: GlobalStyle.deliveryPrice),
            ],
          ),
          SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Express', style: GlobalStyle.courierType),
              Text('\$17', style: GlobalStyle.deliveryPrice),
            ],
          ),
          Divider(
            height: 32,
            color: Colors.grey[400],
          ),
          Text('Other 3', style: GlobalStyle.courierTitle),
          SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Regular', style: GlobalStyle.courierType),
              Text('\$9', style: GlobalStyle.deliveryPrice),
            ],
          ),
          SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Express', style: GlobalStyle.courierType),
              Text('\$17', style: GlobalStyle.deliveryPrice),
            ],
          ),
          Divider(
            height: 32,
            color: Colors.grey[400],
          ),
          Text('Other 4', style: GlobalStyle.courierTitle),
          SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Regular', style: GlobalStyle.courierType),
              Text('\$9', style: GlobalStyle.deliveryPrice),
            ],
          ),
          SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Express', style: GlobalStyle.courierType),
              Text('\$17', style: GlobalStyle.deliveryPrice),
            ],
          ),
        ],
      ),
    );
  }
}
