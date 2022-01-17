import 'package:doctor_app/config/constant.dart';
import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:doctor_app/ui/screen/product_list/product_list1.dart';
import 'package:doctor_app/ui/screen/product_list/product_list2.dart';
import 'package:doctor_app/ui/screen/product_list/product_list3.dart';
import 'package:doctor_app/ui/screen/product_list/product_list4.dart';
import 'package:doctor_app/ui/screen/product_list/product_list5.dart';
import 'package:flutter/material.dart';

class ProductListPage extends StatefulWidget {
  @override
  _ProductListPageState createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  // initialize global widget
  final _globalWidget = GlobalWidget();

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
          padding: EdgeInsets.fromLTRB(24, 24, 24, 16),
          children: [
            Container(
              child: Text('Product List Screen', style: TextStyle(
                  fontSize: 18, color: BLACK21, fontWeight: FontWeight.w500
              )),
            ),
            Container(
              margin: EdgeInsets.only(top: 24),
              child: Row(
                children: [
                  Flexible(
                      flex:5,
                      child: Container(
                        child: Text('Product list used to listing product data.', style: TextStyle(
                            fontSize: 15, color: BLACK77,letterSpacing: 0.5
                        )),
                      )
                  ),
                  Flexible(
                      flex: 2,
                      child: Container(
                          alignment: Alignment.center,
                          child: Icon(Icons.list_alt, size: 50, color: SOFT_BLUE))
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 48),
              child: Text('Product List', style: TextStyle(
                  fontSize: 18, color: BLACK21, fontWeight: FontWeight.w500
              )),
            ),
            SizedBox(height: 18),
            _globalWidget.screenDetailList(context: context, title: 'Product List 1 (Grid View)', page: ProductList1Page()),
            _globalWidget.screenDetailList(context: context, title: 'Product List 2 (List View)', page: ProductList2Page()),
            _globalWidget.screenDetailList(context: context, title: 'Product List 3 (Favorite)', page: ProductList3Page()),
            _globalWidget.screenDetailList(context: context, title: 'Product List 4 (Horizontal)', page: ProductList4Page()),
            _globalWidget.screenDetailList(context: context, title: 'Product List 5 (Grid Trending Product)', page: ProductList5Page()),
          ],
        )
    );
  }
}
