import 'package:doctor_app/library/smooth_star_rating/smooth_star_rating.dart';
import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class GiveRatingPage extends StatefulWidget {
  @override
  _GiveRatingPageState createState() => _GiveRatingPageState();
}

class _GiveRatingPageState extends State<GiveRatingPage> {
  // initialize global widget
  final _globalWidget = GlobalWidget();

  double _rating1 = 4;
  double _rating2 = 3.5;

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
                  title: 'Give Rating',
                  desc: 'This is the example to give rating. Tap or hold the star to give rating.'
              ),
              Container(
                  margin: EdgeInsets.only(top: 10),
                  child: Text('Without half rating')
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 16),
                child: SmoothStarRating(
                  rating: _rating1,
                  isReadOnly: false,
                  size: 40,
                  filledIconData: Icons.star,
                  defaultIconData: Icons.star_border,
                  color: Colors.yellow[700],
                  borderColor: Colors.yellow[700],
                  starCount: 5,
                  allowHalfRating: false,
                  spacing: 1,
                  onRated: (value) {
                    _rating1 = value;
                    Fluttertoast.showToast(msg: 'Rating value : '+_rating1.toString(), toastLength: Toast.LENGTH_SHORT);
                  },
                ),
              ),
              _globalWidget.createButton(
                  buttonName: 'Rate',
                  onPressed: (){
                    Fluttertoast.showToast(msg: 'Rating value : '+_rating1.toString(), toastLength: Toast.LENGTH_SHORT);
                  }
              ),
              Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Text('Half rating')
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 16),
                child: SmoothStarRating(
                  rating: _rating2,
                  isReadOnly: false,
                  size: 40,
                  filledIconData: Icons.star,
                  defaultIconData: Icons.star_border,
                  color: Colors.yellow[700],
                  borderColor: Colors.yellow[700],
                  starCount: 5,
                  allowHalfRating: true,
                  spacing: 1,
                  onRated: (value) {
                    _rating2 = value;
                    Fluttertoast.showToast(msg: 'Rating value : '+_rating2.toString(), toastLength: Toast.LENGTH_SHORT);
                  },
                ),
              ),
              _globalWidget.createButton(
                  buttonName: 'Rate',
                  onPressed: (){
                    Fluttertoast.showToast(msg: 'Rating value : '+_rating2.toString(), toastLength: Toast.LENGTH_SHORT);
                  }
              ),
            ],
          ),
        )
    );
  }
}
