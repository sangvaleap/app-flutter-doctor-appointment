import 'package:doctor_app/config/static.dart';
import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LocalNotification4Page extends StatefulWidget {
  @override
  _LocalNotification4PageState createState() => _LocalNotification4PageState();
}

class _LocalNotification4PageState extends State<LocalNotification4Page> {
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

  Future showNotification() async{
    String channel = 'default_channel';
    String channelName = 'Default';
    String channeldesc = 'This is default channel';
    String notifTitle = 'notification title';
    String notifMessage = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque tortor tortor, ultrices id scelerisque a, elementum id elit. Maecenas feugiat tellus sed augue malesuada, id tempus ex sodales.';
    String channelIcon = 'icon';

    AndroidNotificationDetails androidPlatformChannelSpecifics = AndroidNotificationDetails(
        channel, channelName, channelDescription: channeldesc,
        largeIcon: DrawableResourceAndroidBitmap(channelIcon),
        styleInformation: MediaStyleInformation(),
        importance: Importance.max,
        priority: Priority.high,
        enableVibration: true
    );
    NotificationDetails platformChannelSpecifics = NotificationDetails(android: androidPlatformChannelSpecifics);
    await StaticVarMethod.flutterLocalNotificationsPlugin.show(4, notifTitle, notifMessage, platformChannelSpecifics, payload: 'json payload');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _globalWidget.globalAppBar(),
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(24, 24, 24, 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: _globalWidget.createDetailWidget(
                  title: 'Local Notification 4 (Media Notification)',
                  desc: 'This is the example of local notification using media notification'
              ),
            ),
            Container(
                margin: EdgeInsets.symmetric(vertical: 8),
                child: _globalWidget.createButton(
                    buttonName: 'Show Notification',
                    onPressed: (){
                      showNotification();
                    }
                )
            ),
          ],
        ),
      ),
    );
  }
}
