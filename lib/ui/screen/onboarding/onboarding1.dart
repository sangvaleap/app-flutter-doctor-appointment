import 'package:doctor_app/config/constant.dart';
import 'package:doctor_app/library/flutter_overboard/overboard.dart';
import 'package:doctor_app/library/flutter_overboard/page_model.dart';
import 'package:doctor_app/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Onboarding1Page extends StatefulWidget {
  @override
  _Onboarding1PageState createState() => _Onboarding1PageState();
}

class _Onboarding1PageState extends State<Onboarding1Page> {
  // create each page of onBoard here
  final _pageList = [
    PageModel(
        color: Color(0xFFf2b036),
        imageAssetPath: 'assets/images/onboarding/1.jpeg',
        title: 'Executive Leadership Coaching',
        body: 'This is description of tutorial 1. Lorem ipsum dolor sit amet.',
        doAnimateImage: true),
    PageModel(
        color: Color(0xFFf2b036),
        imageAssetPath: 'assets/images/onboarding/2.jpeg',
        title: 'Executive Leadership team Coaching',
        body: 'This is description of tutorial 2. Lorem ipsum dolor sit amet.',
        doAnimateImage: true),
    PageModel(
        color: Color(0xFFf2b036),
        imageAssetPath: 'assets/images/onboarding/3.jpeg',
        title: 'Personal Impact Coaching',
        body: 'This is description of tutorial 3. Lorem ipsum dolor sit amet.',
        doAnimateImage: true),
    PageModel(
        color: Color(0xFFf2b036),
        imageAssetPath: 'assets/images/onboarding/4.jpeg',
        title: 'Transition Coaching',
        body: 'This is description of tutorial 4. Lorem ipsum dolor sit amet.',
        doAnimateImage: true),
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
      value: SystemUiOverlayStyle(statusBarIconBrightness: Brightness.dark),
      child: OverBoard(
        pages: _pageList,
        showBullets: true,
        finishCallback: () {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => Home()));
        },
      ),
    ));
  }
}
