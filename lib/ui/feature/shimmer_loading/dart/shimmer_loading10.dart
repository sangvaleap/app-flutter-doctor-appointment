import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerLoading10Page extends StatefulWidget {
  @override
  _ShimmerLoading10PageState createState() => _ShimmerLoading10PageState();
}

class _ShimmerLoading10PageState extends State<ShimmerLoading10Page> {
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
                title: 'Shimmer Loading 10',
                desc: 'This is the example of shimmer loading for category'
            ),
          ),
          Container(
              child: buildShimmerCategory()
          )
        ],
      ),
    );
  }

  Widget buildShimmerCategory() {
    return GridView.count(
      padding: EdgeInsets.fromLTRB(16, 16, 16, 0),
      primary: false,
      childAspectRatio: 1.1,
      shrinkWrap: true,
      crossAxisSpacing: 0,
      mainAxisSpacing: 0,
      crossAxisCount: 4,
      children: List.generate(8, (index) {
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
