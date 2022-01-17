import 'dart:async';

import 'package:doctor_app/config/apps/ecommerce/constant.dart';
import 'package:doctor_app/theme/extention.dart';
import 'package:doctor_app/theme/light_color.dart';
import 'package:doctor_app/theme/text_styles.dart';
import 'package:doctor_app/ui/apps/ecommerce/onboarding.dart';
import 'package:doctor_app/ui/screen/onboarding/onboarding1.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SplashScreenPage extends StatefulWidget {
  @override
  _SplashScreenPageState createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  Timer? _timer;
  int _second = 3; // set timer for 3 second and then direct to next page

  void _startTimer() {
    const period = const Duration(seconds: 1);
    _timer = Timer.periodic(period, (timer) {
      setState(() {
        _second--;
      });
      if (_second == 0) {
        _cancelFlashsaleTimer();
        // for this example we will use pushReplacement because we want to go back to the list
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => Onboarding1Page()));

        // if you use this splash screen on the very first time when you open the page, use below code
        //Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => OnBoardingPage()), (Route<dynamic> route) => false);
      }
    });
  }

  void _cancelFlashsaleTimer() {
    if (_timer != null) {
      _timer?.cancel();
      _timer = null;
    }
  }

  @override
  void initState() {
    // set status bar color to transparent and navigation bottom color to black21
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
    );

    if (_second != 0) {
      _startTimer();
    }
    super.initState();
  }

  @override
  void dispose() {
    _cancelFlashsaleTimer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: WillPopScope(
      onWillPop: () {
        return Future.value(false);
      },
      child: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/background.jpg"),
                fit: BoxFit.fill,
              ),
            ),
          ),
          // Positioned.fill(
          //   child: Opacity(
          //     opacity: .6,
          //     child: Container(
          //       decoration: BoxDecoration(
          //         gradient: LinearGradient(
          //             colors: [LightColor.purpleExtraLight, LightColor.purple],
          //             begin: Alignment.topCenter,
          //             end: Alignment.bottomCenter,
          //             tileMode: TileMode.mirror,
          //             stops: [.5, 6]),
          //       ),
          //     ),
          //   ),
          // ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: SizedBox(),
              ),
              Image.asset(
                'assets/images/logo_horizontal.png',
                // color: Colors.white,
                height: 100,
              ),
              Text(
                "Your Coaching Expert",
                style: TextStyles.h1Style.white,
                textAlign: TextAlign.justify,
              ),
              Image.asset(
                'assets/images/lady.png',
                // color: Colors.white,
                height: 200,
              ),
              // Text(
              //   "The Scientific Way to Test",
              //   style: TextStyles.bodySm.white.bold,
              // ),
              Expanded(
                flex: 7,
                child: SizedBox(),
              ),
            ],
          ).alignTopCenter,
        ],
      ),
      // Container(
      //   child: Center(
      //     child: Image.asset(LOCAL_IMAGES_URL + '/logo.png',
      //         width: MediaQuery.of(context).size.width / 2),
      //   ),
      // ),
    ));
  }
}
