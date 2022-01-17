class ProductGridModel {
  late int id;
  late String name;
  late double price;
  late String image;
  late double rating;
  late int review;
  late int sale;
  late String location;

  ProductGridModel({required this.id, required this.name, required this.price, required this.image, required this.rating, required this.review, required this.sale, required this.location});

  ProductGridModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'].toDouble();
    image = json['image'];
    rating = json['rating'].toDouble();
    review = json['review'];
    sale = json['sale'];
    location = json['location'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['price'] = this.price;
    data['image'] = this.image;
    data['rating'] = this.rating;
    data['review'] = this.review;
    data['sale'] = this.sale;
    data['location'] = this.location;
    return data;
  }
}