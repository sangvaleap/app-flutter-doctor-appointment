import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerLoading9Page extends StatefulWidget {
  @override
  _ShimmerLoading9PageState createState() => _ShimmerLoading9PageState();
}

class _ShimmerLoading9PageState extends State<ShimmerLoading9Page> {
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
                title: 'Shimmer Loading 9',
                desc: 'This is the example of shimmer loading for trending'
            ),
          ),
          Container(
              child: buildShimmerTrending(MediaQuery.of(context).size.width/2)
          )
        ],
      ),
    );
  }

  Widget buildShimmerTrending(boxImageSize) {
    return GridView.count(
      padding: EdgeInsets.symmetric(horizontal: 12),
      primary: false,
      childAspectRatio: 4/1.6,
      shrinkWrap: true,
      crossAxisSpacing: 2,
      mainAxisSpacing: 2,
      crossAxisCount: 2,
      children: List.generate(4, (index) {
        return Container(
          child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              elevation: 2,
              color: Colors.white,
              child: Shimmer.fromColors(
                highlightColor: Colors.white,
                baseColor: _shimmerColor,
                period: Duration(milliseconds: 1000),
                child: Row(
                  children: [
                    ClipRRect(
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(10), bottomLeft: Radius.circular(10)),
                        child: Container(
                          width: (boxImageSize)*(1.6/4)-12-1,
                          height: (boxImageSize)*(1.6/4)-12-1,
                          color: _shimmerColor,
                        )
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.all(10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
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
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              )
          ),
        );
      }),
    );
  }
}
