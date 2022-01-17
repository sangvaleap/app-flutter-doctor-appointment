import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerLoading7Page extends StatefulWidget {
  @override
  _ShimmerLoading7PageState createState() => _ShimmerLoading7PageState();
}

class _ShimmerLoading7PageState extends State<ShimmerLoading7Page> {
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
    double bannerHeight = MediaQuery.of(context).size.width/2;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _globalWidget.globalAppBar(),
      body: ListView(
        children: [
          Container(
            margin: EdgeInsets.all(16),
            child: _globalWidget.createDetailWidget(
                title: 'Shimmer Loading 7',
                desc: 'This is the example of shimmer loading for banner without slider'
            ),
          ),
          Container(
              child: buildShimmerBanner(bannerWidth, bannerHeight)
          )
        ],
      ),
    );
  }

  Widget buildShimmerBanner(bannerWidth, bannerHeight) {
    return Container(
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
    );
  }
}
