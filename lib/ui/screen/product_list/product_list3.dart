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

class ProductList3Page extends StatefulWidget {
  @override
  _ProductList3PageState createState() => _ProductList3PageState();
}

class _ProductList3PageState extends State<ProductList3Page> {
  // initialize global function and global widget
  final _globalFunction = GlobalFunction();
  final _globalWidget = GlobalWidget();
  final _shimmerLoading = ShimmerLoading();

  bool _loading = true;
  Timer? _timerDummy;

  Color _color1 = Color(0xff777777);
  Color _color2 = Color(0xFF515151);

  List<ProductModel> _productData = [];

  // _listKey is used for AnimatedList
  final GlobalKey<AnimatedListState> _listKey = GlobalKey();

  TextEditingController _etSearch = TextEditingController();

  @override
  void initState() {
    _getData();

    super.initState();
  }

  @override
  void dispose() {
    _timerDummy?.cancel();
    _etSearch.dispose();
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
          stock: 15,
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
          stock: 1,
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
          stock: 0,
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
          stock: 5,
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
          stock: 9,
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
          stock: 19,
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
          stock: 0,
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
          stock: 15,
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
          stock: 13,
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
          stock: 25,
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
          stock: 51,
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
          stock: 0,
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
          stock: 15,
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
          stock: 18,
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
          stock: 1,
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
          stock: 0,
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
          stock: 7,
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
          stock: 0,
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
          stock: 1,
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
          stock: 15,
          location: "Brooklyn"
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final double boxImageSize = (MediaQuery.of(context).size.width / 4);
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.black, //change your color here
          ),
          systemOverlayStyle: SystemUiOverlayStyle.dark,
          elevation: 0,
          title: Text(
            'Favorite List',
            style: TextStyle(
                fontSize: 18,
                color: Colors.black
            ),
          ),
          backgroundColor: Colors.white,
          // create search text field in the app bar
          bottom: PreferredSize(
            child: Container(
              decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(
                      color: Colors.grey[100]!,
                      width: 1.0,
                    )
                ),
              ),
              padding: EdgeInsets.fromLTRB(16, 0, 16, 12),
              height: kToolbarHeight,
              child: TextFormField(
                controller: _etSearch,
                textAlignVertical: TextAlignVertical.bottom,
                maxLines: 1,
                style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                onChanged: (textValue) {
                  setState(() {});
                },
                decoration: InputDecoration(
                  fillColor: Colors.grey[100],
                  filled: true,
                  hintText: 'Search favorite',
                  prefixIcon: Icon(Icons.search, color: Colors.grey[500]),
                  suffixIcon: (_etSearch.text == '')
                      ? null
                      : GestureDetector(
                      onTap: () {
                        setState(() {
                          _etSearch = TextEditingController(text: '');
                        });
                      },
                      child: Icon(Icons.close, color: Colors.grey[500])),
                  focusedBorder: UnderlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      borderSide: BorderSide(color: Colors.grey[200]!)),
                  enabledBorder: UnderlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    borderSide: BorderSide(color: Colors.grey[200]!),
                  ),
                ),
              ),
            ),
            preferredSize: Size.fromHeight(kToolbarHeight),
          ),
          actions: [
            GestureDetector(
                onTap: () {
                  Fluttertoast.showToast(msg: 'Click message', toastLength: Toast.LENGTH_SHORT);
                },
                child: Icon(Icons.email, color: _color1)),
            IconButton(
                icon: _globalWidget.customNotifIcon(count: 8, notifColor: _color1, notifSize: 24, labelSize: 14),
                //icon: _globalWidget.customNotifIcon2(8, _color1),
                onPressed: () {
                  Fluttertoast.showToast(msg: 'Click notification', toastLength: Toast.LENGTH_SHORT);
                }),
          ],
        ),
        body: RefreshIndicator(
          onRefresh: refreshData,
          child: (_loading == true)
              ? _shimmerLoading.buildShimmerContent()
              : AnimatedList(
                key: _listKey,
                initialItemCount: _productData.length,
                physics: AlwaysScrollableScrollPhysics(),
                itemBuilder: (context, index, animation) {
                  return _buildItem(_productData[index], boxImageSize, animation, index);
                },
              ),
        )
    );
  }

  Widget _buildItem(ProductModel productData, boxImageSize, animation, index){
    return SizeTransition(
      sizeFactor: animation,
      child: Container(
        margin: EdgeInsets.fromLTRB(12, 6, 12, 0),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          elevation: 2,
          color: Colors.white,
          child: Container(
            margin: EdgeInsets.all(8),
            child: Column(
              children: [
                GestureDetector(
                  onTap: (){
                    Fluttertoast.showToast(msg: 'Click '+productData.name, toastLength: Toast.LENGTH_SHORT);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      ClipRRect(
                          borderRadius:
                          BorderRadius.all(Radius.circular(10)),
                          child: buildCacheNetworkImage(width: boxImageSize, height: boxImageSize, url: productData.image)),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              productData.name,
                              style: TextStyle(
                                  fontSize: 13,
                                  color: _color2
                              ),
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 5),
                              child: Text('\$ '+_globalFunction.removeDecimalZeroFormat(productData.price!),
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold
                                  )),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 5),
                              child: Row(
                                children: [
                                  Icon(Icons.location_on,
                                      color: SOFT_GREY, size: 12),
                                  Text(' '+productData.location!,
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
                                  _globalWidget.createRatingBar(rating: productData.rating!, size: 12),
                                  Text('('+productData.review.toString()+')', style: TextStyle(
                                      fontSize: 11,
                                      color: SOFT_GREY
                                  ))
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 5),
                              child: Text(productData.sale.toString()+' '+'Sale',
                                  style: TextStyle(
                                      fontSize: 11,
                                      color: SOFT_GREY
                                  )),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 12),
                  child: Row(
                    children: [
                      GestureDetector(
                        behavior: HitTestBehavior.translucent,
                        onTap: () {
                          showPopupDeleteFavorite(index, boxImageSize);
                        },
                        child: Container(
                          padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                          height: 30,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                  width: 1, color: Colors.grey[300]!)),
                          child: Icon(Icons.delete,
                              color: _color1, size: 20),
                        ),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Expanded(
                        child: (productData.stock==0)
                          ? TextButton(
                            style: ButtonStyle(
                              minimumSize: MaterialStateProperty.all(
                                  Size(0, 30)
                              ),
                              backgroundColor: MaterialStateProperty.resolveWith<Color>(
                                    (Set<MaterialState> states) => Colors.grey[300]!,
                              ),
                              overlayColor: MaterialStateProperty.all(Colors.transparent),
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                  )
                              ),
                            ),
                            onPressed: null,
                            child: Text(
                              'Out of Stock',
                              style: TextStyle(
                                  color: Colors.grey[600],
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13
                              ),
                              textAlign: TextAlign.center,
                            )
                        )
                        : OutlinedButton(
                            onPressed: () {
                              Fluttertoast.showToast(msg: 'Item has been added to Shopping Cart');
                            },
                            style: ButtonStyle(
                                minimumSize: MaterialStateProperty.all(
                                    Size(0, 30)
                                ),
                                overlayColor: MaterialStateProperty.all(Colors.transparent),
                                shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5.0),
                                    )
                                ),
                                side: MaterialStateProperty.all(
                                  BorderSide(
                                      color: SOFT_BLUE,
                                      width: 1.0
                                  ),
                                )
                            ),
                            child: Text(
                              'Add to Shopping Cart',
                              style: TextStyle(
                                  color: SOFT_BLUE,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13
                              ),
                              textAlign: TextAlign.center,
                            )
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void showPopupDeleteFavorite(index, boxImageSize) {
    // set up the buttons
    Widget cancelButton = TextButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: Text('No', style: TextStyle(color: SOFT_BLUE))
    );
    Widget continueButton = TextButton(
        onPressed: () {
          int removeIndex = index;
          var removedItem = _productData.removeAt(removeIndex);
          // This builder is just so that the animation has something
          // to work with before it disappears from view since the original
          // has already been deleted.
          AnimatedListRemovedItemBuilder builder = (context, animation) {
            // A method to build the Card widget.
            return _buildItem(removedItem, boxImageSize, animation, removeIndex);
          };
          _listKey.currentState!.removeItem(removeIndex, builder);

          Navigator.pop(context);
          Fluttertoast.showToast(msg: 'Item has been deleted from your favorite', toastLength: Toast.LENGTH_SHORT);
        },
        child: Text('Yes', style: TextStyle(color: SOFT_BLUE))
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      title: Text('Delete Favorite', style: TextStyle(fontSize: 18),),
      content: Text('Are you sure to delete this item from your Favorite ?', style: TextStyle(fontSize: 13, color: _color1)),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
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
