import 'package:doctor_app/config/constant.dart';
import 'package:doctor_app/ui/feature/rating/give_rating.dart';
import 'package:doctor_app/ui/feature/rating/rating_bar.dart';
import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';

class RatingListPage extends StatefulWidget {
  @override
  _RatingListPageState createState() => _RatingListPageState();
}

class _RatingListPageState extends State<RatingListPage> {
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
        body: ListView(
          padding: EdgeInsets.fromLTRB(24, 24, 24, 16),
          children: [
            Container(
              child: Text('Rating', style: TextStyle(
                  fontSize: 18, color: BLACK21, fontWeight: FontWeight.w500
              )),
            ),
            Container(
              margin: EdgeInsets.only(top: 24),
              child: Row(
                children: [
                  Flexible(
                      flex:5,
                      child: Container(
                        child: Text('Rating is used to rate / review product.', style: TextStyle(
                            fontSize: 15, color: BLACK77,letterSpacing: 0.5
                        )),
                      )
                  ),
                  Flexible(
                      flex: 2,
                      child: Container(
                          alignment: Alignment.center,
                          child: Icon(Icons.star, size: 50, color: SOFT_BLUE))
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 48),
              child: Text('List', style: TextStyle(
                  fontSize: 18, color: BLACK21, fontWeight: FontWeight.w500
              )),
            ),
            SizedBox(height: 18),
            _globalWidget.screenDetailList(context: context, title: 'Rating Bar', page: RatingBarPage()),
            _globalWidget.screenDetailList(context: context, title: 'Give Rating', page: GiveRatingPage()),
          ],
        )
    );
  }
}