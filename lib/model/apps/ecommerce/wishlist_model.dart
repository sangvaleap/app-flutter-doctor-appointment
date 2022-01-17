import 'package:doctor_app/config/apps/ecommerce/constant.dart';

class WishlistModel {
  late int id;
  late String name;
  late double price;
  late String image;
  late double rating;
  late int review;
  late int sale;
  late int stock;
  late String location;

  WishlistModel(
      {required this.id,
      required this.name,
      required this.price,
      required this.image,
      required this.rating,
      required this.review,
      required this.sale,
      required this.stock,
      required this.location});
}

List<WishlistModel> wishlistData = [
  WishlistModel(
      id: 1,
      name: 'IWO 8 Smart Watch Apple iWatch Mirror For Android iPhone',
      price: 62,
      image: GLOBAL_URL + '/assets/images/apps/ecommerce/product/46.jpg',
      rating: 5,
      review: 42,
      sale: 69,
      stock: 5,
      location: 'Brooklyn'),
  WishlistModel(
      id: 2,
      name: 'Asus Rog Phone 3 Rogphone III Ram 12Gb 512Gb Snapdragon 865+ Plus',
      price: 1152,
      image: GLOBAL_URL + '/assets/images/apps/ecommerce/product/48.jpg',
      rating: 5,
      review: 1,
      sale: 2,
      stock: 22,
      location: 'Brooklyn'),
  WishlistModel(
      id: 3,
      name: 'BARDI Smart PLUG WiFi Wireless Colokan - IoT Smart Home',
      price: 11.46,
      image: GLOBAL_URL + '/assets/images/apps/ecommerce/product/69.jpg',
      rating: 5,
      review: 1062,
      sale: 4797,
      stock: 0,
      location: 'Brooklyn'),
  WishlistModel(
      id: 4,
      name: 'ipad Pro 2020 11-inch 128GB Wi-Fi Only - Silver',
      price: 866,
      image: GLOBAL_URL + '/assets/images/apps/ecommerce/product/49.jpg',
      rating: 5,
      review: 22,
      sale: 468,
      stock: 25,
      location: 'Brooklyn'),
  WishlistModel(
    id: 5,
    name: 'Fimi X8 SE Black',
    price: 567,
    image: GLOBAL_URL + '/assets/images/apps/ecommerce/product/26.jpg',
    rating: 5,
    review: 63,
    sale: 115,
    stock: 0,
    location: 'Brooklyn',
  ),
  WishlistModel(
      id: 6,
      name:
          'Xiaomi Air Purifier 3 Mijia OLED Touch Sterilization Air Ionizer - 3',
      price: 139,
      image: GLOBAL_URL + '/assets/images/apps/ecommerce/product/33.jpg',
      rating: 5,
      review: 275,
      sale: 1055,
      stock: 4,
      location: 'Brooklyn'),
  WishlistModel(
      id: 7,
      name: 'Delta Boots Import 8 Inch',
      price: 18.3,
      image: GLOBAL_URL + '/assets/images/apps/ecommerce/product/25.jpg',
      rating: 5,
      review: 212,
      sale: 735,
      stock: 55,
      location: 'Brooklyn')
];
