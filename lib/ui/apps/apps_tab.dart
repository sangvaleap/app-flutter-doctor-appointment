import 'package:doctor_app/ui/apps/ecommerce/ecommerce_list.dart';
import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:doctor_app/ui/apps/food_delivery/food_delivery_list.dart';
import 'package:flutter/material.dart';

class AppsTabPage extends StatefulWidget {
  @override
  _AppsTabPageState createState() => _AppsTabPageState();
}

class _AppsTabPageState extends State<AppsTabPage> {
  // initialize global widget
  final _globalWidget = GlobalWidget();

  int number = 1;

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
    return Tab(
      child: ListView(
        padding: EdgeInsets.fromLTRB(24, 16, 24, 16),
        children: [
          _globalWidget.screenTabList(
              context: context,
              id: number++,
              icon: Icons.restaurant,
              title: 'Food Delivery - Multi Merchants',
              desc: 'UI Kit for food delivery',
              page: FoodDeliveryListPage()
          ),
          _globalWidget.screenTabList(
              context: context,
              id: number++,
              icon: Icons.shopping_cart,
              title: 'E-Commerce',
              desc: 'UI Kit for online shop',
              page: EcommerceListPage()
          ),
        ],
      ),
    );
  }
}
