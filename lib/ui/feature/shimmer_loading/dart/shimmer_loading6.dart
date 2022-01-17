import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerLoading6Page extends StatefulWidget {
  @override
  _ShimmerLoading6PageState createState() => _ShimmerLoading6PageState();
}

class _ShimmerLoading6PageState extends State<ShimmerLoading6Page> {
  // initialize global widget
  final _globalWidget = GlobalWidget();

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
    double bannerWidth = MediaQuery.of(context).size.width;
    double bannerHeight = MediaQuery.of(context).size.width*6/8;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _globalWidget.globalAppBar(),
      body: ListView(
        children: [
          Container(
            margin: EdgeInsets.all(16),
            child: _globalWidget.createDetailWidget(
                title: 'Shimmer Loading 6',
                desc: 'This is the example of shimmer loading for banner slider'
            ),
          ),
          Container(
              child: buildShimmerBannerSlider(bannerWidth, bannerHeight)
          )
        ],
      ),
    );
  }

  Widget buildShimmerBannerSlider(bannerWidth, bannerHeight) {
    return Column(
      children: [
        Container(
          child: Shimmer.fromColors(
            highlightColor: Colors.white,
            baseColor: _shimmerColor,
            child: Container(
              child: Container(
                width: bannerWidth,
                height: bannerHeight,
                color: _shimmerColor,
              ),
            ),
            period: Duration(milliseconds: 1000),
          ),
        ),
        Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children : List.generate(5, (index) {
              return Container(
                width: 8.0,
                height: 8.0,
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _shimmerColor,
                ),
              );
            })
        ),
      ],
    );
  }
}
