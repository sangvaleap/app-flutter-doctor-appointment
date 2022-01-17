import 'dart:math';

import 'package:doctor_app/ui/reusable/cache_image_network.dart';
import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:waterfall_flow/waterfall_flow.dart';

class WaterfallFlowPage extends StatefulWidget {
  @override
  _WaterfallFlowPageState createState() => _WaterfallFlowPageState();
}

class _WaterfallFlowPageState extends State<WaterfallFlowPage> {
  // initialize global widget
  final _globalWidget = GlobalWidget();

  Color _color1 = Color(0xFF515151);
  late List<int> boxHeightList = [];
  int itemCount = 20;

  final rnd = Random();

  @override
  void initState() {
    for(int i=1;i<=itemCount;i++){
      boxHeightList.add(rnd.nextInt(200) + 200);
    }
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
        body: WaterfallFlow.builder(
          primary: false,
          //cacheExtent: 0.0,
          //reverse: true,
          padding: EdgeInsets.fromLTRB(12, 8, 12, 8),
          gridDelegate: SliverWaterfallFlowDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            // collectGarbage: (List<int> garbages) {
            //   print('collect garbage : $garbages');
            // },
            // viewportBuilder: (int firstIndex, int lastIndex) {
            //   print('viewport : [$firstIndex,$lastIndex]');
            // },
          ),
          itemBuilder: (BuildContext c, int index) {
            return _buildItem(index);
          },
          itemCount: itemCount,
        )
    );
  }

  Widget _buildItem(index) {
    final int boxWidth = (((MediaQuery.of(context).size.width) - 24) / 2 - 12).round();
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
                  child: buildCacheNetworkImage(width: boxWidth.toDouble(), height: boxHeightList[index].toDouble(), url: 'https://picsum.photos/'+boxWidth.toString()+'/'+boxHeightList[index].toString()+'/')),
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
