import 'dart:async';

import 'package:doctor_app/config/constant.dart';
import 'package:doctor_app/model/screen/product_model.dart';
import 'package:doctor_app/ui/reusable/cache_image_network.dart';
import 'package:doctor_app/ui/reusable/global_function.dart';
import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:doctor_app/ui/reusable/shimmer_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ProductList1Page extends StatefulWidget {
  @override
  _ProductList1PageState createState() => _ProductList1PageState();
}

class _ProductList1PageState extends State<ProductList1Page> {
  // initialize global function and global widget
  final _globalFunction = GlobalFunction();
  final _globalWidget = GlobalWidget();
  final _shimmerLoading = ShimmerLoading();

  bool _loading = true;
  Timer? _timerDummy;

  Color _color1 = Color(0xFF515151);
  Color _color2 = Color(0xff777777);
  List<ProductModel> _productData = [];

  @override
  void initState() {
    _getData();
    
    super.initState();
  }

  @override
  void dispose() {
    _timerDummy?.cancel();
    super.dispose();
  }

  void _getData(){
    // this timer function is just for demo, so after 2 second, the shimmer loading will disappear and show the content
    _timerDummy = Timer(Duration(seconds: 2), () {
      setState(() {
        _loading = false;
      });
    });

    _productData = [
      ProductModel(
          id: 21,
          name: "Delta Boots Import 8 Inch",
          price: 18.3,
          image: GLOBAL_URL+"/assets/images/product/25.jpg",
          rating: 5,
          review: 212,
          sale: 735,
          location: "Brooklyn"
      ),
      ProductModel(
          id: 20,
          name: "Fimi X8 SE Black",
          price: 567,
          image: GLOBAL_URL+"/assets/images/product/26.jpg",
          rating: 5,
          review: 63,
          sale: 115,
          location: "Brooklyn"
      ),
      ProductModel(
          id: 19,
          name: "Guess Collection Watch Ceramic Type GC 6004 ",
          price: 52,
          image: GLOBAL_URL+"/assets/images/product/27.jpg",
          rating: 5,
          review: 7,
          sale: 7,
          location: "Brooklyn"
      ),
      ProductModel(
          id: 17,
          name: "NEW Original Apple TV 4K 64GB 5th Generation",
          price: 261,
          image: GLOBAL_URL+"/assets/images/product/29.jpg",
          rating: 5,
          review: 98,
          sale: 263,
          location: "Brooklyn"
      ),
      ProductModel(
          id: 16,
          name: "SAMSUNG GALAXY S20 PLUS RAM 8/128GB",
          price: 751,
          image: GLOBAL_URL+"/assets/images/product/30.jpg",
          rating: 5,
          review: 14,
          sale: 17,
          location: "Brooklyn"
      ),
      ProductModel(
          id: 15,
          name: "Xiaomi Smart LED TV Mi 4",
          price: 224.14,
          image: GLOBAL_URL+"/assets/images/product/31.jpg",
          rating: 5,
          review: 701,
          sale: 1558,
          location: "Brooklyn"
      ),
      ProductModel(
          id: 14,
          name: "Adidas EQT Adv Premium Original",
          price: 28.67,
          image: GLOBAL_URL+"/assets/images/product/32.jpg",
          rating: 5,
          review: 146,
          sale: 398,
          location: "Brooklyn"
      ),
      ProductModel(
          id: 13,
          name: "Xiaomi Air Purifier 3 Mijia OLED Touch Sterilization Air Ionizer - 3",
          price: 139,
          image: GLOBAL_URL+"/assets/images/product/33.jpg",
          rating: 5,
          review: 275,
          sale: 1055,
          location: "Brooklyn"
      ),
      ProductModel(
          id: 12,
          name: "Spatula Set Stainless Kitchen Tools",
          price: 2.5,
          image: GLOBAL_URL+"/assets/images/product/34.jpg",
          rating: 5,
          review: 302,
          sale: 752,
          location: "Brooklyn"
      ),
      ProductModel(
          id: 11,
          name: "DATA CABLE TYPE-C TO TYPE-C BASEUS HALO DATA CABLE PD 2.0 60W - 0.5 M",
          price: 3,
          image: GLOBAL_URL+"/assets/images/product/35.jpg",
          rating: 5,
          review: 636,
          sale: 2087,
          location: "Brooklyn"
      ),
      ProductModel(
          id: 10,
          name: "BASEUS QUICK CHARGER HEAD QC3.0/4.0 TYPE-C+USB 30W PD 5A - USB TC",
          price: 10.6,
          image: GLOBAL_URL+"/assets/images/product/36.jpg",
          rating: 5,
          review: 2802,
          sale: 7052,
          location: "Brooklyn"
      ),
      ProductModel(
          id: 9,
          name: "Xiaomi Powerbank MI2C 20000mAh Mi Power Bank 20000 mAh PLM06ZM",
          price: 19.9,
          image: GLOBAL_URL+"/assets/images/product/37.jpg",
          rating: 5,
          review: 105,
          sale: 227,
          location: "Brooklyn"
      ),
      ProductModel(
          id: 8,
          name: "3D FASHION MASK WITH BREATHING VALVE / MASKER PM 2.5 KARBON / WASHABLE - BLACK NEW MODEL",
          price: 2.33,
          image: GLOBAL_URL+"/assets/images/product/38.jpg",
          rating: 5,
          review: 503,
          sale: 3645,
          location: "Brooklyn"
      ),
      ProductModel(
          id: 7,
          name: "Robot RT-US04 Table Phone Holder Stand Aluminium Alloy Universal - Pink",
          price: 5.3,
          image: GLOBAL_URL+"/assets/images/product/39.jpg",
          rating: 5,
          review: 1095,
          sale: 3400,
          location: "Brooklyn"
      ),
      ProductModel(
          id: 6,
          name: "Tactical Pants Blackhawk Helikon ",
          price: 10,
          image: GLOBAL_URL+"/assets/images/product/40.jpg",
          rating: 5,
          review: 63,
          sale: 131,
          location: "Brooklyn"
      ),
      ProductModel(
          id: 5,
          name: "Sony SRS- XB12 / XB 12 Extra Bass Portable Bluetooth Speaker - Black",
          price: 48,
          image: GLOBAL_URL+"/assets/images/product/41.jpg",
          rating: 5,
          review: 182,
          sale: 427,
          location: "Brooklyn"
      ),
      ProductModel(
          id: 4,
          name: "Original 100% 60W Magsafe 1 Power Adapter Charger Macbook Pro - Air",
          price: 22.66,
          image: GLOBAL_URL+"/assets/images/product/42.jpg",
          rating: 5,
          review: 131,
          sale: 466,
          location: "Brooklyn"
      ),
      ProductModel(
          id: 3,
          name: "Macbook Pro 2019 TouchBar MV912 15\" 16GB 512GB 2.3GHz 8-core i9 Gray",
          price: 2212,
          image: GLOBAL_URL+"/assets/images/product/43.jpg",
          rating: 5,
          review: 16,
          sale: 37,
          location: "Brooklyn"
      ),
      ProductModel(
          id: 2,
          name: "New imac 2017 MNEA2 5K retina /3,5GHZ/i5/8GB/1TB/RP575",
          price: 1643,
          image: GLOBAL_URL+"/assets/images/product/44.jpg",
          rating: 5,
          review: 2,
          sale: 3,
          location: "Brooklyn"
      ),
      ProductModel(
          id: 1,
          name: "Adidas Football Predator 19.3 FG F35594 Original",
          price: 9,
          image: GLOBAL_URL+"/assets/images/product/45.jpg",
          rating: 5,
          review: 30,
          sale: 70,
          location: "Brooklyn"
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.black, //change your color here
          ),
          systemOverlayStyle: SystemUiOverlayStyle.dark,
          elevation: 0,
          title: Text(
            'Product List',
            style: TextStyle(
                fontSize: 18,
                color: Colors.black
            ),
          ),
          backgroundColor: Colors.white,
          bottom: PreferredSize(
              child: Container(
                color: Colors.grey[100],
                height: 1.0,
              ),
              preferredSize: Size.fromHeight(1.0)),
          actions: [
            IconButton(
                icon: Icon(Icons.search, color: _color2),
                onPressed: () {
                  Fluttertoast.showToast(msg: 'Click search', toastLength: Toast.LENGTH_SHORT);
                }),
          ],
        ),
        body: RefreshIndicator(
          onRefresh: refreshData,
          child: (_loading == true)
              ? _shimmerLoading.buildShimmerProduct(((MediaQuery.of(context).size.width) - 24) / 2 - 12)
              : CustomScrollView(
              slivers: <Widget>[
                SliverPadding(
                  padding: EdgeInsets.fromLTRB(12, 8, 12, 8),
                  sliver: SliverGrid(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 8,
                      crossAxisSpacing: 8,
                      childAspectRatio: 0.625,
                    ),
                    delegate: SliverChildBuilderDelegate(
                          (BuildContext context, int index) {
                        return _buildItem(index);
                      },
                      childCount: _productData.length,
                    ),
                  ),
                ),
              ]
          ),
        )
    );
  }

  Widget _buildItem(index) {
    final double boxImageSize = ((MediaQuery.of(context).size.width) - 24) / 2 - 12;
    return Container(
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 2,
        color: Colors.white,
        child: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () {
            Fluttertoast.showToast(msg: 'Click '+_productData[index].name, toastLength: Toast.LENGTH_SHORT);
          },
          child: Column(
            children: <Widget>[
              ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10)),
                  child: buildCacheNetworkImage(width: boxImageSize, height: boxImageSize, url: _productData[index].image)),
              Container(
                margin: EdgeInsets.fromLTRB(8, 8, 8, 8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _productData[index].name,
                      style: TextStyle(
                          fontSize: 12,
                          color: _color1
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('\$ ' + _globalFunction.removeDecimalZeroFormat(_productData[index].price!), style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.bold
                          )),
                          Text(_productData[index].sale.toString() + ' '+'Sale', style: TextStyle(
                              fontSize: 11,
                              color: SOFT_GREY
                          ))
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 5),
                      child: Row(
                        children: [
                          Icon(Icons.location_on, color: SOFT_GREY, size: 12),
                          Text(' ' + _productData[index].location!,
                              style: TextStyle(
                                  fontSize: 11,
                                  color: SOFT_GREY
                              ))
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 5),
                      child: Row(
                        children: [
                          _globalWidget.createRatingBar(rating: _productData[index].rating!, size: 12),
                          Text('(' + _productData[index].review.toString() + ')', style: TextStyle(
                                  fontSize: 11,
                                  color: SOFT_GREY
                              )
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future refreshData() async {
    setState(() {
      _productData.clear();
      _loading = true;
      _getData();
    });
  }
}
