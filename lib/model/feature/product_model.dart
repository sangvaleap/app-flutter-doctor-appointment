import 'package:doctor_app/config/apps/ecommerce/constant.dart';

class ProductModel {
  late int id;
  late String name;
  late double price;
  late String image;
  late double rating;
  late int review;
  late int sale;
  late String location;

  ProductModel(
      {required this.id,
      required this.name,
      required this.price,
      required this.image,
      required this.rating,
      required this.review,
      required this.sale,
      required this.location});
}

List<ProductModel> productData = [
  ProductModel(
      id: 1,
      name: 'iphone 7 Plus / 7+ 128GB',
      price: 433,
      image: GLOBAL_URL + '/assets/images/apps/ecommerce/product/28.jpg',
      rating: 5,
      review: 129,
      sale: 310,
      location: 'Brooklyn'),
  ProductModel(
      id: 2,
      name:
          'Macbook Pro 2019 TouchBar MV912 15" 16GB 512GB 2.3GHz 8-core i9 Gray',
      price: 2212,
      image: GLOBAL_URL + '/assets/images/apps/ecommerce/product/43.jpg',
      rating: 5,
      review: 16,
      sale: 37,
      location: 'Brooklyn'),
  ProductModel(
      id: 3,
      name: 'New imac 2017 MNEA2 5K retina /3,5GHZ/i5/8GB/1TB/RP575',
      price: 1643,
      image: GLOBAL_URL + '/assets/images/apps/ecommerce/product/44.jpg',
      rating: 5,
      review: 2,
      sale: 3,
      location: 'Brooklyn'),
  ProductModel(
      id: 4,
      name:
          'DEADBOLT DOOR LOCK SMART DOOR LOCK / SMART LOCK DOOR MEREK SEYVEN - EZ-TTLOCK',
      price: 120,
      image: GLOBAL_URL + '/assets/images/apps/ecommerce/product/19.jpg',
      rating: 5,
      review: 4,
      sale: 6,
      location: 'Brooklyn'),
  ProductModel(
      id: 5,
      name: 'IWO 8 Smart Watch Apple iWatch Mirror For Android iPhone',
      price: 62,
      image: GLOBAL_URL + '/assets/images/apps/ecommerce/product/46.jpg',
      rating: 5,
      review: 42,
      sale: 69,
      location: 'Brooklyn'),
  ProductModel(
      id: 6,
      name: 'SAMSUNG GALAXY S20 PLUS RAM 8/128GB',
      price: 751,
      image: GLOBAL_URL + '/assets/images/apps/ecommerce/product/30.jpg',
      rating: 5,
      review: 14,
      sale: 17,
      location: 'Brooklyn'),
  ProductModel(
      id: 7,
      name: 'Garmin Instinct Tactical - Black',
      price: 290,
      image: GLOBAL_URL + '/assets/images/apps/ecommerce/product/47.jpg',
      rating: 5,
      review: 13,
      sale: 23,
      location: 'Brooklyn'),
  ProductModel(
      id: 8,
      name: 'Asus Rog Phone 3 Rogphone III Ram 12Gb 512Gb Snapdragon 865+ Plus',
      price: 1152,
      image: GLOBAL_URL + '/assets/images/apps/ecommerce/product/48.jpg',
      rating: 5,
      review: 1,
      sale: 2,
      location: 'Brooklyn'),
  ProductModel(
      id: 9,
      name: 'ipad Pro 2020 11-inch 128GB Wi-Fi Only - Silver',
      price: 866,
      image: GLOBAL_URL + '/assets/images/apps/ecommerce/product/49.jpg',
      rating: 5,
      review: 22,
      sale: 468,
      location: 'Brooklyn'),
  ProductModel(
      id: 10,
      name: 'Folding Bike 20 GENIO BY United Bike',
      price: 173,
      image: GLOBAL_URL + '/assets/images/apps/ecommerce/product/50.jpg',
      rating: 5,
      review: 9,
      sale: 23,
      location: 'Brooklyn'),
  ProductModel(
      id: 11,
      name: 'XBOX 360 SLIM 500 GB RGH FULL GAME & KINECT',
      price: 183,
      image: GLOBAL_URL + '/assets/images/apps/ecommerce/product/51.jpg',
      rating: 4,
      review: 3,
      sale: 9,
      location: 'Brooklyn'),
  ProductModel(
      id: 12,
      name: 'Nitendo Switch Console New HAC-001(-01) Neon Blue - Neon Red',
      price: 349,
      image: GLOBAL_URL + '/assets/images/apps/ecommerce/product/52.jpg',
      rating: 5,
      review: 30,
      sale: 86,
      location: 'Brooklyn'),
  ProductModel(
      id: 13,
      name: 'TP-Link TL-WR840N (V4.0) : 300Mbps TPLink WiFi Wireless N Router',
      price: 11,
      image: GLOBAL_URL + '/assets/images/apps/ecommerce/product/53.jpg',
      rating: 5,
      review: 1075,
      sale: 3247,
      location: 'Brooklyn'),
  ProductModel(
      id: 14,
      name: 'Google Chromecast 3 Chrome Cast 3rd HDMI Streaming',
      price: 38,
      image: GLOBAL_URL + '/assets/images/apps/ecommerce/product/54.jpg',
      rating: 5,
      review: 160,
      sale: 574,
      location: 'Brooklyn'),
  ProductModel(
      id: 15,
      name: 'PRINTER CANON PIXMA MG2570S / PRINTER ALL IN ONE MG 2570 S',
      price: 35,
      image: GLOBAL_URL + '/assets/images/apps/ecommerce/product/55.jpg',
      rating: 5,
      review: 126,
      sale: 285,
      location: 'Brooklyn'),
  ProductModel(
      id: 16,
      name: 'Air Jordan 1 Mid Chicago Black Toe 554724-069 100% Authentic - 43',
      price: 220,
      image: GLOBAL_URL + '/assets/images/apps/ecommerce/product/56.jpg',
      rating: 5,
      review: 15,
      sale: 24,
      location: 'Brooklyn'),
  ProductModel(
      id: 17,
      name: 'ADIDAS ICE DIVE PARFUM ORIGINAL 100ML',
      price: 4.9,
      image: GLOBAL_URL + '/assets/images/apps/ecommerce/product/57.jpg',
      rating: 5,
      review: 251,
      sale: 751,
      location: 'Brooklyn'),
  ProductModel(
      id: 18,
      name:
          'BARDI Smart Light Bulb Lamp Bohlam LED WIFI RGBWW 12W 12 watt Home IoT',
      price: 8.6,
      image: GLOBAL_URL + '/assets/images/apps/ecommerce/product/58.jpg',
      rating: 5,
      review: 354,
      sale: 540,
      location: 'Brooklyn'),
  ProductModel(
      id: 19,
      name:
          'Xiaomi Yi Dash Camera Nightscape 1080P 60FPS ADAS Night Vision Dashcam',
      price: 46.6,
      image: GLOBAL_URL + '/assets/images/apps/ecommerce/product/59.jpg',
      rating: 5,
      review: 47,
      sale: 146,
      location: 'Brooklyn'),
  ProductModel(
      id: 20,
      name:
          'gopro hero 8 black garansi resmi TAM / go pro hero8 black / 8black',
      price: 333,
      image: GLOBAL_URL + '/assets/images/apps/ecommerce/product/12.jpg',
      rating: 5,
      review: 13,
      sale: 33,
      location: 'Brooklyn')
];
