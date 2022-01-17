import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerLoading1Page extends StatefulWidget {
  @override
  _ShimmerLoading1PageState createState() => _ShimmerLoading1PageState();
}

class _ShimmerLoading1PageState extends State<ShimmerLoading1Page> {
  // initialize global widget
  final _globalWidget = GlobalWidget();

  double _containerHeight = 20;
  double _spaceHeight = 10;
  Color _shimmerColor = Colors.grey[200]!;

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
        children: [
          Container(
            margin: EdgeInsets.all(16),
            child: _globalWidget.createDetailWidget(
                title: 'Shimmer Loading 1',
                desc: 'This is the example of shimmer loading for content'
            ),
          ),
          buildShimmerContent()
        ],
      ),
    );
  }

  Widget buildShimmerContent(){
    return ListView.builder(
      shrinkWrap: true,
      primary: false,
      itemCount: 8,
      itemBuilder: (BuildContext context, int index) {
        return Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
              child: Shimmer.fromColors(
                highlightColor: Colors.white,
                baseColor: _shimmerColor,
                child: Container(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(left: 12.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: _shimmerColor,
                        ),
                        height: 110,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(10.0),
                                bottomRight: Radius.circular(10.0)),
                            color: Colors.white,
                          ),
                          child: Container(
                            width: 80,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(top: 5),
                              padding: EdgeInsets.only(left: 12.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: _shimmerColor,
                              ),
                              height: _containerHeight,
                              child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(10.0),
                                        bottomRight: Radius.circular(10.0)),
                                    color: Colors.white,
                                  )),
                            ),
                            SizedBox(
                              height: _spaceHeight,
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 12.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: _shimmerColor,
                              ),
                              height: _containerHeight,
                              child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(10.0),
                                        bottomRight: Radius.circular(10.0)),
                                    color: Colors.white,
                                  )),
                            ),
                            SizedBox(
                              height: _spaceHeight,
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 12.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: _shimmerColor,
                              ),
                              height: _containerHeight,
                              width: 100,
                              child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(10.0),
                                        bottomRight: Radius.circular(10.0)),
                                    color: Colors.white,
                                  )),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                period: Duration(milliseconds: 1000),
              ),
            ),
            Container(
                margin: EdgeInsets.only(top: 20),
                color: _shimmerColor,
                height: 1),
          ],
        );
      },
    );
  }
}
