import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerLoading5Page extends StatefulWidget {
  @override
  _ShimmerLoading5PageState createState() => _ShimmerLoading5PageState();
}

class _ShimmerLoading5PageState extends State<ShimmerLoading5Page> {
  // initialize global widget
  final _globalWidget = GlobalWidget();

  double _spaceHeight = 10;
  Color _shimmerColor = Colors.grey[200]!;
  Color _shimmerColorDark = Colors.grey[500]!;

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
                title: 'Shimmer Loading 5',
                desc: 'This is the example of shimmer loading for grid product with discount label'
            ),
          ),
          Container(
              child: buildShimmerProductDiscount2(((MediaQuery.of(context).size.width) - 24) / 2 - 12)
          )
        ],
      ),
    );
  }

  Widget buildShimmerProductDiscount2(boxImageSize) {
    return GridView.count(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      primary: false,
      childAspectRatio: 4/6.7,
      shrinkWrap: true,
      crossAxisSpacing: 8,
      mainAxisSpacing: 8,
      crossAxisCount: 2,
      children: List.generate(8, (index) {
        return Container(
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            elevation: 2,
            color: Colors.white,
            child: Column(
              children: <Widget>[
                Stack(
                  children: [
                    Shimmer.fromColors(
                      highlightColor: Colors.white,
                      baseColor: _shimmerColor,
                      period: Duration(milliseconds: 1000),
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                        child: Container(
                          width: boxImageSize,
                          height: boxImageSize,
                          color: _shimmerColor,
                        ),
                      ),
                    ),
                    Positioned(
                      right: 0,
                      top:10,
                      child: Shimmer.fromColors(
                        highlightColor: Colors.white,
                        baseColor: _shimmerColorDark,
                        period: Duration(milliseconds: 1000),
                        child: Container(
                          decoration: BoxDecoration(
                              color: _shimmerColorDark,
                              borderRadius: BorderRadius.only(topLeft: Radius.circular(6), bottomLeft: Radius.circular(6))
                          ),
                          padding: EdgeInsets.fromLTRB(8, 4, 8, 4),
                          child: Container(
                            width: 20,
                            height: 12,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                Shimmer.fromColors(
                  highlightColor: Colors.white,
                  baseColor: _shimmerColor,
                  period: Duration(milliseconds: 1000),
                  child: Container(
                    margin: EdgeInsets.fromLTRB(8, 8, 8, 8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: _shimmerColor,
                          ),
                          height: 12,
                        ),
                        SizedBox(
                          height: _spaceHeight,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: _shimmerColor,
                          ),
                          height: 12,
                        ),
                        SizedBox(
                          height: _spaceHeight,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: _shimmerColor,
                          ),
                          height: 12,
                        ),
                        SizedBox(
                          height: _spaceHeight,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: _shimmerColor,
                          ),
                          height: 12,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
