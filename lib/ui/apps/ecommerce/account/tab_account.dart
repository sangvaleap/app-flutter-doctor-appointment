/*
This is account page
we used AutomaticKeepAliveClientMixin to keep the state when moving from 1 navbar to another navbar, so the page is not refresh overtime
 */

import 'package:doctor_app/config/apps/ecommerce/constant.dart';
import 'package:doctor_app/config/apps/ecommerce/global_style.dart';
import 'package:doctor_app/ui/apps/ecommerce/account/about.dart';
import 'package:doctor_app/ui/apps/ecommerce/account/account_information/account_information.dart';
import 'package:doctor_app/ui/apps/ecommerce/account/last_seen_product.dart';
import 'package:doctor_app/ui/apps/ecommerce/account/notification_setting.dart';
import 'package:doctor_app/ui/apps/ecommerce/account/order/order_list.dart';
import 'package:doctor_app/ui/apps/ecommerce/account/payment_method/payment_method.dart';
import 'package:doctor_app/ui/apps/ecommerce/account/privacy_policy.dart';
import 'package:doctor_app/ui/apps/ecommerce/account/set_address/set_address.dart';
import 'package:doctor_app/ui/apps/ecommerce/account/terms_conditions.dart';
import 'package:doctor_app/ui/apps/ecommerce/general/chat_us.dart';
import 'package:doctor_app/ui/apps/ecommerce/general/notification.dart';
import 'package:doctor_app/ui/apps/ecommerce/reusable_widget.dart';
import 'package:doctor_app/ui/reusable/cache_image_network.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class TabAccountPage extends StatefulWidget {
  @override
  _TabAccountPageState createState() => _TabAccountPageState();
}

class _TabAccountPageState extends State<TabAccountPage> with AutomaticKeepAliveClientMixin {
  // initialize reusable widget
  final _reusableWidget = ReusableWidget();

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // if we used AutomaticKeepAliveClientMixin, we must call super.build(context);
    super.build(context);
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: GlobalStyle.appBarElevation,
          title: Text(
            'Account',
            style: GlobalStyle.appBarTitle,
          ),
          backgroundColor: GlobalStyle.appBarBackgroundColor,
          systemOverlayStyle: GlobalStyle.appBarSystemOverlayStyle,
          actions: [
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ChatUsPage()));
                },
                child: Icon(Icons.email, color: BLACK_GREY)),
            IconButton(
                icon: _reusableWidget.customNotifIcon(count: 8, notifColor: BLACK_GREY),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => NotificationPage()));
                }),
          ],
          bottom: _reusableWidget.bottomAppBar(),
        ),
        body: ListView(
          padding: EdgeInsets.all(16),
          children: [
            _createAccountInformation(),
            _createListMenu('Set Address for Delivery', SetAddressPage()),
            _reusableWidget.divider1(),
            _createListMenu('Order List', OrderListPage()),
            _reusableWidget.divider1(),
            _createListMenu('Payment Method', PaymentMethodPage()),
            _reusableWidget.divider1(),
            _createListMenu('Last Seen Product', LastSeenProductPage()),
            _reusableWidget.divider1(),
            _createListMenu('Notification Setting', NotificationSettingPage()),
            _reusableWidget.divider1(),
            _createListMenu('About', AboutPage()),
            _reusableWidget.divider1(),
            _createListMenu('Terms and Conditions', TermsConditionsPage()),
            _reusableWidget.divider1(),
            _createListMenu('Privacy Policy', PrivacyPolicyPage()),
            _reusableWidget.divider1(),
            Container(
              margin: EdgeInsets.fromLTRB(0, 18, 0, 0),
              child: GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: (){
                  Fluttertoast.showToast(
                      msg: 'Click Sign Out',
                      toastLength: Toast.LENGTH_LONG);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.power_settings_new, size: 20, color: ASSENT_COLOR),
                    SizedBox(width: 8),
                    Text('Sign Out', style: TextStyle(
                        fontSize: 15, color: ASSENT_COLOR
                    )),
                  ],
                ),
              ),
            ),
          ],
        )
    );
  }

  Widget _createAccountInformation(){
    final double profilePictureSize = MediaQuery.of(context).size.width/4;
    return Container(
      margin: EdgeInsets.only(bottom: 14),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: profilePictureSize,
            height: profilePictureSize,
            child: GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => AccountInformationPage()));
              },
              child: CircleAvatar(
                backgroundColor: Colors.grey[200],
                radius: profilePictureSize,
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: profilePictureSize-4,
                  child: Hero(
                    tag: 'profilePicture',
                    child: ClipOval(
                        child: buildCacheNetworkImage(width: profilePictureSize-4, height: profilePictureSize-4, url: GLOBAL_URL+'/assets/images/user/avatar.png')
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            width: 16,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Robert Steven', style: TextStyle(
                    fontSize: 18, fontWeight: FontWeight.bold
                )),
                SizedBox(
                  height: 8,
                ),
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => AccountInformationPage()));
                  },
                  child: Row(
                    children: [
                      Text('Account Information', style: TextStyle(
                          fontSize: 14, color: BLACK_GREY
                      )),
                      SizedBox(
                        width: 8,
                      ),
                      Icon(Icons.chevron_right, size: 20, color: SOFT_GREY)
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _createListMenu(String menuTitle, StatefulWidget page){
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => page));
      },
      child: Container(
        margin: EdgeInsets.fromLTRB(0, 18, 0, 18),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(menuTitle, style: TextStyle(
                fontSize: 15, color: CHARCOAL
            )),
            Icon(Icons.chevron_right, size: 20, color: SOFT_GREY),
          ],
        ),
      ),
    );
  }
}
