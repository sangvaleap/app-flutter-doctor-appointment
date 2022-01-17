// import 'package:doctor_app/Splash.dart';
import 'package:doctor_app/pages/doctor_page.dart';
import 'package:doctor_app/pages/doctor_profile_page.dart';
import 'package:doctor_app/theme/colors.dart';
import 'package:doctor_app/ui/apps/ecommerce/splash_screen.dart';
import 'package:flutter/material.dart';
import 'pages/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '2mi Coaching',
      theme: ThemeData(
        primaryColor: primary,
      ),
      home: SplashScreenPage(),
    );
  }
}
