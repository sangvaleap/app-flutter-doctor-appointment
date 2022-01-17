class FoodModel {
  late int id;
  late String name;
  late String restaurantName;
  late double price;
  late String image;
  double? rating;
  double? distance;
  late int discount;
  late String location;

  FoodModel({required this.id, required this.name, required this.restaurantName, required this.price, required this.image, this.rating, this.distance, required this.discount, required this.location});
}