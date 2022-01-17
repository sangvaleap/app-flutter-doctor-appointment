import 'package:doctor_app/config/apps/ecommerce/constant.dart';

class CategoryAllProductModel {
  late int id;
  late String name;
  late double price;
  late String image;
  late double rating;
  late int review;
  late int sale;
  late String location;

  CategoryAllProductModel(
      {required this.id,
      required this.name,
      required this.price,
      required this.image,
      required this.rating,
      required this.review,
      required this.sale,
      required this.location});
}

List<CategoryAllProductModel> categoryAllProductData = [
  CategoryAllProductModel(
      id: 1,
      name: 'New imac 2017 MNEA2 5K retina /3,5GHZ/i5/8GB/1TB/RP575',
      price: 1643,
      image: GLOBAL_URL + '/assets/images/apps/ecommerce/product/44.jpg',
      rating: 5,
      review: 2,
      sale: 3,
      location: 'Brooklyn'),
  CategoryAllProductModel(
      id: 2,
      name: 'iPhone SE 2020',
      price: 399,
      image: GLOBAL_URL + '/assets/images/apps/ecommerce/product/78.png',
      rating: 5,
      review: 219,
      sale: 23,
      location: 'Brooklyn'),
  CategoryAllProductModel(
      id: 3,
      name: 'IWO 8 Smart Watch Apple iWatch Mirror For Android iPhone',
      price: 62,
      image: GLOBAL_URL + '/assets/images/apps/ecommerce/product/46.jpg',
      rating: 5,
      review: 42,
      sale: 69,
      location: 'Brooklyn'),
  CategoryAllProductModel(
      id: 4,
      name: 'ipad Pro 2020 11-inch 128GB Wi-Fi Only - Silver',
      price: 866,
      image: GLOBAL_URL + '/assets/images/apps/ecommerce/product/49.jpg',
      rating: 5,
      review: 22,
      sale: 468,
      location: 'Brooklyn'),
  CategoryAllProductModel(
      id: 5,
      name:
          'APPLE AIRPODS PRO WITH WIRELESS CHARGING ORIGINAL - AIRPOD - Free Silicone',
      price: 219,
      image: GLOBAL_URL + '/assets/images/apps/ecommerce/product/61.jpg',
      rating: 5,
      review: 934,
      sale: 1881,
      location: 'Brooklyn'),
  CategoryAllProductModel(
      id: 6,
      name:
          'Original 100% 60W Magsafe 1 Power Adapter Charger Macbook Pro - Air',
      price: 22.66,
      image: GLOBAL_URL + '/assets/images/apps/ecommerce/product/42.jpg',
      rating: 5,
      review: 131,
      sale: 466,
      location: 'Brooklyn'),
  CategoryAllProductModel(
      id: 7,
      name: 'iPod Touch 2019 7th Generation - 32GB SpaceGrey MVHW2',
      price: 242,
      image: GLOBAL_URL + '/assets/images/apps/ecommerce/product/79.jpg',
      rating: 5,
      review: 11,
      sale: 17,
      location: 'Brooklyn'),
  CategoryAllProductModel(
      id: 8,
      name: 'NEW Apple Magic Trackpad 2 Space Grey MRMF2 Gray',
      price: 189,
      image: GLOBAL_URL + '/assets/images/apps/ecommerce/product/73.jpg',
      rating: 5,
      review: 36,
      sale: 112,
      location: 'Brooklyn'),
  CategoryAllProductModel(
      id: 9,
      name: 'NEW Original Apple TV 4K 64GB 5th Generation',
      price: 261,
      image: GLOBAL_URL + '/assets/images/apps/ecommerce/product/29.jpg',
      rating: 5,
      review: 98,
      sale: 23,
      location: 'Brooklyn'),
  CategoryAllProductModel(
      id: 10,
      name:
          'Mac Mini 3.0GHz 6-Core Processor with Turbo Boost up to 4.1GHz 512GB Storage',
      price: 1099,
      image: GLOBAL_URL + '/assets/images/apps/ecommerce/product/77.jpg',
      rating: 5,
      review: 78,
      sale: 132,
      location: 'Brooklyn')
];
