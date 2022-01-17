import 'package:doctor_app/config/apps/food_delivery/constant.dart';
import 'package:doctor_app/config/apps/food_delivery/global_style.dart';
import 'package:doctor_app/model/apps/food_delivery/coupon_model.dart';
import 'package:doctor_app/ui/apps/food_delivery/reusable_widget.dart';
import 'package:doctor_app/ui/reusable/cache_image_network.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CouponDetailPage extends StatefulWidget {
  final CouponModel couponData;

  const CouponDetailPage({Key? key, required this.couponData}) : super(key: key);

  @override
  _CouponDetailPageState createState() => _CouponDetailPageState();
}

class _CouponDetailPageState extends State<CouponDetailPage> {
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
        title: Text('Coupon Detail', style: GlobalStyle.appBarTitle),
        backgroundColor: GlobalStyle.appBarBackgroundColor,
        bottom: _reusableWidget.bottomAppBar(),
      ),
      body: ListView(
        padding: EdgeInsets.fromLTRB(24, 20, 24, 24),
        children: [
          Align(
            alignment: Alignment.center,
            child: buildCacheNetworkImage(height: 80, url: GLOBAL_URL+'/assets/images/apps/food_delivery/merchant_logo.png', plColor: Colors.transparent),
          ),
          _buildCouponCard(widget.couponData),
          Container(
            margin: EdgeInsets.only(top: 24),
            child: Text('Terms and Conditions', style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold
            )),
          ),
          Container(
            margin: EdgeInsets.only(top: 12),
            child: Text(widget.couponData.term),
          ),
          Container(
            margin: EdgeInsets.only(top: 12),
            child: TextButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith<Color>(
                        (Set<MaterialState> states) => PRIMARY_COLOR,
                  ),
                  overlayColor: MaterialStateProperty.all(Colors.transparent),
                  shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(3.0),
                      )
                  ),
                ),
                onPressed: () {
                  Fluttertoast.showToast(msg: 'Coupon applied', toastLength: Toast.LENGTH_LONG);
                  Navigator.pop(context);
                  if(widget.couponData.id!=999){
                    Navigator.pop(context);
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                  child: Text(
                    'Use',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                )
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCouponCard(CouponModel couponData){
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
      elevation: 2,
      color: Colors.white,
      child: Container(
        padding: EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(couponData.name, style: GlobalStyle.couponName.copyWith(fontSize: 18)),
            SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 5),
                  padding: EdgeInsets.fromLTRB(8, 4, 8, 4),
                  decoration: BoxDecoration(
                      color: ASSENT_COLOR,
                      borderRadius: BorderRadius.circular(5)
                  ), //
                  child: Text('Limited Offer', style: GlobalStyle.couponLimitedOffer),
                ),
                Row(
                  children: [
                    Icon(
                        Icons.access_time,
                        size: 14,
                        color: SOFT_GREY
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    Text('Expiring in'+' '+couponData.day+' days', style: GlobalStyle.couponExpiringDate),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
