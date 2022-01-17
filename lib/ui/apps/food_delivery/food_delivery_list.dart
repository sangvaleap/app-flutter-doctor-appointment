import 'package:doctor_app/config/constant.dart';
import 'package:doctor_app/model/apps/food_delivery/coupon_model.dart';
import 'package:doctor_app/ui/apps/food_delivery/add_address.dart';
import 'package:doctor_app/ui/apps/food_delivery/cart.dart';
import 'package:doctor_app/ui/apps/food_delivery/category_menu.dart';
import 'package:doctor_app/ui/apps/food_delivery/coupon.dart';
import 'package:doctor_app/ui/apps/food_delivery/coupon_detail.dart';
import 'package:doctor_app/ui/apps/food_delivery/detail_food.dart';
import 'package:doctor_app/ui/apps/food_delivery/detail_restaurant.dart';
import 'package:doctor_app/ui/apps/food_delivery/favorites_food_list.dart';
import 'package:doctor_app/ui/apps/food_delivery/order_detail.dart';
import 'package:doctor_app/ui/apps/food_delivery/order_history.dart';
import 'package:doctor_app/ui/apps/food_delivery/order_status.dart';
import 'package:doctor_app/ui/apps/food_delivery/restaurant_information.dart';
import 'package:doctor_app/ui/apps/food_delivery/search_address.dart';
import 'package:doctor_app/ui/apps/food_delivery/search_restaurant.dart';
import 'package:doctor_app/ui/apps/food_delivery/user_profile.dart';
import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:doctor_app/ui/apps/food_delivery/food_list.dart';
import 'package:doctor_app/ui/apps/food_delivery/home.dart';
import 'package:doctor_app/ui/apps/food_delivery/restaurant_list.dart';
import 'package:doctor_app/ui/apps/food_delivery/onboarding.dart';
import 'package:doctor_app/ui/apps/food_delivery/splash_screen.dart';
import 'package:flutter/material.dart';

class FoodDeliveryListPage extends StatefulWidget {
  @override
  _FoodDeliveryListPageState createState() => _FoodDeliveryListPageState();
}

