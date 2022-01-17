import 'package:doctor_app/config/constant.dart';
import 'package:doctor_app/config/static.dart';
import 'package:doctor_app/ui/cupertino_widget/cupertino_widget_tab.dart';
import 'package:doctor_app/ui/feature/feature_tab.dart';
import 'package:doctor_app/ui/integration/integration_tab.dart';
import 'package:doctor_app/ui/integration/local_notification/notification_detail.dart';
import 'package:doctor_app/ui/screen/screen_tab.dart';
import 'package:doctor_app/ui/apps/apps_tab.dart';
import 'package:doctor_app/ui/widget/widget_tab.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabBar _tabBar;
  int _tabIndex = 0;
  late TabController _tabController;

  String _version = '1.0.0';

  Future<void> _getSystemDevice() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    setState(() {
      _version = packageInfo.version;
    });
  }

  List<Tab> _tabBarList = [
    Tab(text: "Screen List"),
    Tab(text: "Widget List"),
    Tab(text: "Cupertino Widget"),
    Tab(text: "Awesome Features"),
    Tab(text: "Integrations"),
    Tab(text: "Apps")
  ];

  List<Widget> _tabContentList = <Widget>[
    ScreenTabPage(),
    WidgetTabPage(),
    CupertinoWidgetTabPage(),
    FeatureTabPage(),
    IntegrationTabPage(),
    AppsTabPage()
  ];

  // this function is used for exit the application, user must click back button two times
  DateTime? _currentBackPressTime;
  Future<bool> _onWillPop() {
    DateTime now = DateTime.now();
    if (_currentBackPressTime == null ||
        now.difference(_currentBackPressTime!) > Duration(seconds: 2)) {
      _currentBackPressTime = now;
      Fluttertoast.showToast(
          msg: 'Press BACK again to Exit', toastLength: Toast.LENGTH_SHORT);
      return Future.value(false);
    }
    return Future.value(true);
  }

  void _initLocalNotification() async {
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@drawable/icon');
    final IOSInitializationSettings initializationSettingsIOS =
        IOSInitializationSettings(onDidReceiveLocalNotification:
            (int id, String? title, String? body, String? payload) async {
      //localNotifData.add(LocalNotificationModel(id: id, title: title, body: body, payload: payload));
      // display a dialog with the notification details, tap ok to go to another page
      showDialog(
        context: context,
        builder: (BuildContext context) => CupertinoAlertDialog(
          title: Text(title!),
          content: Text(body!),
          actions: [
            CupertinoDialogAction(
              isDefaultAction: true,
              child: Text('Ok'),
              onPressed: () async {
                Navigator.of(context, rootNavigator: true).pop();
                await Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            NotificationDetailPage(payload: payload!)));
              },
            )
          ],
        ),
      );
    });
    final MacOSInitializationSettings initializationSettingsMacOS =
        MacOSInitializationSettings();
    final InitializationSettings initializationSettings =
        InitializationSettings(
            android: initializationSettingsAndroid,
            iOS: initializationSettingsIOS,
            macOS: initializationSettingsMacOS);
    await StaticVarMethod.flutterLocalNotificationsPlugin.initialize(
        initializationSettings, onSelectNotification: (String? payload) async {
      //localNotifData.add(LocalNotificationModel(payload: payload));
      if (payload != null) {
        debugPrint('notification payload: $payload');
      }
      await Navigator.push(
          context,
          MaterialPageRoute<void>(
              builder: (context) => NotificationDetailPage(payload: payload!)));
    });
  }

  @override
  void initState() {
    // set navigation bar color to default color
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
          systemNavigationBarColor: Color(0xFFF2F2F2),
          systemNavigationBarIconBrightness: Brightness.light),
    );

    if (!kIsWeb) {
      StaticVarMethod.flutterLocalNotificationsPlugin.cancelAll();
      // used for local notification on integration
      if (!StaticVarMethod.isInitLocalNotif) {
        StaticVarMethod.isInitLocalNotif = true;
        _initLocalNotification();
      }
    }
    _getSystemDevice();

    _tabController = TabController(
        vsync: this, length: _tabBarList.length, initialIndex: _tabIndex);

    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.black, //change your color here
          ),
          elevation: 0,
          backgroundColor: Colors.white,
          systemOverlayStyle: SystemUiOverlayStyle.dark,
          centerTitle: true,
          title: Image.asset('assets/images/logo_horizontal.png', height: 24),
          actions: [
            IconButton(
                icon: Icon(Icons.info_outline, color: Colors.black),
                onPressed: () {
                  _informationDialog(context);
                }),
          ],
          bottom: PreferredSize(
              child: Column(
                children: [
                  Theme(
                    data: ThemeData(
                      highlightColor: Colors.transparent,
                      splashColor: Colors.transparent,
                    ),
                    child: _tabBar = TabBar(
                      controller: _tabController,
                      onTap: (position) {
                        setState(() {
                          _tabIndex = position;
                        });
                        //print('idx : '+_tabIndex.toString());
                      },
                      isScrollable: true,
                      labelColor: BLACK21,
                      labelStyle: TextStyle(fontSize: 14),
                      indicatorSize: TabBarIndicatorSize.label,
                      indicatorWeight: 4,
                      indicatorColor: BLACK21,
                      unselectedLabelColor: SOFT_GREY,
                      labelPadding: EdgeInsets.symmetric(horizontal: 30.0),
                      tabs: _tabBarList,
                    ),
                  ),
                  Container(
                    color: Colors.grey[200],
                    height: 1.0,
                  )
                ],
              ),
              preferredSize:
                  Size.fromHeight(_tabBar.preferredSize.height + 1))),
      body: WillPopScope(
        onWillPop: _onWillPop,
        child: DefaultTabController(
          length: _tabBarList.length,
          child: TabBarView(
            controller: _tabController,
            physics: NeverScrollableScrollPhysics(),
            children: _tabContentList.map((Widget content) {
              return content;
            }).toList(),
          ),
        ),
      ),
    );
  }

  void _informationDialog(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)), //this right here
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 10, right: 10),
                  alignment: Alignment.topRight,
                  child: GestureDetector(
                      onTap: () {
                        Navigator.of(context, rootNavigator: true).pop();
                      },
                      child: Icon(
                        Icons.close,
                        color: BLACK21,
                        size: 20,
                      )),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: <Widget>[
                      Image.asset('assets/images/logo_light.png',
                          width: MediaQuery.of(context).size.width / 4),
                      Container(
                        transform: Matrix4.translationValues(
                            0.0, -MediaQuery.of(context).size.width / 26, 0.0),
                        child: Text('v' + _version,
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 12,
                            )),
                      ),
                      Text(
                        'DevKit developed and designed for Developer using Flutter. It contains many ready to used Screens, Widgets, Features, Functions, Integrations and Animations for iOS and Android devices.',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 14, color: BLACK77),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: () {
                      _launchInBrowser('https://1.envato.market/kj4MrM');
                    },
                    child: Text('Our Portfolio',
                        style: TextStyle(fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 12),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: SOFT_BLUE,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10.0),
                        bottomRight: Radius.circular(10.0)),
                  ),
                  child: GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: () {
                      _launchInBrowser('https://1.envato.market/QVNqa');
                    },
                    child: Text(
                      'Purchase Source Code',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ),
                )
              ],
            ),
          );
        });
  }

  Future<void> _launchInBrowser(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: false,
        forceWebView: false,
        headers: <String, String>{'my_header_key': 'my_header_value'},
      );
    } else {
      throw 'Could not launch $url';
    }
  }
}
