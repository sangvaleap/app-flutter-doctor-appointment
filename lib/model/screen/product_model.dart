class ProductModel {
  late int id;
  late String name;
  double? price;
  late String image;
  double? rating;
  int? review;
  late int sale;
  int? stock;
  String? location;

  ProductModel({required this.id, required this.name, this.price, required this.image, this.rating, this.review, required this.sale, this.stock, this.location});
}