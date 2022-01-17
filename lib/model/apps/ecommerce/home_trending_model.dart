import 'package:doctor_app/config/apps/ecommerce/constant.dart';

class HomeTrendingModel {
  late int id;
  late String name;
  late String image;
  late String sale;

  HomeTrendingModel(
      {required this.id,
      required this.name,
      required this.image,
      required this.sale});
}

/*
Home Trending Data Information
width = 700px
height = 700px
 */
List<HomeTrendingModel> homeTrendingData = [
  HomeTrendingModel(
      id: 1,
      name: 'Adidas Shirt',
      image: GLOBAL_URL + '/assets/images/apps/ecommerce/product/21.jpg',
      sale: '12.7k'),
  HomeTrendingModel(
      id: 2,
      name: 'iPhone SE 2020',
      image: GLOBAL_URL + '/assets/images/apps/ecommerce/product/22.jpg',
      sale: '8k'),
  HomeTrendingModel(
      id: 3,
      name: 'Macbook Air 2020',
      image: GLOBAL_URL + '/assets/images/apps/ecommerce/product/23.jpg',
      sale: '31.4k'),
  HomeTrendingModel(
      id: 4,
      name: 'Gaming Chair',
      image: GLOBAL_URL + '/assets/images/apps/ecommerce/product/24.jpg',
      sale: '11.9k'),
];
