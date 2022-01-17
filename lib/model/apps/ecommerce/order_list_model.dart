import 'package:doctor_app/config/apps/ecommerce/constant.dart';

class OrderListModel {
  late int id;
  late String invoice;
  late String date;
  late String status;
  late String name;
  late String image;
  late double payment;

  OrderListModel(
      {required this.id,
      required this.invoice,
      required this.date,
      required this.status,
      required this.name,
      required this.image,
      required this.payment});
}

List<OrderListModel> orderListData = [
  OrderListModel(
    id: 1,
    invoice: 'INV385739475',
    date: '12 August 2020',
    status: 'On Process',
    name: 'Logitech G502 Hero / Mouse Logitech G 502 Hero Original',
    image: GLOBAL_URL + '/assets/images/apps/ecommerce/product/4.jpg',
    payment: 80,
  ),
  OrderListModel(
    id: 2,
    invoice: 'INV385714262',
    date: '3 September 2020',
    status: 'Order Completed',
    name: 'Delta Boots Import 8 Inch',
    image: GLOBAL_URL + '/assets/images/apps/ecommerce/product/25.jpg',
    payment: 36,
  ),
  OrderListModel(
    id: 3,
    invoice: 'INV385776588',
    date: '9 September 2020',
    status: 'On Delivery',
    name: 'Spatula Set Stainless Kitchen Tools',
    image: GLOBAL_URL + '/assets/images/apps/ecommerce/product/34.jpg',
    payment: 9.6,
  ),
  OrderListModel(
    id: 4,
    invoice: 'INV385798021',
    date: '13 September 2020',
    status: 'Waiting for payment',
    name: 'Original 100% 60W Magsafe 1 Power Adapter Charger Macbook Pro - Air',
    image: GLOBAL_URL + '/assets/images/apps/ecommerce/product/42.jpg',
    payment: 38,
  ),
];
