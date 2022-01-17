import 'package:doctor_app/config/constant.dart';
import 'package:doctor_app/library/sk_onboarding_screen/sk_onboarding_model.dart';
import 'package:doctor_app/library/sk_onboarding_screen/sk_onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Onboarding2Page extends StatefulWidget {
  @override
  _Onboarding2PageState createState() => _Onboarding2PageState();
}

class _Onboarding2PageState extends State<Onboarding2Page> {
  final pages = [
    SkOnboardingModel(
        title: 'Tutorial 1',
        description: 'This is description of tutorial 1. Lorem ipsum dolor sit amet.',
        titleColor: Colors.black,
        descripColor: Color(0xFF929794),
        imageAssetPath: 'assets/images/lamp.jpg'),
    SkOnboardingModel(
        title: 'Tutorial 2',
        description: 'This is description of tutorial 2. Lorem ipsum dolor sit amet.',
        titleColor: Colors.black,
        descripColor: Color(0xFF929794),
        imageFromUrl: GLOBAL_URL+'/assets/images/onboarding/cart.png'),
    SkOnboardingModel(
        title: 'Tutorial 3',
        description: 'This is description of tutorial 3. Lorem ipsum dolor sit amet.',
        titleColor: Colors.black,
        descripColor: Color(0xFF929794),
        imageFromUrl: GLOBAL_URL+'/assets/images/onboarding/delivery.png'),
  ];

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
        body: AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle(
              statusBarIconBrightness: Brightness.dark,
          ),
          child: SKOnboardingScreen(
            bgColor: Colors.white,
            themeColor: Color(0xFFf74269),
            pages: pages,
            skipClicked: (value) {
              Fluttertoast.showToast(msg: 'Click skip', toastLength: Toast.LENGTH_SHORT);
            },
            getStartedClicked: (value) {
              Fluttertoast.showToast(msg: 'Click get started', toastLength: Toast.LENGTH_SHORT);
            },
          ),
        )
    );
  }
}
