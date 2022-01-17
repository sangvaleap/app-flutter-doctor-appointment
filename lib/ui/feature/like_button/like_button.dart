/*
https://pub.dev/packages/like_button
*/
import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';

class LikeButtonPage extends StatefulWidget {
  @override
  _LikeButtonPageState createState() => _LikeButtonPageState();
}

class _LikeButtonPageState extends State<LikeButtonPage> {
  // initialize global widget
  final _globalWidget = GlobalWidget();

  final int likeCount = 999;

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
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _globalWidget.createDetailWidget(
                    title: 'Like Button',
                    desc: 'This is the example of Like Button'
                ),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  child: Text('Example 1'),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 16),
                  child: LikeButton(
                    mainAxisAlignment: MainAxisAlignment.start,
                    size: 40,
                    likeCount: likeCount,
                    countBuilder: (int? count, bool isLiked, String text) {
                      final ColorSwatch<int> color =
                      isLiked ? Colors.pinkAccent : Colors.grey;
                      Widget result;
                      if (count == 0) {
                        result = Text(
                          'love',
                          style: TextStyle(color: color),
                        );
                      } else
                        result = Text(
                          count! >= 1000
                              ? (count / 1000.0).toStringAsFixed(1) + 'k'
                              : text,
                          style: TextStyle(color: color),
                        );
                      return result;
                    },
                    likeCountAnimationType: likeCount < 1000
                        ? LikeCountAnimationType.part
                        : LikeCountAnimationType.none,
                    likeCountPadding: const EdgeInsets.only(left: 15.0),
                    onTap: onLikeButtonTapped,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Text('Example 2'),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 16),
                  child: LikeButton(
                    mainAxisAlignment: MainAxisAlignment.start,
                    size: 40,
                    isLiked: null,
                    circleColor: CircleColor(
                      start: Colors.redAccent[100]!,
                      end: Colors.redAccent[400]!,
                    ),
                    bubblesColor: BubblesColor(
                      dotPrimaryColor: Colors.red[300]!,
                      dotSecondaryColor: Colors.red[200]!,
                    ),
                    likeBuilder: (bool isLiked) {
                      return const Icon(
                        Icons.assistant_photo,
                        color: Colors.red,
                        size: 40,
                      );
                    },
                    likeCount: 888,
                    countBuilder: (int? count, bool isLiked, String text) {
                      return Text(
                        count == 0 ? 'love' : text,
                        style: const TextStyle(color: Colors.red),
                      );
                    },
                    likeCountPadding: const EdgeInsets.only(left: 15.0),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Text('Example 3'),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 16),
                  child: LikeButton(
                    mainAxisAlignment: MainAxisAlignment.start,
                    size: 40,
                    circleColor: CircleColor(
                        start: Colors.pinkAccent[200]!, end: Colors.pinkAccent[400]!),
                    bubblesColor: BubblesColor(
                      dotPrimaryColor: Colors.lightBlue[300]!,
                      dotSecondaryColor: Colors.lightBlue[200]!,
                    ),
                    likeBuilder: (bool isLiked) {
                      return Icon(
                        Icons.insert_emoticon,
                        color: isLiked ? Colors.lightBlueAccent : Colors.grey,
                        size: 40,
                      );
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Text('Example 4'),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 16),
                  child: LikeButton(
                    mainAxisAlignment: MainAxisAlignment.start,
                    size: 40,
                    isLiked: null,
                    circleColor: CircleColor(
                      start: Colors.indigoAccent[200]!,
                      end: Colors.indigoAccent[400]!,
                    ),
                    bubblesColor: BubblesColor(
                      dotPrimaryColor: Colors.indigoAccent[700]!,
                      dotSecondaryColor: Colors.indigoAccent[200]!,
                    ),
                    likeBuilder: (bool isLiked) {
                      return Icon(
                        Icons.thumb_up,
                        color: isLiked ? Colors.indigoAccent[700] : Colors.grey,
                        size: 40,
                      );
                    },
                    likeCount: 888,
                    countPostion: CountPostion.bottom,
                    countBuilder: (int? count, bool isLiked, String text) {
                      return Text(
                        text,
                        style: TextStyle(color: Colors.grey),
                      );
                    },
                    likeCountPadding: EdgeInsets.only(top: 15.0),
                    countDecoration: (Widget count, int? likeCount) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          count,
                          SizedBox(
                            width: 10.0,
                          ),
                          Text(
                            'liked',
                            style: TextStyle(color: Colors.indigoAccent),
                          )
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        )
    );
  }

  Future<bool> onLikeButtonTapped(bool isLiked) async {
    return !isLiked;
  }
}
