import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerLoading11Page extends StatefulWidget {
  @override
  _ShimmerLoading11PageState createState() => _ShimmerLoading11PageState();
}

class _ShimmerLoading11PageState extends State<ShimmerLoading11Page> {
  // initialize global widget
  final _globalWidget = GlobalWidget();

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
                title: 'Shimmer Loading 11',
                desc: 'This is the example of shimmer loading for category with horizontal scroll'
            ),
          ),
          Container(
            height: 200,
            child: buildShimmerCategoryHorizontal()
          )
        ],
      ),
    );
  }

  Widget buildShimmerCategoryHorizontal() {
    return GridView.count(
      padding: EdgeInsets.fromLTRB(16, 16, 16, 0),
      primary: false,
      childAspectRatio: 1.07,
      shrinkWrap: true,
      crossAxisSpacing: 0,
      mainAxisSpacing: 0,
      crossAxisCount: 2,
      scrollDirection: Axis.horizontal,
      children: List.generate(16, (index) {
        return Shimmer.fromColors(
          highlightColor: Colors.white,
          baseColor: _shimmerColor,
          period: Duration(milliseconds: 1000),
          child: Column(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  color: _shimmerColor,
                ),
                SizedBox(
                  height: _spaceHeight,
                ),
                Container(
                  width: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: _shimmerColor,
                  ),
                  height: 12,
                ),
              ]),
        );
      }),
    );
  }
}
