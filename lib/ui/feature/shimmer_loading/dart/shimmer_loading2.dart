import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerLoading2Page extends StatefulWidget {
  @override
  _ShimmerLoading2PageState createState() => _ShimmerLoading2PageState();
}

class _ShimmerLoading2PageState extends State<ShimmerLoading2Page> {
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
    final double boxImageSize = (MediaQuery.of(context).size.width / 3);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _globalWidget.globalAppBar(),
      body: ListView(
        children: [
          Container(
            margin: EdgeInsets.all(16),
            child: _globalWidget.createDetailWidget(
                title: 'Shimmer Loading 2',
                desc: 'This is the example of shimmer loading for horizontal content'
            ),
          ),
          Container(
            height: boxImageSize,
            child: buildShimmerImageHorizontal(boxImageSize)
          )
        ],
      ),
    );
  }

  Widget buildShimmerImageHorizontal(boxImageSize) {
    return ListView.builder(
      shrinkWrap: true,
      primary: false,
      itemCount: 8,
      padding: EdgeInsets.symmetric(horizontal: 16),
      scrollDirection: Axis.horizontal,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          margin: EdgeInsets.only(left: index == 0 ? 0 : 12),
          child: Shimmer.fromColors(
            highlightColor: Colors.white,
            baseColor: _shimmerColor,
            child: Container(
              child: ClipRRect(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
                child: Container(
                  width: boxImageSize,
                  height: boxImageSize,
                  color: _shimmerColor,
                ),
              ),
            ),
            period: Duration(milliseconds: 1000),
          ),
        );
      },
    );
  }
}
