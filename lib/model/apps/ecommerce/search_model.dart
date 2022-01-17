class SearchModel {
  late int id;
  late String words;

  SearchModel({required this.id, required this.words});
}

List<SearchModel> searchData = [
  SearchModel(
      id: 1,
      words: 'adidas shirt'
  ),
  SearchModel(
      id: 2,
      words: 'led tv'
  ),
  SearchModel(
      id: 3,
      words: 'apple mac'
  ),
  SearchModel(
      id: 4,
      words: 'iphone'
  ),
  SearchModel(
      id: 5,
      words: 'asus'
  ),
];
