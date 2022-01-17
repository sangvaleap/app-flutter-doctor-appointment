import 'package:doctor_app/config/apps/ecommerce/constant.dart';

class CategoryNewProductModel {
  late int id;
  late String name;
  late double price;
  late String image;
  late double rating;
  late int review;

  CategoryNewProductModel(
      {required this.id,
      required this.name,
      required this.price,
      required this.image,
      required this.rating,
      required this.review});
}

List<CategoryNewProductModel> categoryNewProductData = [
  CategoryNewProductModel(
      id: 1,
      name:
          'Converter APPLE USB-C To 3.5 mm Headphone Jack Adapter New Ipad Pro',
      price: 10,
      image: GLOBAL_URL + '/assets/images/apps/ecommerce/product/71.jpg',
      rating: 5,
      review: 54),
  CategoryNewProductModel(
      id: 2,
      name:
          'Charger adapter New Macbook Pro Retina 13 inch Apple 2017 2018 61w ori',
      price: 46,
      image: GLOBAL_URL + '/assets/images/apps/ecommerce/product/72.jpg',
      rating: 5,
      review: 4),
  CategoryNewProductModel(
      id: 3,
      name: 'NEW Apple Magic Trackpad 2 Space Grey MRMF2 Gray',
      price: 189,
      image: GLOBAL_URL + '/assets/images/apps/ecommerce/product/73.jpg',
      rating: 5,
      review: 24),
  CategoryNewProductModel(
      id: 4,
      name: 'Apple iMac 2020 4K 21.5" inch i3 3.6GHz /8GB/256GB MHK23',
      price: 1369,
      image: GLOBAL_URL + '/assets/images/apps/ecommerce/product/74.jpg',
      rating: 0,
      review: 0),
  CategoryNewProductModel(
      id: 5,
      name: 'Leather Sleeve for 13-inch MacBook Air and MacBook Pro - Black',
      price: 179,
      image: GLOBAL_URL + '/assets/images/apps/ecommerce/product/75.jpg',
      rating: 5,
      review: 120),
  CategoryNewProductModel(
      id: 6,
      name: 'Magic Mouse 2 - Space Gray',
      price: 99,
      image: GLOBAL_URL + '/assets/images/apps/ecommerce/product/76.jpg',
      rating: 5,
      review: 174),
  CategoryNewProductModel(
      id: 7,
      name:
          'Mac Mini 3.0GHz 6-Core Processor with Turbo Boost up to 4.1GHz 512GB Storage',
      price: 1099,
      image: GLOBAL_URL + '/assets/images/apps/ecommerce/product/77.jpg',
      rating: 5,
      review: 78),
  CategoryNewProductModel(
      id: 8,
      name: 'iPhone SE 2020',
      price: 399,
      image: GLOBAL_URL + '/assets/images/apps/ecommerce/product/78.png',
      rating: 5,
      review: 219),
];
