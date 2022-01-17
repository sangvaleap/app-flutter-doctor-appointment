import 'dart:async';

import 'package:doctor_app/config/apps/ecommerce/constant.dart';
import 'package:flutter/material.dart';

class ReusableWidget{
  PreferredSizeWidget bottomAppBar(){
    return PreferredSize(
        child: Container(
          color: Colors.grey[100],
          height: 1.0,
        ),
        preferredSize: Size.fromHeight(1.0));
  }

  Widget createRatingBar({double rating=5, double size=24}){
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

  Widget customNotifIcon({int count=0, Color notifColor=Colors.grey, Color labelColor=Colors.pinkAccent, double notifSize=24, double labelSize=14, String position='right'}) {
    double? posLeft;
    double? posRight = 0;
    if(position == 'left'){
      posLeft = 0;
      posRight = null;
    }
    return Stack(
      children: <Widget>[
        Icon(Icons.notifications, color: notifColor, size: notifSize),
        Positioned(
          left: posLeft,
          right: posRight,
          child: Container(
            padding: EdgeInsets.all(1),
            decoration: BoxDecoration(
              color: labelColor,
              borderRadius: BorderRadius.circular(labelSize),
            ),
            constraints: BoxConstraints(
              minWidth: labelSize,
              minHeight: labelSize,
            ),
            child: Center(
              child: Text(
                count.toString(),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 8,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget divider1(){
    return Divider(height: 0, color: Colors.grey[400]);
  }

  Future _showProgressDialog(BuildContext context) {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return WillPopScope(
            onWillPop: () {
              return Future.value(false);
            },
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        });
  }

  // dummy loading
  void startLoading(context, String textMessage, int backToPreviousPageStack){
    _showProgressDialog(context);
    Timer(Duration(seconds: 2), () {
      Navigator.pop(context);
      _buildShowDialog(context, textMessage, backToPreviousPageStack);
    });
  }

  Future _buildShowDialog(BuildContext context, String textMessage, int backToPreviousPageStack) {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return WillPopScope(
            onWillPop: () {
              return Future.value(false);
            },
            child: Dialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)), //this right here
              child: Container(
                padding: EdgeInsets.all(20),
                margin: EdgeInsets.fromLTRB(40, 20, 40, 20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(
                      textMessage,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 14, color: BLACK_GREY),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      child: TextButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.resolveWith<Color>(
                                  (Set<MaterialState> states) => PRIMARY_COLOR,
                            ),
                            overlayColor: MaterialStateProperty.all(Colors.transparent),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                )
                            ),
                          ),
                          onPressed: () {
                            Navigator.pop(context);

                            if(backToPreviousPageStack>0){
                              FocusScope.of(context).unfocus(); // hide keyboard when press button
                              for(int i=1;i<=backToPreviousPageStack;i++){
                                Navigator.pop(context);
                              }
                            }
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5.0),
                            child: Text(
                              'OK',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                              textAlign: TextAlign.center,
                            ),
                          )
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
  // end dummy loading

  Widget createDefaultLabel(context){
    return Container(
      padding: EdgeInsets.fromLTRB(8, 2, 8, 2),
      decoration: BoxDecoration(
          color: SOFT_BLUE,
          borderRadius: BorderRadius.circular(2)
      ),
      child: Row(
        children: [
          Text('Default', style: TextStyle(
              color: Colors.white, fontSize: 13
          )),
          SizedBox(
            width: 4,
          ),
          Icon(Icons.done, color: Colors.white, size: 11)
        ],
      ),
    );
  }
}