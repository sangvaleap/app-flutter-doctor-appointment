import 'package:carousel_slider/carousel_slider.dart';
import 'package:doctor_app/config/apps/ecommerce/constant.dart';
import 'package:doctor_app/config/apps/ecommerce/global_style.dart';
import 'package:doctor_app/model/apps/ecommerce/related_product_model.dart';
import 'package:doctor_app/model/apps/ecommerce/review_model.dart';
import 'package:doctor_app/ui/apps/ecommerce/general/chat_us.dart';
import 'package:doctor_app/ui/apps/ecommerce/general/notification.dart';
import 'package:doctor_app/ui/apps/ecommerce/general/product_detail/delivery_estimated.dart';
import 'package:doctor_app/ui/apps/ecommerce/general/product_detail/product_description.dart';
import 'package:doctor_app/ui/apps/ecommerce/general/product_detail/product_review.dart';
import 'package:doctor_app/ui/apps/ecommerce/home/product_category.dart';
import 'package:doctor_app/ui/apps/ecommerce/home/search.dart';
import 'package:doctor_app/ui/apps/ecommerce/reusable_widget.dart';
import 'package:doctor_app/ui/apps/ecommerce/shopping_cart/tab_shopping_cart.dart';
import 'package:doctor_app/ui/reusable/cache_image_network.dart';
import 'package:doctor_app/ui/reusable/global_function.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ProductDetailPage extends StatefulWidget {
  final String name;
  final String image;
  final double price;
  final double rating;
  final int review;
  final int sale;

  const ProductDetailPage({Key? key, this.name='', this.image='', this.price=24, this.rating=4, this.review=45, this.sale=63}) : super(key: key);

  @override
  _ProductDetailPageState createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  // initialize global function and reusable widget
  final _globalFunction = GlobalFunction();
  final _reusableWidget = ReusableWidget();

  final List<String> _imgProductSlider = [];
  int _currentImageSlider = 0;

  // size data
  List<String> _sizeList = ['XS', 'S', 'M', 'L', 'XL', 'XXL'];
  int _sizeIndex = 0;

  // color data
  List<String> _colorList = ['Red', 'Black', 'Green', 'White', 'Blue', 'Yellow', 'Pink'];
  int _colorIndex = 0;

  // wishlist
  bool _isLove = false;

  // shopping cart count
  int _shoppingCartCount = 3;

  @override
  void initState() {
    // image slider for the product
    _imgProductSlider.add(widget.image);
    _imgProductSlider.add(widget.image);
    _imgProductSlider.add(widget.image);
    _imgProductSlider.add(widget.image);
    _imgProductSlider.add(widget.image);

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
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: GlobalStyle.appBarIconThemeColor,
          ),
          elevation: GlobalStyle.appBarElevation,
          titleSpacing: 0.0,
          // create search text field in the app bar
          title: Container(
            margin: EdgeInsets.only(right: 16),
            child: TextButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith<Color>(
                        (Set<MaterialState> states) => Colors.grey[100]!,
                  ),
                  overlayColor: MaterialStateProperty.all(Colors.transparent),
                  shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      )
                  ),
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => SearchPage()));
                },
                child: Row(
                  children: [
                    SizedBox(width: 8),
                    Icon(Icons.search, color: Colors.grey[500], size: 18),
                    SizedBox(width: 8),
                    Text(
                      'Search Product',
                      style: TextStyle(
                          fontSize: 13,
                          color: Colors.grey[600],
                          fontWeight: FontWeight.normal),
                    )
                  ],
                )
            ),
          ),
          backgroundColor: GlobalStyle.appBarBackgroundColor,
          systemOverlayStyle: GlobalStyle.appBarSystemOverlayStyle,
          actions: [
            IconButton(
                padding: EdgeInsets.all(0),
                constraints: BoxConstraints(),
                icon: _customShoppingCart(_shoppingCartCount),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => TabShoppingCartPage()));
                }),
            IconButton(
                icon: _reusableWidget.customNotifIcon(count: 8, notifColor: BLACK_GREY),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => NotificationPage()));
                }),
          ],
          bottom: _reusableWidget.bottomAppBar(),
        ),
        body: WillPopScope(
          onWillPop: (){
            Navigator.pop(context);
            return Future.value(true);
          },
          child: Column(
            children: [
              Flexible(
                child: ListView(
                  children: [
                    _createProductSlider(),
                    _createProductPriceTitleEtc(),
                    _createProductVariant(),
                    _createDeliveryEstimated(),
                    _createProductInformation(),
                    _createProductDescription(),
                    _createProductRelated(boxImageSize),
                    _createProductReview(),
                    SizedBox(height: 16)
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(0.0, 1.0), //(x,y)
                      blurRadius: 2.0,
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Container(
                      child: GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => ChatUsPage()));
                        },
                        child: ClipOval(
                          child: Container(
                              color: SOFT_BLUE,
                              padding: EdgeInsets.all(9),
                              child: Icon(Icons.chat, color: Colors.white, size: 16)
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: (){
                          setState(() {
                            _shoppingCartCount++;
                          });
                          Fluttertoast.showToast(msg: 'Item has been added to Shopping Cart', toastLength: Toast.LENGTH_LONG);
                        },
                        child: Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.fromLTRB(12, 8, 12, 8),
                          margin: EdgeInsets.only(right: 8),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                  width: 1,
                                  color: SOFT_BLUE
                              ),
                              borderRadius: BorderRadius.all(
                                  Radius.circular(10) //         <--- border radius here
                              )
                          ),
                          child: Text('Add to Shopping Cart', style: TextStyle(
                              color: SOFT_BLUE, fontWeight: FontWeight.bold
                          )),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        )
    );
  }

  Widget _customShoppingCart(int count) {
    return Stack(
      children: <Widget>[
        Icon(Icons.shopping_cart, color: BLACK_GREY),
        Positioned(
          right: 0,
          child: Container(
            padding: EdgeInsets.all(1),
            decoration: BoxDecoration(
              color: ASSENT_COLOR,
              borderRadius: BorderRadius.circular(10),
            ),
            constraints: BoxConstraints(
              minWidth: 14,
              minHeight: 14,
            ),
            child: Center(
              child: Text(
                count.toString(),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 8,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget _createProductSlider(){
    return Stack(
      children: [
        CarouselSlider(
          items: _imgProductSlider.map((item) => Container(
            child: buildCacheNetworkImage(width: 0, height: 0, url: item),
          )).toList(),
          options: CarouselOptions(
              aspectRatio: 1,
              viewportFraction: 1.0,
              autoPlay: false,
              enlargeCenterPage: false,
              onPageChanged: (index, reason) {
                setState(() {
                  _currentImageSlider = index;
                });
              }
          ),
        ),
        Positioned(
          bottom: 16,
          left: 16,
          child: Container(
            padding: EdgeInsets.fromLTRB(8, 4, 8, 4),
            decoration: BoxDecoration(
                color: SOFT_BLUE,
                borderRadius: BorderRadius.circular(4)
            ),
            child: Text((_currentImageSlider+1).toString()+'/'+_imgProductSlider.length.toString(), style: TextStyle(
                color: Colors.white, fontSize: 11
            )),
          ),
        ),
      ],
    );
  }

  Widget _createProductPriceTitleEtc(){
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('\$'+_globalFunction.removeDecimalZeroFormat(widget.price), style: GlobalStyle.detailProductPrice),
              GestureDetector(
                onTap: (){
                  setState(() {
                    if(_isLove==true){
                      _isLove = false;
                      Fluttertoast.showToast(msg: 'Item has been deleted from your wishlist', toastLength: Toast.LENGTH_LONG);
                    } else {
                      Fluttertoast.showToast(msg: 'Item has been added to your wishlist', toastLength: Toast.LENGTH_LONG);
                      _isLove = true;
                    }
                  });
                },
                child: Icon(
                    Icons.favorite, color: _isLove==true?ASSENT_COLOR:BLACK_GREY, size: 28
                ),
              )
            ],
          ),
          SizedBox(height: 12),
          Text(widget.name, style: TextStyle(
            fontSize: 14,
          )),
          SizedBox(height: 12),
          IntrinsicHeight(
            child: Row(
              children: [
                GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ProductReviewPage()));
                  },
                  child: Row(
                    children: [
                      Icon(Icons.star, color: Colors.yellow[700], size: 18),
                      SizedBox(
                        width: 3,
                      ),
                      Text(widget.rating.toString(), style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 14
                      )),
                      SizedBox(
                        width: 3,
                      ),
                      Text('('+widget.review.toString()+')', style: TextStyle(fontSize: 13, color: BLACK_GREY)),
                    ],
                  ),
                ),
                VerticalDivider(
                  width: 30,
                  thickness: 1,
                  color: Colors.grey[300],
                ),
                Text(widget.sale.toString()+' Sale', style: TextStyle(fontSize: 13, color: BLACK_GREY)),
                VerticalDivider(
                  width: 30,
                  thickness: 1,
                  color: Colors.grey[300],
                ),
                Icon(Icons.location_on, color: SOFT_GREY, size: 16),
                Text('Brooklyn', style: TextStyle(fontSize: 13, color: SOFT_GREY))
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _createProductVariant(){
    return Container(
        margin: EdgeInsets.only(top: 12),
        padding: EdgeInsets.all(16),
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Variant', style: GlobalStyle.sectionTitle),
            SizedBox(
              height: 16,
            ),
            Row(
              children: [
                Text('Size : ', style: TextStyle(
                    color: BLACK_GREY, fontSize: 14
                )),
                Text(_sizeList[_sizeIndex], style: TextStyle(
                    fontWeight: FontWeight.bold
                )),
              ],
            ),
            Wrap(
              children: List.generate(_sizeList.length,(index){
                return radioSize(_sizeList[index],index);
              }),
            ),
            SizedBox(
              height: 16,
            ),
            Row(
              children: [
                Text('Color : ', style: TextStyle(
                    color: BLACK_GREY, fontSize: 14
                )),
                Text(_colorList[_colorIndex], style: TextStyle(
                    fontWeight: FontWeight.bold
                )),
              ],
            ),
            Wrap(
              children: List.generate(_colorList.length,(index){
                return radioColor(_colorList[index],index);
              }),
            ),
          ],
        )
    );
  }

  Widget radioSize(String txt,int index){
    return GestureDetector(
      onTap: (){
        setState(() {
          _sizeIndex = index;
        });
      },
      child: Container(
        padding: EdgeInsets.fromLTRB(12, 8, 12, 8),
        margin: EdgeInsets.only(right: 8, top: 8),
        decoration: BoxDecoration(
            color: _sizeIndex == index ? SOFT_BLUE : Colors.white,
            border: Border.all(
                width: 1,
                color: _sizeIndex == index ? SOFT_BLUE : Colors.grey[300]!
            ),
            borderRadius: BorderRadius.all(
                Radius.circular(10) //         <--- border radius here
            )
        ),
        child: Text(txt, style: TextStyle(
            color: _sizeIndex == index ? Colors.white : CHARCOAL
        )),
      ),
    );
  }

  Widget radioColor(String txt,int index){
    return GestureDetector(
      onTap: (){
        setState(() {
          _colorIndex = index;
        });
      },
      child: Container(
        padding: EdgeInsets.fromLTRB(12, 8, 12, 8),
        margin: EdgeInsets.only(right: 8, top: 8),
        decoration: BoxDecoration(
            color: _colorIndex == index ? SOFT_BLUE : Colors.white,
            border: Border.all(
                width: 1,
                color: _colorIndex == index ? SOFT_BLUE : Colors.grey[300]!
            ),
            borderRadius: BorderRadius.all(
                Radius.circular(10) //         <--- border radius here
            )
        ),
        child: Text(txt, style: TextStyle(
            color: _colorIndex == index ? Colors.white : CHARCOAL
        )),
      ),
    );
  }

  Widget _createDeliveryEstimated(){
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => DeliveryEstimatedPage()));
      },
      child: Container(
          margin: EdgeInsets.only(top: 12),
          padding: EdgeInsets.all(16),
          color: Colors.white,
          child: Row(
            children: [
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Delivery', style: GlobalStyle.sectionTitle),
                    SizedBox(
                      height: 16,
                    ),
                    RichText(
                      text: new TextSpan(
                        // Note: Styles for TextSpans must be explicitly defined.
                        // Child text spans will inherit styles from parent
                        style: new TextStyle(
                          fontSize: 15.5,
                          color: BLACK_GREY,
                        ),
                        children: <TextSpan>[
                          new TextSpan(text: 'Calculate the estimated cost for shipping goods to '),
                          new TextSpan(text: 'West New York, NJ', style: new TextStyle(fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Icon(Icons.chevron_right, size: 36, color: CHARCOAL)
            ],
          )
      ),
    );
  }

  Widget _createProductInformation(){
    return Container(
        margin: EdgeInsets.only(top: 12),
        padding: EdgeInsets.all(16),
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Information', style: GlobalStyle.sectionTitle),
            SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Weight', style: TextStyle(
                    color: BLACK_GREY
                )),
                Text('300 Gram', style: TextStyle(
                    color: BLACK_GREY
                ))
              ],
            ),
            SizedBox(
              height: 12,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Condition', style: TextStyle(
                    color: BLACK_GREY
                )),
                Text('Second', style: TextStyle(
                    color: BLACK_GREY
                ))
              ],
            ),
            SizedBox(
              height: 12,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Category', style: TextStyle(
                    color: BLACK_GREY
                )),
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ProductCategoryPage(categoryId: 3, categoryName: 'Electronic')));
                  },
                  child: Text('Electronic', style: TextStyle(
                      color: SOFT_BLUE
                  )),
                )
              ],
            ),
          ],
        )
    );
  }

  Widget _createProductDescription(){
    return Container(
        margin: EdgeInsets.only(top: 12),
        padding: EdgeInsets.all(16),
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Description', style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold
            )),
            SizedBox(
              height: 16,
            ),
            Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit.\n\nQuisque tortor tortor, ultrices id scelerisque a, elementum id elit. Maecenas feugiat tellus sed augue malesuada, id tempus ex sodales.'),
            SizedBox(
              height: 16,
            ),
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDescriptionPage(name: widget.name, image: widget.image)));
              },
              child: Center(
                child: Text('Read More', style: TextStyle(
                    color: SOFT_BLUE
                )),
              ),
            ),
          ],
        )
    );
  }

  Widget _createProductRelated(boxImageSize){
    return Container(
        margin: EdgeInsets.only(top: 12),
        padding: EdgeInsets.only(bottom:16),
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.all(16),
              child: Text('Related Product', style: GlobalStyle.sectionTitle),
            ),
            Container(
              height: boxImageSize*GlobalStyle.horizontalProductHeightMultiplication,
              child: ListView.builder(
                padding: EdgeInsets.only(left: 12, right: 12),
                scrollDirection: Axis.horizontal,
                itemCount: relatedProductData.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    width: boxImageSize+10,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      elevation: 2,
                      color: Colors.white,
                      child: GestureDetector(
                        behavior: HitTestBehavior.translucent,
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDetailPage(name: relatedProductData[index].name, image: relatedProductData[index].image, price: relatedProductData[index].price, rating: relatedProductData[index].rating, review: relatedProductData[index].review, sale: 36)));
                        },
                        child: Column(
                          children: <Widget>[
                            ClipRRect(
                                borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                                child: buildCacheNetworkImage(width: boxImageSize+10, height: boxImageSize+10, url: relatedProductData[index].image)
                            ),
                            Container(
                              margin: EdgeInsets.fromLTRB(8, 8, 8, 8),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    relatedProductData[index].name,
                                    style: GlobalStyle.productName, maxLines: 2, overflow: TextOverflow.ellipsis,
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top:5),
                                    child: Text('\$ '+_globalFunction.removeDecimalZeroFormat(relatedProductData[index].price), style: GlobalStyle.productPrice),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top:5),
                                    child: Row(
                                      children: [
                                        _reusableWidget.createRatingBar(rating: relatedProductData[index].rating, size: 12),
                                        Text('('+relatedProductData[index].review.toString()+')', style: GlobalStyle.productTotalReview)
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
                },
              ),
            ),
          ],
        )
    );
  }

  Widget _createProductReview(){
    return Container(
        margin: EdgeInsets.only(top: 12),
        padding: EdgeInsets.all(16),
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Review', style: GlobalStyle.sectionTitle),
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ProductReviewPage()));
                  },
                  child: Text('View All', style: GlobalStyle.viewAll.copyWith(color: SOFT_BLUE), textAlign: TextAlign.end),
                )
              ],
            ),
            SizedBox(
              height: 8,
            ),
            Row(
              children: [
                _reusableWidget.createRatingBar(rating: widget.rating, size: 12),
                Text('('+widget.review.toString()+')', style: TextStyle(fontSize: 11, color: SOFT_GREY))
              ],
            ),
            Column(
                children: List.generate(reviewData.length, (index) {
                  return Column(
                    children: [
                      Divider(
                        height: 32,
                        color: Colors.grey[400],
                      ),
                      Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(reviewData[index].date, style: TextStyle(fontSize: 13, color: SOFT_GREY)),
                              SizedBox(height: 4),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(reviewData[index].name, style: TextStyle(
                                      fontSize: 14, fontWeight: FontWeight.bold
                                  )),
                                  _reusableWidget.createRatingBar(rating: reviewData[index].rating, size: 12),
                                ],
                              ),
                              SizedBox(height: 4),
                              Text(reviewData[index].review)
                            ],
                          )
                      )
                    ],
                  );
                })
            ),
          ],
        )
    );
  }
}
