import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:doctor_app/ui/reusable/nav_page1.dart';
import 'package:doctor_app/ui/reusable/nav_page2.dart';
import 'package:doctor_app/ui/reusable/nav_page3.dart';
import 'package:doctor_app/ui/reusable/nav_page4.dart';
import 'package:flutter/material.dart';

class BottomNavigation9Page extends StatefulWidget {
  @override
  _BottomNavigation9PageState createState() => _BottomNavigation9PageState();
}

class _BottomNavigation9PageState extends State<BottomNavigation9Page> {
  // initialize global widget
  final _globalWidget = GlobalWidget();

  late PageController _pageController;

  // Pages if you click bottom navigation
  final List<Widget> _contentPages = <Widget>[
    Center(child: Text("Maps")),
    NavPage2(),
    NavPage1(),
    NavPage3(),
    NavPage4(),
  ];

  @override
  void initState() {
    // set initial pages for navigation to home page
    _pageController = PageController(initialPage: 2);
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
        style: TabStyle.fixedCircle, // if you are using fixed circle type, the TabItem must be odd number
        backgroundColor: Color(0xFF009688),
        color: Colors.white,
        activeColor: Colors.white,
        items: [
          TabItem(icon: Icons.map, title: 'Nav 1'),
          TabItem(icon: Icons.favorite, title: 'Nav 2'),
          TabItem(icon: Icons.home, title: 'Nav 3'),
          TabItem(icon: Icons.notifications, title: 'Nav 4'),
          TabItem(icon: Icons.person, title: 'Nav 5'),
        ],
        initialActiveIndex: 2,//optional, default as 0
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
