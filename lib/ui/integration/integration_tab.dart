import 'package:doctor_app/ui/integration/api/api_list.dart';
import 'package:doctor_app/ui/integration/firebase/firebase_list.dart';
import 'package:doctor_app/ui/integration/maps/maps_package_list.dart';
import 'package:doctor_app/ui/integration/local_notification/local_notification_list.dart';
import 'package:doctor_app/ui/not_supported_for_web.dart';
import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class IntegrationTabPage extends StatefulWidget {
  @override
  _IntegrationTabPageState createState() => _IntegrationTabPageState();
}

class _IntegrationTabPageState extends State<IntegrationTabPage> {
  // initialize global widget
  final _globalWidget = GlobalWidget();

  int number = 1;

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
    return Tab(
      child: ListView(
        padding: EdgeInsets.fromLTRB(24, 16, 24, 16),
        children: [
          _globalWidget.screenTabList(
              context: context,
              id: number++,
              icon: Icons.map,
              title: 'Maps',
              desc: 'Used to shown maps',
              page: MapsPackageListPage()
          ),
          _globalWidget.screenTabList(
              context: context,
              id: number++,
              icon: Icons.notifications_active,
              title: 'Local Notification',
              desc: 'Used to display a notification',
              page: (!kIsWeb)?LocalNotificationListPage():NotSupportedForWebPage()
          ),
          _globalWidget.screenTabList(
              context: context,
              id: number++,
              icon: Icons.sync_alt,
              title: 'Get Data from API',
              desc: 'Used to connect data from backend server',
              page: ApiListPage()
          ),
          _globalWidget.screenTabList(
              context: context,
              id: number++,
              icon: Icons.local_fire_department,
              title: 'Firebase',
              desc: 'Used to integrate with Firebase',
              page: FirebaseListPage()
          )
        ],
      ),
    );
  }
}
