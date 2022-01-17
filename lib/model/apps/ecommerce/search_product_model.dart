import 'package:doctor_app/config/apps/ecommerce/constant.dart';

class SearchProductModel {
  late int id;
  late String name;
  late double price;
  late String image;
  late double rating;
  late int review;
  late int sale;
  late String location;

  SearchProductModel(
      {required this.id,
      required this.name,
      required this.price,
      required this.image,
      required this.rating,
      required this.review,
      required this.sale,
      required this.location});
}

List<SearchProductModel> searchProductData = [
  SearchProductModel(
      id: 1,
      name: 'iphone 7 Plus / 7+ 128GB',
      price: 433,
      image: GLOBAL_URL + '/assets/images/apps/ecommerce/product/28.jpg',
      rating: 5,
      review: 129,
      sale: 310,
      location: 'Brooklyn'),
  SearchProductModel(
      id: 2,
      name: 'IWO 8 Smart Watch Apple iWatch Mirror For Android iPhone',
      price: 62,
      image: GLOBAL_URL + '/assets/images/apps/ecommerce/product/46.jpg',
      rating: 5,
      review: 42,
      sale: 69,
      location: 'Brooklyn'),
  SearchProductModel(
      id: 3,
      name: 'New imac 2017 MNEA2 5K retina /3,5GHZ/i5/8GB/1TB/RP575',
      price: 1643,
      image: GLOBAL_URL + '/assets/images/apps/ecommerce/product/44.jpg',
      rating: 5,
      review: 2,
      sale: 3,
      location: 'Brooklyn'),
  SearchProductModel(
      id: 4,
      name:
          'APPLE AIRPODS PRO WITH WIRELESS CHARGING ORIGINAL - AIRPOD - Free Silicone',
      price: 219,
      image: GLOBAL_URL + '/assets/images/apps/ecommerce/product/61.jpg',
      rating: 5,
      review: 934,
      sale: 1881,
      location: 'Brooklyn'),
  SearchProductModel(
      id: 5,
      name: 'NEW Apple Magic Trackpad 2 Space Grey MRMF2 Gray',
      price: 189,
      image: GLOBAL_URL + '/assets/images/apps/ecommerce/product/73.jpg',
      rating: 5,
      review: 36,
      sale: 112,
      location: 'Brooklyn'),
  SearchProductModel(
      id: 6,
      name: 'NEW Original Apple TV 4K 64GB 5th Generation',
      price: 261,
      image: GLOBAL_URL + '/assets/images/apps/ecommerce/product/29.jpg',
      rating: 5,
      review: 98,
      sale: 23,
      location: 'Brooklyn'),
  SearchProductModel(
      id: 7,
      name: 'Asus Rog Phone 3 Rogphone III Ram 12Gb 512Gb Snapdragon 865+ Plus',
      price: 1152,
      image: GLOBAL_URL + '/assets/images/apps/ecommerce/product/48.jpg',
      rating: 5,
      review: 1,
      sale: 2,
      location: 'Brooklyn'),
  SearchProductModel(
      id: 8,
      name: 'Garmin Instinct Tactical - Black',
      price: 290,
      image: GLOBAL_URL + '/assets/images/apps/ecommerce/product/47.jpg',
      rating: 5,
      review: 13,
      sale: 23,
      location: 'Brooklyn'),
  SearchProductModel(
      id: 9,
      name: 'XBOX 360 SLIM 500 GB RGH FULL GAME & KINECT',
      price: 183,
      image: GLOBAL_URL + '/assets/images/apps/ecommerce/product/51.jpg',
      rating: 4,
      review: 3,
      sale: 9,
      location: 'Brooklyn'),
  SearchProductModel(
      id: 10,
      name: 'TP-Link TL-WR840N (V4.0) : 300Mbps TPLink WiFi Wireless N Router',
      price: 11,
      image: GLOBAL_URL + '/assets/images/apps/ecommerce/product/53.jpg',
      rating: 5,
      review: 1075,
      sale: 3247,
      location: 'Brooklyn'),
  SearchProductModel(
      id: 11,
      name:
          'gopro hero 8 black garansi resmi TAM / go pro hero8 black / 8black',
      price: 333,
      image: GLOBAL_URL + '/assets/images/apps/ecommerce/product/12.jpg',
      rating: 5,
      review: 13,
      sale: 33,
      location: 'Brooklyn'),
  SearchProductModel(
      id: 12,
      name: 'Leather Sleeve for 13-inch MacBook Air and MacBook Pro - Black',
      price: 179,
      image: GLOBAL_URL + '/assets/images/apps/ecommerce/product/75.jpg',
      rating: 5,
      review: 120,
      sale: 131,
      location: 'Brooklyn'),
  SearchProductModel(
      id: 13,
      name: 'Apple iMac 2020 4K 21.5" inch i3 3.6GHz /8GB/256GB MHK23',
      price: 1369,
      image: GLOBAL_URL + '/assets/images/apps/ecommerce/product/74.jpg',
      rating: 0,
      review: 0,
      sale: 2,
      location: 'Brooklyn'),
  SearchProductModel(
    id: 14,
    name: 'Fimi X8 SE Black',
    price: 567,
    image: GLOBAL_URL + '/assets/images/apps/ecommerce/product/26.jpg',
    rating: 5,
    review: 63,
    sale: 115,
    location: 'Brooklyn',
  ),
  SearchProductModel(
      id: 15,
      name: 'SAMSUNG GALAXY S20 PLUS RAM 8/128GB',
      price: 751,
      image: GLOBAL_URL + '/assets/images/apps/ecommerce/product/30.jpg',
      rating: 5,
      review: 14,
      sale: 17,
      location: 'Brooklyn'),
  SearchProductModel(
      id: 16,
      name:
          'BARDI Smart Light Bulb Lamp Bohlam LED WIFI RGBWW 12W 12 watt Home IoT',
      price: 8.6,
      image: GLOBAL_URL + '/assets/images/apps/ecommerce/product/58.jpg',
      rating: 5,
      review: 354,
      sale: 540,
      location: 'Brooklyn'),
  SearchProductModel(
      id: 17,
      name:
          'KABEL DATA TYPE-C TO TYPE-C BASEUS HALO DATA CABLE PD 2.0 60W - 0.5 M',
      price: 3,
      image: GLOBAL_URL + '/assets/images/apps/ecommerce/product/35.jpg',
      rating: 5,
      review: 636,
      sale: 2087,
      location: 'Brooklyn'),
  SearchProductModel(
      id: 18,
      name:
          'gopro hero 8 black garansi resmi TAM / go pro hero8 black / 8black',
      price: 333,
      image: GLOBAL_URL + '/assets/images/apps/ecommerce/product/12.jpg',
      rating: 5,
      review: 13,
      sale: 33,
      location: 'Brooklyn'),
  SearchProductModel(
      id: 19,
      name:
          'Samyang Noodle Wholesaler 1 Box (40 Pcs) Hot Spicy Chicken - Original Jan 21',
      price: 26,
      image: GLOBAL_URL + '/assets/images/apps/ecommerce/product/68.jpg',
      rating: 5,
      review: 4,
      sale: 22,
      location: 'Brooklyn'),
  SearchProductModel(
      id: 20,
      name: 'SAMSUNG LED TV 32 Inch HD Digital - 32N4003',
      price: 116,
      image: GLOBAL_URL + '/assets/images/apps/ecommerce/product/80.jpg',
      rating: 5,
      review: 380,
      sale: 866,
      location: 'Brooklyn')
];
