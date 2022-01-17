import 'package:doctor_app/ui/apps/ecommerce/account/tab_account.dart';
import 'package:doctor_app/ui/apps/ecommerce/home/tab_home.dart';
import 'package:doctor_app/ui/apps/ecommerce/shopping_cart/tab_shopping_cart.dart';
import 'package:doctor_app/ui/apps/ecommerce/wishlist/tab_wishlist.dart';
import 'package:flutter/material.dart';
import 'package:doctor_app/config/apps/ecommerce/constant.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  late PageController _pageController;
  int _currentIndex = 0;

  // Pages if you click bottom navigation
  final List<Widget> _contentPages = <Widget>[
    TabHomePage(),
    TabWishlistPage(),
    TabShoppingCartPage(),
    TabAccountPage(),
  ];

  @override
  void initState() {
    // set initial pages for navigation to home page
    _pageController = PageController(initialPage: 0);
    _pageController.addListener(_handleTabSelection);
    super.initState();
  }

  void _handleTabSelection() {
    setState(() {
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          // this unfocus is to prevent show keyboard in the wishlist page when focus on search text field
          FocusScope.of(context).unfocus();
        },
        selectedFontSize: 8,
        unselectedFontSize: 8,
        iconSize: 28,
        items: [
          BottomNavigationBarItem(
            // ignore: deprecated_member_use
              title:Text('Home', style: TextStyle(
                  color: _currentIndex == 0 ? PRIMARY_COLOR : CHARCOAL,
                  fontWeight: FontWeight.bold
              )),
              icon: Icon(
                  Icons.home,
                  color: _currentIndex == 0 ? PRIMARY_COLOR : CHARCOAL
              )
          ),
          BottomNavigationBarItem(
            // ignore: deprecated_member_use
              title:Text('Wishlist', style: TextStyle(
                  color: _currentIndex == 1 ? ASSENT_COLOR : CHARCOAL,
                  fontWeight: FontWeight.bold
              )),
              icon: Icon(
                  Icons.favorite,
                  color: _currentIndex == 1 ? ASSENT_COLOR : CHARCOAL
              )
          ),
          BottomNavigationBarItem(
            // ignore: deprecated_member_use
              title:Text('Cart', style: TextStyle(
                  color: _currentIndex == 2 ? PRIMARY_COLOR : CHARCOAL,
                  fontWeight: FontWeight.bold
              )),
              icon: Icon(
                  Icons.shopping_cart,
                  color: _currentIndex == 2 ? PRIMARY_COLOR : CHARCOAL
              )
          ),
          BottomNavigationBarItem(
            // ignore: deprecated_member_use
              title:Text('Account', style: TextStyle(
                  color: _currentIndex == 3 ? PRIMARY_COLOR : CHARCOAL,
                  fontWeight: FontWeight.bold
              )),
              icon: Icon(
                  Icons.person_outline,
                  color: _currentIndex == 3 ? PRIMARY_COLOR : CHARCOAL
              )
          ),
        ],
      ),
    );
  }
}
