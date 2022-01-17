import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';

class RatingBarPage extends StatefulWidget {
  @override
  _RatingBarPageState createState() => _RatingBarPageState();
}

class _RatingBarPageState extends State<RatingBarPage> {
  // initialize global widget
  final _globalWidget = GlobalWidget();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: _globalWidget.globalAppBar(),
        body: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(24, 24, 24, 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _globalWidget.createDetailWidget(
                  title: 'Rating Bar',
                  desc: 'This is the example to create rating bar.\n\n'
                      'If decimal number below 0.25, then floor the number.\n'
                      'If decimal number between and equal 0.25 to 0.75, then draw the half star.\n'
                      'If decimal number above 0.75, then ceil the number.\n'
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 8),
                child: _createRatingBar(rating: 5, size: 12),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 8),
                child: _createRatingBar(rating: 1, size: 16),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 8),
                child: _createRatingBar(rating: 3),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 8),
                child: _createRatingBar(rating: 5, size: 40),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 8),
                child: _createRatingBar(rating: 4),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 8),
                child: _createRatingBar(rating: 0),
              ),
              Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Text('2.1')
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 8),
                child: _createRatingBar(rating: 2.1),
              ),
              Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Text('2.4')
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 8),
                child: _createRatingBar(rating: 2.4),
              ),
              Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Text('2.8')
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 8),
                child: _createRatingBar(rating: 2.8),
              ),
              Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Text('4.8')
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 8),
                child: _createRatingBar(rating: 4.8),
              ),
            ],
          ),
        )
    );
  }

  Widget _createRatingBar({double rating=5, double size=24}){
    if(rating < 0){
      rating = 0;
    } else if(rating>5){
      rating = 5;
    }

    bool _absolute = false;
    int _fullStar = 0;
    int _emptyStar = 0;

    if(rating == 0 || rating == 1 || rating == 2 || rating == 3 || rating == 4 || rating == 5){
      _absolute = true;
    } else {
      double _dec = (rating - int.parse(rating.toString().substring(0,1)));
      if(_dec > 0 && _dec < 1){
        if(_dec >= 0.25 && _dec <= 0.75){
          _absolute = false;
        } else {
          _absolute = true;
          if(_dec < 0.25){
            _emptyStar = 1;
          } else if(_dec > 0.75){
            _fullStar = 1;
          }
        }
      }
    }
    return Row(
      children: [
        for(int i=1;i<=rating+_fullStar;i++) Icon(Icons.star, color: Colors.yellow[700], size: size),
        !_absolute?Icon(Icons.star_half, color: Colors.yellow[700], size: size):SizedBox.shrink(),
        for(int i=1;i<=(5-rating+_emptyStar);i++) Icon(Icons.star_border, color: Colors.yellow[700], size: size),
      ],
    );
  }
}
