import 'package:doctor_app/config/apps/ecommerce/constant.dart';
import 'package:doctor_app/config/apps/ecommerce/global_style.dart';
import 'package:doctor_app/ui/apps/ecommerce/reusable_widget.dart';
import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';

class AboutPage extends StatefulWidget {
  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  // initialize reusable widget
  final _reusableWidget = ReusableWidget();

  String _version = '1.0.0';

  Future<void> _getSystemDevice() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    setState(() {
      _version = packageInfo.version;
    });
  }

  @override
  void initState() {
    _getSystemDevice();
    super.initState();
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
            'About',
            style: GlobalStyle.appBarTitle,
          ),
          backgroundColor: GlobalStyle.appBarBackgroundColor,
          systemOverlayStyle: GlobalStyle.appBarSystemOverlayStyle,
          bottom: _reusableWidget.bottomAppBar(),
        ),
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Center(
                  child: Image.asset('assets/images/apps/ecommerce/logo.png', height: 32)),
              SizedBox(
                height: 50,
              ),
              Text(
                'App Version',
                style: TextStyle(
                    fontSize: 14,
                    color: CHARCOAL
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                _version,
                style: TextStyle(
                    fontSize: 14,
                    color: CHARCOAL
                ),
              ),
            ],
          ),
        )
    );
  }
}
