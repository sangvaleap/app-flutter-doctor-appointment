import 'package:doctor_app/config/apps/ecommerce/constant.dart';

class LastSearchModel {
  late int id;
  late String name;
  late double price;
  late String image;
  late double rating;
  late int review;
  late int sale;
  late String location;

  LastSearchModel(
      {required this.id,
      required this.name,
      required this.price,
      required this.image,
      required this.rating,
      required this.review,
      required this.sale,
      required this.location});
}

/*
Last Search Data Information
width = 700px
height = 700px
 */
List<LastSearchModel> lastSearchData = [
  LastSearchModel(
      id: 1,
      name: 'Delta Boots Import 8 Inch',
      price: 18.3,
      image: GLOBAL_URL + '/assets/images/apps/ecommerce/product/25.jpg',
      rating: 5,
      review: 212,
      sale: 735,
      location: 'Brooklyn'),
  LastSearchModel(
    id: 2,
    name: 'Fimi X8 SE Black',
    price: 567,
    image: GLOBAL_URL + '/assets/images/apps/ecommerce/product/26.jpg',
    rating: 5,
    review: 63,
    sale: 115,
    location: 'Brooklyn',
  ),
  LastSearchModel(
      id: 3,
      name: 'Guess Collection Watch Ceramic Type GC 6004 ',
      price: 52,
      image: GLOBAL_URL + '/assets/images/apps/ecommerce/product/27.jpg',
      rating: 5,
      review: 7,
      sale: 7,
      location: 'Brooklyn'),
  LastSearchModel(
      id: 4,
      name: 'Adidas Football Predator 19.3 FG F35594 Original',
      price: 9,
      image: GLOBAL_URL + '/assets/images/apps/ecommerce/product/45.jpg',
      rating: 5,
      review: 30,
      sale: 70,
      location: 'Brooklyn'),
  LastSearchModel(
      id: 5,
      name: 'NEW Original Apple TV 4K 64GB 5th Generation',
      price: 261,
      image: GLOBAL_URL + '/assets/images/apps/ecommerce/product/29.jpg',
      rating: 5,
      review: 98,
      sale: 263,
      location: 'Brooklyn'),
  LastSearchModel(
      id: 6,
      name: 'SAMSUNG GALAXY S20 PLUS RAM 8/128GB',
      price: 751,
      image: GLOBAL_URL + '/assets/images/apps/ecommerce/product/30.jpg',
      rating: 5,
      review: 14,
      sale: 17,
      location: 'Brooklyn'),
  LastSearchModel(
      id: 7,
      name:
          'Changhong Google certified Android Smart TV 32 inch 32H4 LED TV-L32H4',
      price: 129.9,
      image: GLOBAL_URL + '/assets/images/apps/ecommerce/product/31.jpg',
      rating: 5,
      review: 701,
      sale: 1558,
      location: 'Brooklyn'),
  LastSearchModel(
      id: 8,
      name: 'Adidas EQT Adv Premium Original',
      price: 28.67,
      image: GLOBAL_URL + '/assets/images/apps/ecommerce/product/32.jpg',
      rating: 5,
      review: 146,
      sale: 398,
      location: 'Brooklyn'),
  LastSearchModel(
      id: 9,
      name:
          'Xiaomi Air Purifier 3 Mijia OLED Touch Sterilization Air Ionizer - 3',
      price: 139,
      image: GLOBAL_URL + '/assets/images/apps/ecommerce/product/33.jpg',
      rating: 5,
      review: 275,
      sale: 1055,
      location: 'Brooklyn'),
  LastSearchModel(
      id: 10,
      name: 'Spatula Set Stainless Kitchen Tools',
      price: 2.5,
      image: GLOBAL_URL + '/assets/images/apps/ecommerce/product/34.jpg',
      rating: 5,
      review: 302,
      sale: 752,
      location: 'Brooklyn'),
  LastSearchModel(
      id: 11,
      name:
          'DATA CABLE TYPE-C TO TYPE-C BASEUS HALO DATA CABLE PD 2.0 60W - 0.5 M',
      price: 3,
      image: GLOBAL_URL + '/assets/images/apps/ecommerce/product/35.jpg',
      rating: 5,
      review: 636,
      sale: 2087,
      location: 'Brooklyn'),
  LastSearchModel(
      id: 12,
      name: 'BASEUS QUICK CHARGER HEAD QC3.0/4.0 TYPE-C+USB 30W PD 5A - USB TC',
      price: 10.6,
      image: GLOBAL_URL + '/assets/images/apps/ecommerce/product/36.jpg',
      rating: 5,
      review: 2802,
      sale: 7052,
      location: 'Brooklyn'),
  LastSearchModel(
      id: 13,
      name: 'Xiaomi Powerbank MI2C 20000mAh Mi Power Bank 20000 mAh PLM06ZM',
      price: 19.9,
      image: GLOBAL_URL + '/assets/images/apps/ecommerce/product/37.jpg',
      rating: 5,
      review: 105,
      sale: 227,
      location: 'Brooklyn'),
  LastSearchModel(
      id: 14,
      name:
          '3D FASHION MASK WITH BREATHING VALVE / MASKER PM 2.5 KARBON / WASHABLE - BLACK NEW MODEL',
      price: 2.33,
      image: GLOBAL_URL + '/assets/images/apps/ecommerce/product/38.jpg',
      rating: 5,
      review: 503,
      sale: 3645,
      location: 'Brooklyn'),
  LastSearchModel(
      id: 15,
      name:
          'Robot RT-US04 Table Phone Holder Stand Aluminium Alloy Universal - Pink',
      price: 5.3,
      image: GLOBAL_URL + '/assets/images/apps/ecommerce/product/39.jpg',
      rating: 5,
      review: 1095,
      sale: 3400,
      location: 'Brooklyn'),
  LastSearchModel(
      id: 16,
      name: 'Tactical Pants Blackhawk Helikon ',
      price: 10,
      image: GLOBAL_URL + '/assets/images/apps/ecommerce/product/40.jpg',
      rating: 5,
      review: 63,
      sale: 131,
      location: 'Brooklyn'),
  LastSearchModel(
      id: 17,
      name:
          'Sony SRS- XB12 / XB 12 Extra Bass Portable Bluetooth Speaker - Black',
      price: 48,
      image: GLOBAL_URL + '/assets/images/apps/ecommerce/product/41.jpg',
      rating: 5,
      review: 182,
      sale: 427,
      location: 'Brooklyn'),
  LastSearchModel(
      id: 18,
      name:
          'Original 100% 60W Magsafe 1 Power Adapter Charger Macbook Pro - Air',
      price: 22.66,
      image: GLOBAL_URL + '/assets/images/apps/ecommerce/product/42.jpg',
      rating: 5,
      review: 131,
      sale: 466,
      location: 'Brooklyn'),
  LastSearchModel(
      id: 19,
      name:
          'Macbook Pro 2019 TouchBar MV912 15" 16GB 512GB 2.3GHz 8-core i9 Gray',
      price: 2212,
      image: GLOBAL_URL + '/assets/images/apps/ecommerce/product/43.jpg',
      rating: 5,
      review: 16,
      sale: 37,
      location: 'Brooklyn'),
  LastSearchModel(
      id: 20,
      name: 'New imac 2017 MNEA2 5K retina /3,5GHZ/i5/8GB/1TB/RP575',
      price: 1643,
      image: GLOBAL_URL + '/assets/images/apps/ecommerce/product/44.jpg',
      rating: 5,
      review: 2,
      sale: 3,
      location: 'Brooklyn')
];
