/*
https://pub.dev/packages/sticky_headers
*/
import 'package:doctor_app/model/feature/product_model.dart';
import 'package:doctor_app/ui/reusable/cache_image_network.dart';
import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';
import 'package:sticky_headers/sticky_headers.dart';

class StickyHeader3Page extends StatefulWidget {
  @override
  _StickyHeader3PageState createState() => _StickyHeader3PageState();
}

class _StickyHeader3PageState extends State<StickyHeader3Page> {
  // initialize global widget
  final _globalWidget = GlobalWidget();

  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: _globalWidget.globalAppBar(),
        body: SingleChildScrollView(
          primary: true,
          padding: EdgeInsets.fromLTRB(24, 24, 24, 16),
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _globalWidget.createDetailWidget(
                    title: 'Sticky Header 3 - Headers overlapping the Content',
                    desc: 'This is the example of headers overlapping the content on Sticky Header'
                ),
                SizedBox(height: 16),
                Column(
                  children: List.generate(productData.length-1, (index) {
                    return Container(
                      child: StickyHeaderBuilder(
                        overlapHeaders: true,
                        builder: (BuildContext context, double stuckAmount) {
                          stuckAmount = 1.0 - stuckAmount.clamp(0.0, 1.0);
                          return Container(
                            height: 50.0,
                            color: Colors.grey.shade900.withOpacity(0.6 + stuckAmount * 0.4),
                            padding: EdgeInsets.symmetric(horizontal: 16.0),
                            alignment: Alignment.centerLeft,
                            child: Text(
                              productData[index].name,
                              style: const TextStyle(color: Colors.white),
                            ),
                          );
                        },
                        content: Container(
                          margin: EdgeInsets.only(bottom: 24),
                          child: buildCacheNetworkImage(url: productData[index].image),
                        ),
                      ),
                    );
                  }),
                ),
              ],
            ),
          ),
        )
    );
  }
}