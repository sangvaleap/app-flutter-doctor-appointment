import 'dart:async';

import 'package:doctor_app/config/apps/food_delivery/constant.dart';
import 'package:doctor_app/config/apps/food_delivery/global_style.dart';
import 'package:doctor_app/ui/apps/food_delivery/reusable_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class RestaurantInformationPage extends StatefulWidget {
  @override
  _RestaurantInformationPageState createState() => _RestaurantInformationPageState();
}

class _RestaurantInformationPageState extends State<RestaurantInformationPage> {
  // initialize reusable widget
  final _reusableWidget = ReusableWidget();

  late GoogleMapController _controller;
  bool _mapLoading = true;
  Timer? _timerDummy;

  final LatLng _initialPosition = LatLng(40.675416, -73.914554);

  Marker? _marker;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    if(!kIsWeb) {
      _timerDummy?.cancel();
    }
    super.dispose();
  }

  // add marker
  void _addMarker(double lat, double lng) {
    LatLng position = LatLng(lat, lng);

    // set initial marker
    _marker = Marker(
      markerId: MarkerId('marker1'),
      position: position,
      icon: BitmapDescriptor.defaultMarker,
    );

    CameraUpdate u2 = CameraUpdate.newCameraPosition(CameraPosition(target: position, zoom: 15));

    this._controller.moveCamera(u2).then((void v) {
      _check(u2, this._controller);
    });
  }

  /* start additional function for camera update
  - we get this function from the internet
  - if we don't use this function, the camera will not work properly (Zoom to marker sometimes not work)
  */
  void _check(CameraUpdate u, GoogleMapController c) async {
    c.moveCamera(u);
    _controller.moveCamera(u);
    LatLngBounds l1 = await c.getVisibleRegion();
    LatLngBounds l2 = await c.getVisibleRegion();

    if (l1.southwest.latitude == -90 || l2.southwest.latitude == -90)
      _check(u, c);
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
        title: Text('Restaurant Information', style: GlobalStyle.appBarTitle),
        backgroundColor: GlobalStyle.appBarBackgroundColor,
        bottom: _reusableWidget.bottomAppBar(),
      ),
      body: ListView(
        children: [
          (!kIsWeb)
          ? Container(
            height: MediaQuery.of(context).size.width/2,
            child: Stack(
              children: [
                _buildGoogleMap(),
                (_mapLoading)?Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  color: Colors.grey[100],
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                ):SizedBox.shrink()
              ],
            ),
          ):SizedBox.shrink(),
          _buildMerchantTop(),
          _reusableWidget.divider2(),
          _buildAddressDetail(),
          SizedBox(height: 16),
          _buildOpeningHours()
        ],
      ),
    );
  }

  // build google maps to used inside widget
  Widget _buildGoogleMap() {
    return GoogleMap(
      mapType: MapType.normal,
      trafficEnabled: false,
      compassEnabled: false,
      rotateGesturesEnabled: false,
      scrollGesturesEnabled: false,
      tiltGesturesEnabled: false,
      zoomControlsEnabled: false,
      zoomGesturesEnabled: false,
      myLocationButtonEnabled: true,
      myLocationEnabled: true,
      mapToolbarEnabled: false,
      markers: Set.of((_marker != null) ? [_marker!] : []),
      initialCameraPosition: CameraPosition(
        target: _initialPosition,
        zoom: 14,
      ),
      onMapCreated: (GoogleMapController controller) {
        _controller = controller;
        _timerDummy = Timer(Duration(milliseconds: 300), () {
          setState(() {
            _mapLoading = false;
            _addMarker(40.675416, -73.914554);
          });
        });
      },
    );
  }

  Widget _buildMerchantTop(){
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 16),
          Text('Preferred Merchants', style: GlobalStyle.preferredMerchant),
          SizedBox(height: 8),
          Text('Steam Boat Lovers - Lefferts Avenue', style: GlobalStyle.restaurantTitle, maxLines: 2, overflow: TextOverflow.ellipsis),
          SizedBox(height: 4),
          Text('Hot, Fresh, Steam', style: GlobalStyle.restaurantTag),
          SizedBox(height: 8),
          Row(
            children: [
              Icon(Icons.star, color: Colors.orange, size: 15),
              SizedBox(width: 2),
              Text('4.9', style: GlobalStyle.textRatingDistances),
              SizedBox(width: 6),
              Icon(Icons.location_pin, color: ASSENT_COLOR, size: 15),
              SizedBox(width: 2),
              Text('0.7 miles', style: GlobalStyle.textRatingDistances),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildAddressDetail(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text('Address Detail', style: GlobalStyle.addressDetailTitle),
        ),
        SizedBox(height: 8),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam eu risus nec arcu cursus accumsan in id felis. Lorem ipsum dolor sit amet, consectetur adipiscing elit.', style: GlobalStyle.addressDetailValue),
        )
      ],
    );
  }

  Widget _buildOpeningHours(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text('Opening Hours', style: GlobalStyle.oph),
        ),
        SizedBox(height: 8),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Sunday', style: GlobalStyle.ophDay),
                  Text('07:00 - 20:00', style: GlobalStyle.ophValue),
                ],
              ),
              SizedBox(height: 6),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Monday', style: GlobalStyle.ophDay),
                  Text('Closed', style: GlobalStyle.ophValue),
                ],
              ),
              SizedBox(height: 6),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Tuesday', style: GlobalStyle.ophDay),
                  Text('07:00 - 20:00', style: GlobalStyle.ophValue),
                ],
              ),
              SizedBox(height: 6),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Wednesday', style: GlobalStyle.ophDay),
                  Text('07:00 - 20:00', style: GlobalStyle.ophValue),
                ],
              ),
              SizedBox(height: 6),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Thursday', style: GlobalStyle.ophDay),
                  Text('07:00 - 20:00', style: GlobalStyle.ophValue),
                ],
              ),
              SizedBox(height: 6),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Friday', style: GlobalStyle.ophDay),
                  Text('07:00 - 20:00', style: GlobalStyle.ophValue),
                ],
              ),
              SizedBox(height: 6),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Saturday', style: GlobalStyle.ophDay),
                  Text('07:00 - 20:00', style: GlobalStyle.ophValue),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}
