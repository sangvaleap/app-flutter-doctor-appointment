import 'package:doctor_app/config/constant.dart';
import 'package:doctor_app/ui/integration/local_notification/local_notification1.dart';
import 'package:doctor_app/ui/integration/local_notification/local_notification2.dart';
import 'package:doctor_app/ui/integration/local_notification/local_notification3.dart';
import 'package:doctor_app/ui/integration/local_notification/local_notification4.dart';
import 'package:doctor_app/ui/integration/local_notification/local_notification5.dart';
import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';

class LocalNotificationListPage extends StatefulWidget {
  @override
  _LocalNotificationListPageState createState() => _LocalNotificationListPageState();
}

class _LocalNotificationListPageState extends State<LocalNotificationListPage> {
  // initialize global widget
  final _globalWidget = GlobalWidget();

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
        appBar: _globalWidget.globalAppBar(),
        body: ListView(
          padding: EdgeInsets.fromLTRB(24, 24, 24, 16),
          children: [
            Container(
              child: Text('Local Notification List', style: TextStyle(
                  fontSize: 18, color: BLACK21, fontWeight: FontWeight.w500
              )),
            ),
            Container(
              margin: EdgeInsets.only(top: 24),
              child: Row(
                children: [
                  Flexible(
                      flex:5,
                      child: Container(
                        child: Text('Local Notification is used to display a notification.', style: TextStyle(
                            fontSize: 15, color: BLACK77,letterSpacing: 0.5
                        )),
                      )
                  ),
                  Flexible(
                      flex: 2,
                      child: Container(
                          alignment: Alignment.center,
                          child: Icon(Icons.notifications_active, size: 50, color: SOFT_BLUE))
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 48),
              child: Text('List', style: TextStyle(
                  fontSize: 18, color: BLACK21, fontWeight: FontWeight.w500
              )),
            ),
            SizedBox(height: 18),
            _globalWidget.screenDetailList(context: context, title: 'Local Notification 1 (Default)', page: LocalNotification1Page()),
            _globalWidget.screenDetailList(context: context, title: 'Local Notification 2 (Large Icon)', page: LocalNotification2Page()),
            _globalWidget.screenDetailList(context: context, title: 'Local Notification 3 (Big Picture)', page: LocalNotification3Page()),
            _globalWidget.screenDetailList(context: context, title: 'Local Notification 4 (Media Notifications)', page: LocalNotification4Page()),
            _globalWidget.screenDetailList(context: context, title: 'Local Notification 5 (Schedule Notification)', page: LocalNotification5Page()),
          ],
        )
    );
  }
}
