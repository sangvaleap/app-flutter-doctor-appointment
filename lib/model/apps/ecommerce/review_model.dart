class ReviewModel {
  late int id;
  late String name;
  late String date;
  late double rating;
  late String review;

  ReviewModel({required this.id, required this.name, required this.date, required this.rating, required this.review});
}

List<ReviewModel> reviewData =[
  ReviewModel(
      id: 1,
      name: 'A*******i',
      date: '11 September 2020',
      rating: 5,
      review: 'Everything came in time. Very well packed. Quality is excellent. Thank you!'
  ),
  ReviewModel(
      id: 2,
      name: 'L***a',
      date: '10 September 2020',
      rating: 5,
      review: 'The goods came very quickly, in perfect condition, everything is packed, nothing is damaged! Excellent, visibility super, I recommend the seller, the store, the goods!!!'
  ),
  ReviewModel(
      id: 3,
      name: 'R******i',
      date: '8 September 2020',
      rating: 5,
      review: 'Before Moscow 3 weeks, asked the seller that there would be no pictogram, made without them. The packaging is definitely good'
  ),
  ReviewModel(
      id: 4,
      name: 'D***s',
      date: '7 September 2020',
      rating: 4,
      review: 'The goods arrived 21 days before perm. Packing on the photo. the box inside is crumpled. Thank you seller'
  ),
  ReviewModel(
      id: 5,
      name: 'S*******a',
      date: '7 September 2020',
      rating: 5,
      review: 'An excellent device, its money costs. Packed perfectly, no damage. To the seller 5 +++.'
  ),
  ReviewModel(
      id: 6,
      name: 'B*******g',
      date: '6 September 2020',
      rating: 5,
      review: 'The goods are satisfied'
  ),
  ReviewModel(
      id: 7,
      name: 'H*********a',
      date: '4 September 2020',
      rating: 3,
      review: 'Good product, seller recommend'
  ),
  ReviewModel(
      id: 8,
      name: 'P***u',
      date: '4 September 2020',
      rating: 3,
      review: 'Not as good as they write but still worth'
  ),
  ReviewModel(
      id: 9,
      name: 'O**********a',
      date: '3 September 2020',
      rating: 4,
      review: "Perfect. Immediately turned up in flight. I can't give you 5 stars for the parcel. And arrived very deteriorated, but fortunately the drone works"
  ),
  ReviewModel(
      id: 10,
      name: 'D********l',
      date: '1 September 2020',
      rating: 5,
      review: 'All OK. Although well packed, the box crushed'
  ),
];