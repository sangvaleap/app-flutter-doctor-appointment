import 'package:doctor_app/config/apps/ecommerce/constant.dart';

class CategoryTrendingProductModel {
  late int id;
  late String name;
  late double price;
  late String image;
  late double rating;
  late int review;

  CategoryTrendingProductModel(
      {required this.id,
      required this.name,
      required this.price,
      required this.image,
      required this.rating,
      required this.review});
}

List<CategoryTrendingProductModel> categoryTrendingProductData = [
  CategoryTrendingProductModel(
    id: 1,
    name: 'IWO 8 Smart Watch Apple iWatch Mirror For Android iPhone',
    price: 62,
    image: GLOBAL_URL + '/assets/images/apps/ecommerce/product/46.jpg',
    rating: 5,
    review: 42,
  ),
  CategoryTrendingProductModel(
    id: 2,
    name: 'ipad Pro 2020 11-inch 128GB Wi-Fi Only - Silver',
    price: 866,
    image: GLOBAL_URL + '/assets/images/apps/ecommerce/product/49.jpg',
    rating: 5,
    review: 22,
  ),
  CategoryTrendingProductModel(
    id: 3,
    name: 'iphone 7 Plus / 7+ 128GB',
    price: 433,
    image: GLOBAL_URL + '/assets/images/apps/ecommerce/product/28.jpg',
    rating: 5,
    review: 129,
  ),
  CategoryTrendingProductModel(
    id: 4,
    name: 'New imac 2017 MNEA2 5K retina /3,5GHZ/i5/8GB/1TB/RP575',
    price: 1643,
    image: GLOBAL_URL + '/assets/images/apps/ecommerce/product/44.jpg',
    rating: 5,
    review: 2,
  ),
  CategoryTrendingProductModel(
    id: 5,
    name:
        'APPLE AIRPODS PRO WITH WIRELESS CHARGING ORIGINAL - AIRPOD - Free Silicone',
    price: 219,
    image: GLOBAL_URL + '/assets/images/apps/ecommerce/product/61.jpg',
    rating: 5,
    review: 934,
  ),
  CategoryTrendingProductModel(
    id: 6,
    name: 'Original 100% 60W Magsafe 1 Power Adapter Charger Macbook Pro - Air',
    price: 22.66,
    image: GLOBAL_URL + '/assets/images/apps/ecommerce/product/42.jpg',
    rating: 5,
    review: 131,
  ),
  CategoryTrendingProductModel(
    id: 7,
    name: 'NEW Original Apple TV 4K 64GB 5th Generation',
    price: 261,
    image: GLOBAL_URL + '/assets/images/apps/ecommerce/product/29.jpg',
    rating: 5,
    review: 98,
  ),
  CategoryTrendingProductModel(
      id: 8,
      name: 'Apple Pencil 1 - Original Apple Garansi Resmi Inter',
      price: 99,
      image: GLOBAL_URL + '/assets/images/apps/ecommerce/product/70.jpg',
      rating: 5,
      review: 8)
];
