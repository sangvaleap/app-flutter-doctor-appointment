// Don't forget to initialize all bloc provider at main.dart

import 'package:doctor_app/bloc/product_listview/bloc.dart';
import 'package:doctor_app/model/integration/product_listview_model.dart';
import 'package:doctor_app/ui/reusable/cache_image_network.dart';
import 'package:doctor_app/ui/reusable/global_function.dart';
import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:doctor_app/ui/reusable/shimmer_loading.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ProductListviewPage extends StatefulWidget {
  @override
  _ProductListviewPageState createState() => _ProductListviewPageState();
}

class _ProductListviewPageState extends State<ProductListviewPage> {
  // initialize global function and global widget
  final _globalFunction = GlobalFunction();
  final _globalWidget = GlobalWidget();
  final _shimmerLoading = ShimmerLoading();

  List<ProductListviewModel> productListviewData = [];

  late ProductListviewBloc _productListviewProductBloc;
  int _apiPage = 0;
  ScrollController _scrollController = ScrollController();
  bool _lastData = false;
  bool _processApi = false;
  final int _apiLimit = 10;

  CancelToken apiToken = CancelToken(); // used to cancel fetch data from API

  @override
  void initState() {
    // get data when initState
    _productListviewProductBloc = BlocProvider.of<ProductListviewBloc>(context);
    _productListviewProductBloc.add(GetProductListview(sessionId: '5f0e6bfbafe255.00218389', skip: _apiPage.toString(), limit: _apiLimit.toString(), apiToken: apiToken));

    super.initState();
  }

  @override
  void dispose() {
    apiToken.cancel("cancelled"); // cancel fetch data from API
    _scrollController.dispose();

    super.dispose();
  }

  // this function used to fetch data from API if we scroll to the bottom of the page
  void _onScroll() {
    double maxScroll = _scrollController.position.maxScrollExtent;
    double currentScroll = _scrollController.position.pixels;

    if (currentScroll == maxScroll) {
      if (_lastData == false && !_processApi) {
        _productListviewProductBloc.add(GetProductListview(sessionId: '5f0e6bfbafe255.00218389', skip: _apiPage.toString(), limit: _apiLimit.toString(), apiToken: apiToken));
        _processApi = true;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final double boxImageSize = (MediaQuery.of(context).size.width / 4);
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
          elevation: 0,
          title: Text(
            'Product Listview',
            style: TextStyle(
                fontSize: 18,
                color: Colors.black
            ),
          ),
          backgroundColor: Colors.white,
          systemOverlayStyle: SystemUiOverlayStyle.dark,
          bottom: PreferredSize(
              child: Container(
                color: Colors.grey[100],
                height: 1.0,
              ),
              preferredSize: Size.fromHeight(1.0)),
        ),
        body: RefreshIndicator(
          onRefresh: refreshData,
          child: BlocListener<ProductListviewBloc, ProductListviewState>(
            listener: (context, state) {
              if(state is ProductListviewError) {
                Fluttertoast.showToast(
                    backgroundColor: Colors.red,
                    textColor: Colors.white,
                    fontSize: 13.0,
                    msg: state.errorMessage,
                    toastLength: Toast.LENGTH_LONG);
              }
              if(state is GetProductListviewSuccess) {
                _scrollController.addListener(_onScroll);
                if(state.productListviewData.length==0){
                  _lastData = true;
                } else {
                  _apiPage += _apiLimit;
                  productListviewData.addAll(state.productListviewData);
                }
                _processApi = false;
              }
            },
            child: BlocBuilder<ProductListviewBloc, ProductListviewState>(
              builder: (context, state) {
                if(state is ProductListviewError) {
                  return Container(
                      child: Center(
                          child: Text('Error occured, please try again later', style: TextStyle(
                              fontSize: 14,
                              color: Color(0xff777777)
                          ))
                      )
                  );
                } else {
                  if(_lastData && _apiPage==0){
                    return Container(
                        child: Center(
                            child: Text('No Data', style: TextStyle(
                                fontSize: 14,
                                color: Color(0xff777777)
                            ))
                        )
                    );
                  } else {
                    if(productListviewData.length==0){
                      return _shimmerLoading.buildShimmerContent();
                    } else {
                      return ListView.builder(
                        itemCount: (state is ProductListviewWaiting) ? productListviewData.length + 1 : productListviewData.length,
                        // Add one more item for progress indicator
                        padding: EdgeInsets.symmetric(vertical: 0),
                        physics: AlwaysScrollableScrollPhysics(),
                        itemBuilder: (BuildContext context, int index) {
                          if (index == productListviewData.length) {
                            return _globalWidget.buildProgressIndicator(_lastData);
                          } else {
                            return _buildItem(index, boxImageSize);
                          }
                        },
                        controller: _scrollController,
                      );
                    }
                  }
                }
              },
            ),
          ),
        )
    );
  }

  Widget _buildItem(index, boxImageSize){
    return Column(
      children: [
        GestureDetector(
          onTap: (){
            Fluttertoast.showToast(
                msg: 'Click '+productListviewData[index].name,
                toastLength: Toast.LENGTH_LONG);
          },
          child: Container(
            margin: EdgeInsets.fromLTRB(12, 6, 12, 6),
            child: Container(
              margin: EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  ClipRRect(
                      borderRadius:
                      BorderRadius.all(Radius.circular(4)),
                      child: buildCacheNetworkImage(width: boxImageSize, height: boxImageSize, url: productListviewData[index].image)),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          productListviewData[index].name,
                          style: TextStyle(
                              fontSize: 13,
                              color: Color(0xFF515151)
                          ),
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 5),
                          child: Text('\$ '+_globalFunction.removeDecimalZeroFormat(productListviewData[index].price),
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
                                  color: Color(0xFFaaaaaa), size: 12),
                              Text(' '+productListviewData[index].location,
                                  style: TextStyle(
                                      fontSize: 11,
                                      color: Color(0xFFaaaaaa)
                                  ))
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 5),
                          child: Row(
                            children: [
                              _globalWidget.createRatingBar(rating: productListviewData[index].rating, size: 12),
                              Text('('+productListviewData[index].review.toString()+')', style: TextStyle(
                                  fontSize: 11,
                                  color: Color(0xFFaaaaaa)
                              ))
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 5),
                          child: Text(productListviewData[index].sale.toString()+' Sale',
                              style: TextStyle(
                                  fontSize: 11,
                                  color: Color(0xFFaaaaaa)
                              )),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        (index == productListviewData.length - 1)
            ? Wrap()
            : Divider(
          height: 0,
          color: Colors.grey[400],
        )
      ],
    );
  }

  Future refreshData() async {
    setState(() {
      _apiPage = 0;
      _lastData = false;
      productListviewData.clear();
      _productListviewProductBloc.add(GetProductListview(sessionId: '5f0e6bfbafe255.00218389', skip: _apiPage.toString(), limit: _apiLimit.toString(), apiToken: apiToken));
    });
  }
}
