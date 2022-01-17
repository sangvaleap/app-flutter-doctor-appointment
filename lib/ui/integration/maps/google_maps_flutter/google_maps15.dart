/*
To get address from latitude and longitude, you must use geocoding plugins
geocoding => to get address from Latitude and Longitude (https://pub.dev/packages/geocoding)
 */

import 'dart:async';

import 'package:doctor_app/config/apps/food_delivery/constant.dart';
import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMaps15Page extends StatefulWidget {
  @override
  _GoogleMaps15PageState createState() => _GoogleMaps15PageState();
}

class _GoogleMaps15PageState extends State<GoogleMaps15Page> {
  // initialize global widget
  final _globalWidget = GlobalWidget();

  late GoogleMapController _controller;
  bool _mapLoading = true;
  Timer? _timerDummy;

  final LatLng _initialPosition = LatLng(-6.168033, 106.900467);

  Marker? _marker;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _timerDummy?.cancel();
    super.dispose();
  }

  String _address = '';
  Future<void> _getAddress(lat, long) async {
    placemarkFromCoordinates(lat, long).then((placemarks) {
      var output;
      if (placemarks.isNotEmpty) {
        output = placemarks[0].toJson();
        setState(() {
          _address = output['street']+', '+output['subLocality']+', '+output['locality']+', '+output['subAdministrativeArea']+', '+output['administrativeArea']+', '+output['postalCode']+', '+output['country'];
        });
      } else {
        setState(() {
          _address = 'result not found';
        });
      }
    });
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

    _getAddress(lat, lng);

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
      appBar: _globalWidget.globalAppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.all(16),
            child: _globalWidget.createDetailWidget(
                title: 'Google Maps 15 (Get address from latitude and longitude)',
                desc: 'This is the example of google maps with geocoder. If you tap on the maps, the address will change according the latitude and longitude'
            ),
          ),
          Expanded(
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
                ):SizedBox.shrink(),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(16),
            child: Text(_address==''?'This is address text.':_address, style: TextStyle(
                color: BLACK77,
                fontSize: 16
            )),
          ),
        ],
      ),
    );
  }

  // build google maps to used inside widget
  Widget _buildGoogleMap() {
    return GoogleMap(
      mapType: MapType.normal,
      trafficEnabled: false,
      compassEnabled: true,
      rotateGesturesEnabled: true,
      scrollGesturesEnabled: true,
      tiltGesturesEnabled: true,
      zoomControlsEnabled: false,
      zoomGesturesEnabled: true,
      myLocationButtonEnabled: false,
      myLocationEnabled: true,
      mapToolbarEnabled: true,
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
            _addMarker(-6.168033, 106.900467);
          });
        });
      },
      onTap: (position){
        setState(() {
          _marker = Marker(
            markerId: MarkerId('marker1'),
            position: position,
            icon: BitmapDescriptor.defaultMarker,
          );
          _getAddress(position.latitude, position.longitude);
        });
      },
    );
  }
}
