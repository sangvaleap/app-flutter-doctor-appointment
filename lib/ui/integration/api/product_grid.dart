// Don't forget to initialize all bloc provider at main.dart

import 'package:doctor_app/bloc/product_grid/bloc.dart';
import 'package:doctor_app/model/integration/product_grid_model.dart';
import 'package:doctor_app/ui/reusable/cache_image_network.dart';
import 'package:doctor_app/ui/reusable/global_function.dart';
import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:doctor_app/ui/reusable/shimmer_loading.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ProductGridPage extends StatefulWidget {
  @override
  _ProductGridPageState createState() => _ProductGridPageState();
}

class _ProductGridPageState extends State<ProductGridPage> {
  // initialize global function, global widget and shimmer loading
  final _globalFunction = GlobalFunction();
  final _globalWidget = GlobalWidget();
  final _shimmerLoading = ShimmerLoading();

  List<ProductGridModel> productGridData = [];

  late ProductGridBloc _productGridBloc;
  int _apiPage = 0;
  ScrollController _scrollController = ScrollController();
  bool _lastData = false;
  bool _processApi = false;
  final int _apiLimit = 10;

  CancelToken apiToken = CancelToken(); // used to cancel fetch data from API

  @override
  void initState() {
    // get data when initState
    _productGridBloc = BlocProvider.of<ProductGridBloc>(context);
    _productGridBloc.add(GetProductGrid(sessionId: '5f0e6bfbafe255.00218389', skip: _apiPage.toString(), limit: _apiLimit.toString(), apiToken: apiToken));

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
        _productGridBloc.add(GetProductGrid(sessionId: '5f0e6bfbafe255.00218389', skip: _apiPage.toString(), limit: _apiLimit.toString(), apiToken: apiToken));
        _processApi = true;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
          elevation: 0,
          title: Text(
            'Product Grid',
            style: TextStyle(
                fontSize: 18,
                color: Colors.black
            ),
          ),
          backgroundColor: Colors.white,
          systemOverlayStyle: SystemUiOverlayStyle.dark,
          actions: [
            IconButton(
                icon: Icon(Icons.search, color: Color(0xff777777)),
                onPressed: () {
                  Fluttertoast.showToast(
                      msg: 'Click Search',
                      toastLength: Toast.LENGTH_LONG);
                }),
          ],
          bottom: PreferredSize(
              child: Container(
                color: Colors.grey[100],
                height: 1.0,
              ),
              preferredSize: Size.fromHeight(1.0)),
        ),
        body: WillPopScope(
          onWillPop: () {
            Navigator.pop(context);
            return Future.value(true);
          },
          child: RefreshIndicator(
            onRefresh: refreshData,
            child: BlocListener<ProductGridBloc, ProductGridState>(
              listener: (context, state) {
                if (state is ProductGridError) {
                  Fluttertoast.showToast(
                      backgroundColor: Colors.red,
                      textColor: Colors.white,
                      fontSize: 13.0,
                      msg: state.errorMessage,
                      toastLength: Toast.LENGTH_LONG);
                }
                if (state is GetProductGridSuccess) {
                  _scrollController.addListener(_onScroll);
                  if (state.productGridData.length == 0) {
                    _lastData = true;
                  } else {
                    _apiPage += _apiLimit;
                    productGridData.addAll(state.productGridData);
                  }
                  _processApi = false;
                }
              },
              child: BlocBuilder<ProductGridBloc, ProductGridState>(
                builder: (context, state) {
                  if (state is ProductGridError) {
                    return Container(
                        child: Center(
                            child: Text('Error occured, please try again later',
                                style:
                                TextStyle(fontSize: 14, color: Color(0xff777777)))));
                  } else {
                    if (_lastData && _apiPage == 0) {
                      return Container(
                          child: Center(
                              child: Text('No Data',
                                  style: TextStyle(
                                      fontSize: 14, color: Color(0xff777777)))));
                    } else {
                      if (productGridData.length == 0) {
                        return _shimmerLoading.buildShimmerProduct(((MediaQuery.of(context).size.width) - 24) / 2 - 12);
                      } else {
                        return CustomScrollView(
                            shrinkWrap: true,
                            primary: false,
                            controller: _scrollController,
                            physics: AlwaysScrollableScrollPhysics(),
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
                                      return _buildProductGridCard(index);
                                    },
                                    childCount: productGridData.length,
                                  ),
                                ),
                              ),
                              SliverToBoxAdapter(
                                child: _globalWidget.buildProgressIndicator(_lastData),
                              ),
                            ]);
                      }
                    }
                  }
                },
              ),
            ),
          ),
        ));
  }

  Widget _buildProductGridCard(index) {
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
            Fluttertoast.showToast(
                msg: 'Click '+productGridData[index].name,
                toastLength: Toast.LENGTH_LONG);
          },
          child: Column(
            children: <Widget>[
              ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10)),
                  child: buildCacheNetworkImage(width: boxImageSize, height: boxImageSize, url: productGridData[index].image)),
              Container(
                margin: EdgeInsets.fromLTRB(8, 8, 8, 8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      productGridData[index].name,
                      style: TextStyle(
                          fontSize: 12,
                          color: Color(0xFF515151)
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('\$ ' + _globalFunction.removeDecimalZeroFormat(productGridData[index].price), style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.bold
                          )),
                          Text(productGridData[index].sale.toString() + ' Sale', style: TextStyle(
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
                          Icon(Icons.location_on, color: Color(0xFFaaaaaa), size: 12),
                          Text(' ' + productGridData[index].location,
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
                          _globalWidget.createRatingBar(rating: productGridData[index].rating, size: 12),
                          Text(
                              '(' +
                                  productGridData[index].review.toString() +
                                  ')',
                              style: TextStyle(
                                  fontSize: 11,
                                  color: Color(0xFFaaaaaa)
                              ))
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
      _apiPage = 0;
      _lastData = false;
      productGridData.clear();
      _productGridBloc.add(GetProductGrid(sessionId: '5f0e6bfbafe255.00218389', skip: _apiPage.toString(), limit: _apiLimit.toString(), apiToken: apiToken));
    });
  }
}
