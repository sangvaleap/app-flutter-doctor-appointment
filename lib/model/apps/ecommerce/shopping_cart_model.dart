import 'package:doctor_app/config/apps/ecommerce/constant.dart';

class ShoppingCartModel {
  late int id;
  late String name;
  late String image;
  late double price;
  late int qty;

  ShoppingCartModel(
      {required this.id,
      required this.image,
      required this.name,
      required this.price,
      required this.qty});

  void setQty(int i) {
    if (i < 1) {
      qty = 1;
    } else {
      qty = i;
    }
  }
}

List<ShoppingCartModel> shoppingCartData = [
  ShoppingCartModel(
    id: 1,
    name:
        'BARDI Smart Light Bulb Lamp Bohlam LED WIFI RGBWW 12W 12 watt Home IoT',
    image: GLOBAL_URL + '/assets/images/apps/ecommerce/product/58.jpg',
    price: 8.6,
    qty: 2,
  ),
  ShoppingCartModel(
    id: 2,
    name:
        'BARDI Smart UNIVERSAL IR REMOTE Wifi Wireless IoT For Home Automation',
    image: GLOBAL_URL + '/assets/images/apps/ecommerce/product/60.jpg',
    price: 11.5,
    qty: 1,
  ),
  ShoppingCartModel(
    id: 3,
    name: 'BARDI Smart PLUG WiFi Wireless Colokan - IoT Smart Home',
    image: GLOBAL_URL + '/assets/images/apps/ecommerce/product/69.jpg',
    price: 11.46,
    qty: 1,
  ),
];
