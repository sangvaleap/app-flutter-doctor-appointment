import 'package:doctor_app/config/apps/food_delivery/constant.dart';
import 'package:doctor_app/library/sk_onboarding_screen/sk_onboarding_model.dart';
import 'package:doctor_app/library/sk_onboarding_screen/sk_onboarding_screen.dart';
import 'package:doctor_app/ui/apps/food_delivery/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OnBoardingPage extends StatefulWidget {
  @override
  _OnBoardingPageState createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final pages = [
    SkOnboardingModel(
        title: 'Choose restaurant and food',
        description: 'Choose the restaurant and food you want to buy',
        titleColor: Colors.black,
        descripColor: Color(0xFF929794),
        imageFromUrl: GLOBAL_URL+'/assets/images/apps/food_delivery/onboarding/choose.png'),
    SkOnboardingModel(
        title: 'Delivery',
        description: 'Choose the delivery and then pay the food',
        titleColor: Colors.black,
        descripColor: Color(0xFF929794),
        imageFromUrl: GLOBAL_URL+'/assets/images/apps/food_delivery/onboarding/delivery.png'),
    SkOnboardingModel(
        title: 'Food Arrived',
        description: 'Wait until the food comes to your place',
        titleColor: Colors.black,
        descripColor: Color(0xFF929794),
        imageFromUrl: GLOBAL_URL+'/assets/images/apps/food_delivery/onboarding/arrived.png'),
    SkOnboardingModel(
        title: 'Enjoy',
        description: 'Enjoy your food at home',
        titleColor: Colors.black,
        descripColor: Color(0xFF929794),
        imageFromUrl: GLOBAL_URL+'/assets/images/apps/food_delivery/onboarding/enjoy.png'),
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
            themeColor: ASSENT_COLOR,
            pages: pages,
            skipClicked: (value) {
              //Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => HomePage()), (Route<dynamic> route) => false);
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()));
            },
            getStartedClicked: (value) {
              //Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => HomePage()), (Route<dynamic> route) => false);
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()));
            },
          ),
        )
    );
  }
}
