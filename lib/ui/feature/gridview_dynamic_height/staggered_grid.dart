/*
When using staggered grid at iOS, it will have some error on the log but the view is normal and not show any error.
This log error not appear on Android.
Below is the error log :
Updated layout information required for RenderIndexedSemantics#66769 NEEDS-LAYOUT to calculate semantics.

Below is the link regarding to error.
https://github.com/letsar/flutter_staggered_grid_view/issues?q=NEEDS-LAYOUT+to+calculate+semantics+

Because of this case, we give an another example using waterfall_flow package
*/

import 'dart:math';

import 'package:doctor_app/ui/reusable/cache_image_network.dart';
import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:fluttertoast/fluttertoast.dart';

class StaggeredGridPage extends StatefulWidget {
  @override
  _StaggeredGridPageState createState() => _StaggeredGridPageState();
}

class _StaggeredGridPageState extends State<StaggeredGridPage> {
  // initialize global widget
  final _globalWidget = GlobalWidget();

  Color _color1 = Color(0xFF515151);

  final rnd = Random();

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
        body: MasonryGridView.count(
          padding: EdgeInsets.fromLTRB(12, 8, 12, 8),
          itemCount: 21,
          primary: false,
          crossAxisCount: 2,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
          itemBuilder: (context, index) => _buildItem(index),
        )
    );
  }

  Widget _buildItem(index) {
    final int boxWidth = (((MediaQuery.of(context).size.width) - 24) / 2 - 12).round();

    int boxHeight = 400;
    if(index == 1){
      boxHeight = 120;
    } else if(index == 2){
      boxHeight = 150;
    } else if(index == 3){
      boxHeight = 200;
    } else if(index == 4){
      boxHeight = 260;
    } else if(index == 5){
      boxHeight = 300;
    } else if(index == 6){
      boxHeight = 230;
    } else if(index == 7){
      boxHeight = 250;
    } else if(index == 8){
      boxHeight = 270;
    } else if(index == 9){
      boxHeight = 380;
    } else if(index == 10){
      boxHeight = 310;
    } else if(index == 11){
      boxHeight = 350;
    } else if(index == 12){
      boxHeight = 190;
    } else if(index == 13){
      boxHeight = 220;
    } else if(index == 14){
      boxHeight = 303;
    } else if(index == 15){
      boxHeight = 330;
    } else if(index == 16){
      boxHeight = 210;
    } else if(index == 17){
      boxHeight = 290;
    } else if(index == 18){
      boxHeight = 210;
    } else if(index == 19){
      boxHeight = 310;
    }  else if(index == 20){
      boxHeight = 370;
    } else {
      boxHeight = 400;
    }
    return Container(
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 2,
        color: Colors.white,
        child: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () {
            Fluttertoast.showToast(msg: 'Click Images');
          },
          child: Column(
            children: <Widget>[
              ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10)),
                  child: buildCacheNetworkImage(width: boxWidth.toDouble(), height: boxHeight.toDouble(), url: 'https://picsum.photos/'+boxWidth.toString()+'/'+boxHeight.toString()+'/')),
              Container(
                margin: EdgeInsets.fromLTRB(8, 8, 8, 8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Title '+(index+1).toString(),
                      style: TextStyle(
                          fontSize: 14,
                          color: _color1
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