class _FoodDeliveryListPageState extends State<FoodDeliveryListPage> {
  // initialize global widget
  final _globalWidget = GlobalWidget();

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
        backgroundColor: Colors.white,
        appBar: _globalWidget.globalAppBar(),
        body: ListView(
          padding: EdgeInsets.fromLTRB(24, 24, 24, 16),
          children: [
            Container(
              child: Text('Food Delivery - Multi Merchants', style: TextStyle(
                  fontSize: 18, color: BLACK21, fontWeight: FontWeight.w500
              )),
            ),
            Container(
              margin: EdgeInsets.only(top: 24),
              child: Row(
                children: [
                  Flexible(
                      flex:5,
                      child: Container(
                        child: Text('Food delivery apps used for food delivery services.', style: TextStyle(
                            fontSize: 15, color: BLACK77,letterSpacing: 0.5
                        )),
                      )
                  ),
                  Flexible(
                      flex: 2,
                      child: Container(
                          alignment: Alignment.center,
                          child: Icon(Icons.restaurant, size: 50, color: SOFT_BLUE))
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 48),
              child: Text('Screen List', style: TextStyle(
                  fontSize: 18, color: BLACK21, fontWeight: FontWeight.w500
              )),
            ),
            SizedBox(height: 18),
            _globalWidget.screenDetailList(context: context, title: 'Splash Screen', page: SplashScreenPage()),
            _globalWidget.screenDetailList(context: context, title: 'On Boarding', page: OnBoardingPage()),
            _globalWidget.screenDetailList(context: context, title: 'Home', page: HomePage()),
            _globalWidget.screenDetailList(context: context, title: 'User Profile', page: UserProfilePage()),
            _globalWidget.screenDetailList(context: context, title: 'Category Menu', page: CategoryMenuPage(title: 'Nearby')),
            _globalWidget.screenDetailList(context: context, title: 'Restaurant List', page: RestaurantListPage(title: 'Food Around You')),
            _globalWidget.screenDetailList(context: context, title: 'Detail Restaurant', page: DetailRestaurantPage()),
            _globalWidget.screenDetailList(context: context, title: 'Restaurant Information', page: RestaurantInformationPage()),
            _globalWidget.screenDetailList(context: context, title: 'Food List', page: FoodListPage(title: 'Food on Promotion')),
            _globalWidget.screenDetailList(context: context, title: 'Favorites Food List', page: FavoritesFoodListPage()),
            _globalWidget.screenDetailList(context: context, title: 'Detail Food', page: DetailFoodPage()),
            _globalWidget.screenDetailList(context: context, title: 'Cart', page: CartPage()),
            _globalWidget.screenDetailList(context: context, title: 'Order Status', page: OrderStatusPage()),
            _globalWidget.screenDetailList(context: context, title: 'Coupon', page: CouponPage()),
            _globalWidget.screenDetailList(context: context, title: 'Coupon Detail', page: CouponDetailPage(couponData: CouponModel(id: 999, name: "WEEKEND45", day: "4", term: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque tortor tortor, ultrices id scelerisque a, elementum id elit. Maecenas feugiat tellus sed augue malesuada, id tempus ex sodales. Nulla at cursus eros. Integer porttitor ac ipsum quis sollicitudin. Sed mollis sapien massa, et dignissim turpis vulputate et. Ut ac odio porta, blandit velit in, pharetra lacus. Integer aliquam dolor nec augue porttitor hendrerit. Vestibulum aliquam urna finibus, luctus felis nec, hendrerit augue. Fusce eget lacinia leo. Vivamus porttitor, lacus eget rutrum tempus, odio magna tincidunt elit, ut vulputate nibh velit eu lectus. Morbi felis mi, efficitur sed diam in, elementum ullamcorper leo. Ut bibendum lorem consectetur pellentesque gravida. Sed est orci, consectetur id nunc quis, volutpat consectetur nisi.\n\nDonec est neque, accumsan sit amet imperdiet porta, suscipit eu ex. Phasellus lobortis mollis pharetra. Donec maximus rhoncus elit, sed pellentesque justo pretium vel. Integer vitae facilisis lectus. Suspendisse potenti. Mauris iaculis placerat feugiat. Integer commodo dui sit amet finibus congue. Nulla egestas lacus vel elit aliquet, at pulvinar ex venenatis. Vivamus eget maximus libero, quis vulputate diam. Pellentesque vel justo vel lectus viverra aliquet ut eget metus.\n\nVivamus malesuada velit pretium laoreet pulvinar. Duis non dignissim sapien, vitae viverra purus. Curabitur a gravida mauris. Nullam turpis odio, ultricies sed ultricies non, sodales eget purus. Donec pulvinar bibendum metus vitae ornare. Phasellus eleifend orci eget blandit sollicitudin. Sed sed urna in magna dignissim eleifend.\n\nVestibulum vitae erat maximus, laoreet ex quis, laoreet nunc. Sed porttitor massa eget cursus rhoncus. Suspendisse et tellus et enim ullamcorper semper eget in nisl. Nam metus mauris, sollicitudin in venenatis at, pretium at nulla. Sed a accumsan dui. Quisque fermentum mollis erat, ac fringilla eros auctor eu. Donec placerat mi ut sem ullamcorper tempor. Pellentesque ut nulla sollicitudin, tempus arcu quis, vulputate dolor. Sed ultrices cursus nisl, nec tempor neque tempus at. Pellentesque nec dolor faucibus, porttitor quam sed, vehicula est. Vestibulum placerat placerat neque eu posuere. Pellentesque id mauris hendrerit, placerat lacus id, auctor eros. Praesent vestibulum mattis est, non facilisis urna accumsan et. Vestibulum scelerisque ornare sapien, nec blandit purus rhoncus mollis. Sed faucibus, augue consequat rhoncus rutrum, sapien mauris dictum quam, nec tempus orci urna vitae lorem. Curabitur sit amet nisl et lacus fringilla pulvinar."))),
            _globalWidget.screenDetailList(context: context, title: 'Search Restaurant', page: SearchRestaurantPage()),
            _globalWidget.screenDetailList(context: context, title: 'Search Address', page: SearchAddressPage()),
            _globalWidget.screenDetailList(context: context, title: 'Add Address', page: AddAddressPage(fromList: true)),
            _globalWidget.screenDetailList(context: context, title: 'Order History', page: OrderHistoryPage()),
            _globalWidget.screenDetailList(context: context, title: 'Order Detail', page: OrderDetailPage()),
          ],
        )
    );
  }
}
