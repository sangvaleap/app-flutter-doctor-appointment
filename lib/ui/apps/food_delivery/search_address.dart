import 'dart:async';

import 'package:doctor_app/config/apps/food_delivery/constant.dart';
import 'package:doctor_app/config/apps/food_delivery/global_style.dart';
import 'package:doctor_app/model/apps/food_delivery/search_address_model.dart';
import 'package:doctor_app/ui/apps/food_delivery/add_address.dart';
import 'package:doctor_app/ui/reusable/shimmer_loading.dart';
import 'package:flutter/material.dart';

class SearchAddressPage extends StatefulWidget {
  @override
  _SearchAddressPageState createState() => _SearchAddressPageState();
}

class _SearchAddressPageState extends State<SearchAddressPage> {
  // initialize shimmer loading
  final _shimmerLoading = ShimmerLoading();

  bool _loading = true;
  Timer? _timerDummy;

  List<SearchAddressModel> _searchData = [];
  List<SearchAddressModel> _addressData = [];

  TextEditingController _etSearch = TextEditingController();
  bool _loadData = false;
  Timer? _debounce;

  @override
  void initState() {
    _getData();
    super.initState();
  }

  @override
  void dispose() {
    _timerDummy?.cancel();

    _etSearch.dispose();
    _debounce?.cancel();
    super.dispose();
  }

  void _getData(){
    _searchData = [
      SearchAddressModel(
          id: 1,
          place: 'Hilltop Playground',
          address: 'Hopkinson Avenue &, Pacific St, Brooklyn, NY 11233, United States'
      ),
      SearchAddressModel(
          id: 2,
          place: 'High Definition Kids Preschool Day Care Center',
          address: '1967 Bedford Ave, Brooklyn, NY 11225, United States'
      ),
      SearchAddressModel(
          id: 3,
          place: 'Crown Heights Apartments',
          address: '1055 St Johns Pl, Brooklyn, NY 11213, United States'
      ),
    ];
  }

  void _getAddressData(){
    setState(() {
      _loading = true;
      _loadData = true;
    });

    // this timer function is just for demo, so after 1 second, the shimmer loading will disappear and show the content
    _timerDummy = Timer(Duration(seconds: 1), () {
      setState(() {
        _loading = false;
      });
    });

    _addressData = [
      SearchAddressModel(
          id: 1,
          place: 'Hilltop Playground',
          address: 'Hopkinson Avenue &, Pacific St, Brooklyn, NY 11233, United States'
      ),
      SearchAddressModel(
          id: 2,
          place: 'St Mark\'s Day School',
          address: '1346 President St, Brooklyn, NY 11213, United States'
      ),
      SearchAddressModel(
          id: 3,
          place: 'Uncommon Charter High School',
          address: '1485 Pacific St, Brooklyn, NY 11216, United States'
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            iconTheme: IconThemeData(
              color: GlobalStyle.appBarIconThemeColor,
            ),
            systemOverlayStyle: GlobalStyle.appBarSystemOverlayStyle,
            centerTitle: true,
            titleSpacing: 0.0,
            backgroundColor: GlobalStyle.appBarBackgroundColor,
            elevation: 0,
            // create search text field in the app bar
            title: Container(
              margin: EdgeInsets.only(right: 16),
              height: kToolbarHeight - 16,
              child: TextField(
                controller: _etSearch,
                autofocus: true,
                textInputAction: TextInputAction.search,
                onTap: (){
                  setState(() {
                    _loadData = false;
                  });
                },
                onChanged: (textValue){
                  if (_debounce?.isActive ?? false) _debounce!.cancel();
                  _debounce = Timer(const Duration(milliseconds: 500), () {
                    if(textValue.length > 1){
                      _getAddressData();
                    }
                  });
                },
                maxLines: 1,
                style: TextStyle(fontSize: 13, color: Colors.grey[500]),
                decoration: InputDecoration(
                  prefixIcon:
                  Icon(Icons.search, color: Colors.grey[500], size: 18),
                  suffixIcon: (_etSearch.text == '')
                      ? null
                      : GestureDetector(
                          onTap: () {
                            setState(() {
                              _etSearch = TextEditingController(text: '');
                            });
                          },
                          child: Icon(Icons.close, color: Colors.grey[500], size: 18)),
                  contentPadding: EdgeInsets.all(0),
                  isDense: true,
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.all(
                      Radius.circular(5),
                    ),
                  ),
                  filled: true,
                  fillColor: Colors.grey[100],
                  hintText: 'Enter Address',
                  hintStyle: TextStyle(fontSize: 13, color: Colors.grey[500]),
                ),
              ),
            )),
        body: WillPopScope(
          onWillPop: () {
            Navigator.pop(context);
            FocusScope.of(context).unfocus();
            return Future.value(true);
          },
          // if search field is empty, show history search
          // if search field not empty, show search text
          child: _loadData
              ? _loadNewData()
              : _etSearch.text == ''
                ? _showHistorySearch()
                : SizedBox.shrink(),
        ));
  }

  Widget _loadNewData(){
    final double boxImageSize = (MediaQuery.of(context).size.width / 4);
    return (_loading==true)
        ? _shimmerLoading.buildShimmerContent()
        : ListView.builder(
            itemCount: _addressData.length,
            padding: EdgeInsets.symmetric(vertical: 0),
            physics: AlwaysScrollableScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              return _buildItem(index, boxImageSize);
            },
          );
  }

  Widget _buildItem(index, boxImageSize){
    return Column(
      children: [
        GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => AddAddressPage()));
          },
          child: Row(
            children: [
              Container(
                margin: EdgeInsets.all(24),
                child: Icon(Icons.place, color: ASSENT_COLOR, size: 20)
              ),
              Flexible(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(_addressData[index].place, style: TextStyle(
                        color: Colors.black, fontSize: 14
                    ), maxLines: 1, overflow: TextOverflow.ellipsis),
                    SizedBox(height: 2),
                    Text(_addressData[index].address, style: TextStyle(
                        color: SOFT_GREY, fontSize: 13
                    ), maxLines: 1, overflow: TextOverflow.ellipsis)
                  ],
                ),
              )
            ],
          ),
        ),
        (index == _addressData.length - 1)
            ? Wrap()
            : Divider(
          height: 0,
          color: Colors.grey[400],
        )
      ],
    );
  }

  Widget _showHistorySearch(){
    return ListView(
      padding: EdgeInsets.all(16),
      children: [
        _searchData.length==0?Wrap():Container(
          child: Text('Last Search', style: GlobalStyle.lastSearchTitle),
        ),
        _searchData.length==0?Wrap():Column(
          children: List.generate(_searchData.length, (index) {
            return _buildLastSearchList(index);
          }),
        ),
      ],
    );
  }

  Widget _buildLastSearchList(index){
    return Container(
      margin: EdgeInsets.only(top: 16),
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          FocusScope.of(context).unfocus();
          _getAddressData();
          setState(() {
            _etSearch.text = _searchData[index].place;
          });
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Container(
                child: Row(
                  children: [
                    Icon(Icons.access_time, color: SOFT_GREY, size: 16),
                    SizedBox(width: 12),
                    Flexible(
                      child: Text(_searchData[index].place,
                          style: TextStyle(color: BLACK55), overflow: TextOverflow.ellipsis, maxLines: 1),
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
                onTap: (){
                  setState(() {
                    _searchData.removeAt(index);
                  });
                },
                child: Icon(Icons.close, color: BLACK77, size: 18)
            ),
          ],
        ),
      ),
    );
  }
}
