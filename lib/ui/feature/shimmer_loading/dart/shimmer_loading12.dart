import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerLoading12Page extends StatefulWidget {
  @override
  _ShimmerLoading12PageState createState() => _ShimmerLoading12PageState();
}

class _ShimmerLoading12PageState extends State<ShimmerLoading12Page> {
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
                title: 'Shimmer Loading 12',
                desc: 'This is the example of shimmer loading for content list'
            ),
          ),
          Container(
              height: 200,
              child: buildShimmerList()
          )
        ],
      ),
    );
  }

  Widget buildShimmerList() {
    return Container(
      child: Shimmer.fromColors(
        highlightColor: Colors.white,
        baseColor: _shimmerColor,
        period: Duration(milliseconds: 1000),
        child: Container(
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: _shimmerColor,
                      ),
                      height: _containerHeight,
                    ),
                    SizedBox(
                      height: _spaceHeight,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: _shimmerColor,
                      ),
                      height: _containerHeight,
                    ),
                    SizedBox(
                      height: _spaceHeight,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: _shimmerColor,
                      ),
                      height: _containerHeight,
                    ),
                    SizedBox(
                      height: _spaceHeight,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: _shimmerColor,
                      ),
                      height: _containerHeight,
                    ),
                    SizedBox(
                      height: _spaceHeight,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: _shimmerColor,
                      ),
                      height: _containerHeight,
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
