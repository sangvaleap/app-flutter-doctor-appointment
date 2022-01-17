import 'package:doctor_app/config/apps/ecommerce/constant.dart';
import 'package:doctor_app/config/apps/ecommerce/global_style.dart';
import 'package:doctor_app/ui/apps/ecommerce/reusable_widget.dart';
import 'package:flutter/material.dart';

class NotificationSettingPage extends StatefulWidget {
  @override
  _NotificationSettingPageState createState() => _NotificationSettingPageState();
}

class _NotificationSettingPageState extends State<NotificationSettingPage> {
  // initialize reusable widget
  final _reusableWidget = ReusableWidget();

  bool _valChat = true;
  bool _valPromotion = true;
  bool _valOrderStatus = true;

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
            'Notification Setting',
            style: GlobalStyle.appBarTitle,
          ),
          backgroundColor: GlobalStyle.appBarBackgroundColor,
          systemOverlayStyle: GlobalStyle.appBarSystemOverlayStyle,
          bottom: _reusableWidget.bottomAppBar(),
        ),
        body: ListView(
          children: [
            _buildSwitchPromotion(),
            Divider(height: 0, color: Colors.grey[400]),
            _buildSwitchChat(),
            Divider(height: 0, color: Colors.grey[400]),
            _buildSwitchOrderStatus(),
            Divider(height: 0, color: Colors.grey[400]),
          ],
        )
    );
  }

  Widget _buildSwitchPromotion() {
    return SwitchListTile(
      contentPadding: EdgeInsets.only(left: 16, right: 4),
      title: Text(
        'Promotion',
        style: TextStyle(fontSize: 15, color: CHARCOAL),
      ),
      value: _valPromotion,
      activeColor: PRIMARY_COLOR,
      onChanged: (bool value) {
        setState(() {
          _valPromotion = value;
        });
      },
    );
  }

  Widget _buildSwitchChat() {
    return SwitchListTile(
      contentPadding: EdgeInsets.only(left: 16, right: 4),
      title: Text(
        'Chat',
        style: TextStyle(fontSize: 15, color: CHARCOAL),
      ),
      value: _valChat,
      activeColor: PRIMARY_COLOR,
      onChanged: (bool value) {
        setState(() {
          _valChat = value;
        });
      },
    );
  }

  Widget _buildSwitchOrderStatus() {
    return SwitchListTile(
      contentPadding: EdgeInsets.only(left: 16, right: 4),
      title: Text(
        'New Order Status',
        style: TextStyle(fontSize: 15, color: CHARCOAL),
      ),
      value: _valOrderStatus,
      activeColor: PRIMARY_COLOR,
      onChanged: (bool value) {
        setState(() {
          _valOrderStatus = value;
        });
      },
    );
  }
}
