/*
If you run this code on profile mode / release mode with Flutter 2.5 above :
shape: CircularNotchedRectangle(),
The shape is strange, in Flutter 2.2.2 the shape is good
We still don't know what cause that, so we commented the shape code
*/

import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:doctor_app/ui/reusable/nav_page1.dart';
import 'package:doctor_app/ui/reusable/nav_page2.dart';
import 'package:doctor_app/ui/reusable/nav_page3.dart';
import 'package:doctor_app/ui/reusable/nav_page4.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class BottomNavigation2Page extends StatefulWidget {
  @override
  _BottomNavigation2PageState createState() => _BottomNavigation2PageState();
}

class _BottomNavigation2PageState extends State<BottomNavigation2Page> {
  // initialize global widget
  final _globalWidget = GlobalWidget();

  Color _color1 = Color(0xFF0181cc);
  Color _color2 = Color(0xFF515151);
  Color _color3 = Color(0xFFe75f3f);

  late PageController _pageController;
  int _currentIndex = 0;

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
        bottomNavigationBar: BottomAppBar(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: (){
                    _tapNav(0);
                  },
                  child: Container(
                    padding: EdgeInsets.all(16),
                    child: Icon(Icons.home, color: _currentIndex == 0 ? _color1 : _color2)
                  )
              ),
              GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: (){
                    _tapNav(1);
                  },
                  child: Container(
                    padding: EdgeInsets.all(16),
                    margin: EdgeInsets.only(right: 32),
                    child: Icon(Icons.favorite, color: _currentIndex == 1 ? _color3 : _color2)
                  )
              ),
              GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: (){
                    _tapNav(2);
                  },
                  child: Container(
                    padding: EdgeInsets.all(16),
                    margin: EdgeInsets.only(left: 32),
                    child: Icon(Icons.notifications, color: _currentIndex == 2 ? _color1 : _color2)
                  )
              ),
              GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: (){
                    _tapNav(3);
                  },
                  child: Container(
                    padding: EdgeInsets.all(16),
                    child: Icon(Icons.person, color: _currentIndex == 3 ? _color1 : _color2)
                  )
              ),
            ],
          ),
          //shape: CircularNotchedRectangle(),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Fluttertoast.showToast(msg: 'FAB Pressed', toastLength: Toast.LENGTH_SHORT);
          },
          child: Icon(Icons.add),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  void _tapNav(index){
    _currentIndex = index;
    _pageController.jumpToPage(index);

    // this unfocus is to prevent show keyboard in the text field
    FocusScope.of(context).unfocus();
  }
}
