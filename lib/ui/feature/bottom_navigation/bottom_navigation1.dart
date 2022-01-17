import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:doctor_app/ui/reusable/nav_page1.dart';
import 'package:doctor_app/ui/reusable/nav_page2.dart';
import 'package:doctor_app/ui/reusable/nav_page3.dart';
import 'package:doctor_app/ui/reusable/nav_page4.dart';
import 'package:flutter/material.dart';

class BottomNavigation1Page extends StatefulWidget {
  @override
  _BottomNavigation1PageState createState() => _BottomNavigation1PageState();
}

class _BottomNavigation1PageState extends State<BottomNavigation1Page> {
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
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _currentIndex,
          onTap: (value) {
            _currentIndex = value;
            _pageController.jumpToPage(value);

            // this unfocus is to prevent show keyboard in the text field
            FocusScope.of(context).unfocus();
          },
          selectedFontSize: 8,
          unselectedFontSize: 8,
          iconSize: 28,
          items: [
            BottomNavigationBarItem(
              // ignore: deprecated_member_use
                title:Text('Nav 1', style: TextStyle(
                    color: _currentIndex == 0 ? _color1 : _color2,
                    fontWeight: FontWeight.bold
                )),
                icon: Icon(
                    Icons.home,
                    color: _currentIndex == 0 ? _color1 : _color2
                )
            ),
            BottomNavigationBarItem(
              // ignore: deprecated_member_use
                title:Text('Nav 2', style: TextStyle(
                    color: _currentIndex == 1 ? _color3 : _color2,
                    fontWeight: FontWeight.bold
                )),
                icon: Icon(
                    Icons.favorite,
                    color: _currentIndex == 1 ? _color3 : _color2
                )
            ),
            BottomNavigationBarItem(
              // ignore: deprecated_member_use
                title:Text('Nav 3', style: TextStyle(
                    color: _currentIndex == 2 ? _color1 : _color2,
                    fontWeight: FontWeight.bold
                )),
                icon: Icon(
                    Icons.notifications,
                    color: _currentIndex == 2 ? _color1 : _color2
                )
            ),
            BottomNavigationBarItem(
              // ignore: deprecated_member_use
                title:Text('Nav 4', style: TextStyle(
                    color: _currentIndex == 3 ? _color1 : _color2,
                    fontWeight: FontWeight.bold
                )),
                icon: Icon(
                    Icons.person_outline,
                    color: _currentIndex == 3 ? _color1 : _color2
                )
            ),
          ],
        )
    );
  }
}
