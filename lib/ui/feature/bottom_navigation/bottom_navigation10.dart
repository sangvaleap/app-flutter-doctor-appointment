import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:doctor_app/ui/reusable/nav_page1.dart';
import 'package:doctor_app/ui/reusable/nav_page2.dart';
import 'package:doctor_app/ui/reusable/nav_page3.dart';
import 'package:doctor_app/ui/reusable/nav_page4.dart';
import 'package:flutter/material.dart';

class BottomNavigation10Page extends StatefulWidget {
  @override
  _BottomNavigation10PageState createState() => _BottomNavigation10PageState();
}

class _BottomNavigation10PageState extends State<BottomNavigation10Page> {
  // initialize global widget
  final _globalWidget = GlobalWidget();

  late PageController _pageController;

  // Pages if you click bottom navigation
  final List<Widget> _contentPages = <Widget>[
    NavPage1(),
    NavPage2(),
    NavPage3(),
    NavPage4(),
  ];

  @override
  void initState() {
    // set initial pages for navigation to home page
    _pageController = PageController(initialPage: 0);
    _pageController.addListener(_handleTabSelection);

    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _handleTabSelection() {
    setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _globalWidget.globalAppBar(),
      body: PageView(
        controller: _pageController,
        physics: NeverScrollableScrollPhysics(),
        children: _contentPages.map((Widget content) {
          return content;
        }).toList(),
      ),
      bottomNavigationBar: ConvexAppBar(
        style: TabStyle.react,
        color: Colors.white,
        activeColor: Colors.white,
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Colors.blue, Colors.redAccent, Colors.green, Colors.blue],
          tileMode: TileMode.repeated,
        ),
        items: [
          TabItem(icon: Icons.home, title: 'Nav 1'),
          TabItem(icon: Icons.favorite, title: 'Nav 2'),
          TabItem(icon: Icons.notifications, title: 'Nav 3'),
          TabItem(icon: Icons.person, title: 'Nav 4'),
        ],
        initialActiveIndex: 0,//optional, default as 0
        onTap: (int i){
          _tapNav(i);
        },
      ),
    );
  }

  void _tapNav(index){
    _pageController.jumpToPage(index);

    // this unfocus is to prevent show keyboard in the text field
    FocusScope.of(context).unfocus();
  }
}
