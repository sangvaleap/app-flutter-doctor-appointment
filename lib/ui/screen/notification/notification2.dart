import 'dart:async';

import 'package:doctor_app/model/screen/notification2_model.dart';
import 'package:doctor_app/ui/reusable/shimmer_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Notification2Page extends StatefulWidget {
  @override
  _Notification2PageState createState() => _Notification2PageState();
}

class _Notification2PageState extends State<Notification2Page> {
  Color _color1 = Color(0xFF515151);
  Color _color2 = Color(0xff777777);

  final _shimmerLoading = ShimmerLoading();

  bool _loading = true;
  Timer? _timerDummy;

  List<Notification2Model> _notificationData1 = [];

  void getData(){
    // this timer function is just for demo, so after 2 second, the shimmer loading will disappear and show the content
    _timerDummy = Timer(Duration(seconds: 2), () {
      setState(() {
        _loading = false;
      });
    });
    _notificationData1 = [
      Notification2Model(
        id: 1,
        title: 'Order Completed',
        message: 'Your order is completed',
        notifDate: '11 Sep 2019 08:40',
      ),
      Notification2Model(
        id: 2,
        title: 'Order Arrived',
        message: 'Your order has arrived',
        notifDate: '11 Sep 2019 08:39',
      ),
      Notification2Model(
        id: 3,
        title: 'Flash Sale',
        message: 'Hi Robert Steven, Flash Sale is open in 10 minutes. Grab your favorite product on sale',
        notifDate: '10 Sep 2019 10:00',
      ),
      Notification2Model(
        id: 4,
        title: 'Order Sent',
        message: 'Your order is being shipped by courier',
        notifDate: '9 Sep 2019 14:12',
      ),
      Notification2Model(
        id: 5,
        title: 'Ready to Pickup',
        message: 'Your order is ready to be picked up by the courier',
        notifDate: '9 Sep 2019 14:12',
      ),
      Notification2Model(
        id: 6,
        title: 'Trending Product',
        message: 'Hi Robert Steven, there is a trending product for you, check it out now',
        notifDate: '9 Sep 2019 13:00',
      ),
      Notification2Model(
        id: 7,
        title: 'Order Processed',
        message: 'Your order is being processed',
        notifDate: '9 Sep 2019 12:12',
      ),
      Notification2Model(
        id: 8,
        title: 'Payment Received',
        message: 'Payment has been received',
        notifDate: '9 Sep 2019 11:52',
      ),
      Notification2Model(
        id: 9,
        title: 'Waiting for Payment',
        message: 'We are waiting for your payment',
        notifDate: '9 Sep 2019 11:32',
      ),
      Notification2Model(
        id: 10,
        title: 'Order Placed',
        message: 'We have received your order',
        notifDate: '9 Sep 2019 11:32',
      ),
    ];
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  void dispose() {
    _timerDummy?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.black, //change your color here
          ),
          systemOverlayStyle: SystemUiOverlayStyle.dark,
          elevation: 0,
          title: Text(
            'Notification',
            style: TextStyle(
                fontSize: 18,
                color: Colors.black
            ),
          ),
          backgroundColor: Colors.white,
          bottom: PreferredSize(
              child: Container(
                color: Colors.grey[100],
                height: 1.0,
              ),
              preferredSize: Size.fromHeight(1.0)),
        ),
        body: RefreshIndicator(
          onRefresh: refreshData,
          child: (_loading == true)
              ? _shimmerLoading.buildShimmerContent()
              : ListView(
              children: List.generate(_notificationData1.length, (index) {
                return _createItem(index);
              })
          ),
        )
    );
  }

  Future refreshData() async {
    setState(() {
      _notificationData1.clear();
      _loading = true;
      getData();
    });
  }

  Widget _createItem(int index){
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        Fluttertoast.showToast(msg: 'Click Title '+_notificationData1[index].title, toastLength: Toast.LENGTH_SHORT);
      },
      child: Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                margin: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(_notificationData1[index].title,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: _color1)),
                    SizedBox(
                      height: 4,
                    ),
                    Text(_notificationData1[index].notifDate,
                        style: TextStyle(
                            color: Colors.grey[400],
                            fontSize: 11)),
                    SizedBox(
                      height: 8,
                    ),
                    Text(_notificationData1[index].message, style: TextStyle(color: _color2)),
                  ],
                )),
            Divider(
              height: 1,
              color: Colors.grey[400],
            ),
          ],
        ),
      ),
    );
  }
}
