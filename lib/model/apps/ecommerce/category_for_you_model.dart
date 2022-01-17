import 'package:doctor_app/config/apps/ecommerce/constant.dart';

class CategoryForYouModel {
  late int id;
  late String image;

  CategoryForYouModel({required this.id, required this.image});
}

List<CategoryForYouModel> categoryForYouData = [
  CategoryForYouModel(
    id: 7,
    image: GLOBAL_URL + '/assets/images/apps/ecommerce/category_for_you/1.jpg',
  ),
  CategoryForYouModel(
      id: 3,
      image:
          GLOBAL_URL + '/assets/images/apps/ecommerce/category_for_you/2.jpg'),
  CategoryForYouModel(
      id: 5,
      image:
          GLOBAL_URL + '/assets/images/apps/ecommerce/category_for_you/3.jpg'),
  CategoryForYouModel(
      id: 2,
      image:
          GLOBAL_URL + '/assets/images/apps/ecommerce/category_for_you/4.jpg'),
  CategoryForYouModel(
      id: 8,
      image:
          GLOBAL_URL + '/assets/images/apps/ecommerce/category_for_you/5.jpg'),
];
