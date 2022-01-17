import 'dart:async';

import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMaps7Page extends StatefulWidget {
  @override
  _GoogleMaps7PageState createState() => _GoogleMaps7PageState();
}

class _GoogleMaps7PageState extends State<GoogleMaps7Page> {
  // initialize global widget
  final _globalWidget = GlobalWidget();

  late GoogleMapController _controller;
  bool _mapLoading = true;
  Timer? _timerDummy;

  double _currentZoom = 14;

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

  // add marker
  void _addMarker(double lat, double lng) {
    LatLng position = LatLng(lat, lng);

    // set initial marker
    _marker = Marker(
      markerId: MarkerId('marker1'),
      position: position,
      infoWindow: InfoWindow(title: 'This is marker 1'),
      onTap: () {
        Fluttertoast.showToast(msg: 'Click marker', toastLength: Toast.LENGTH_SHORT);
      },
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

  // when the Google Maps Camera is change, get the current position
  void _onGeoChanged(CameraPosition position) {
    _currentZoom = position.zoom;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _globalWidget.globalAppBar(),
      body: Stack(
        children: [
          _buildGoogleMap(),
          Positioned(
            bottom: 16,
            right: 16,
            child: GestureDetector(
              onTap: () {
                _controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target: _marker!.position, zoom: _currentZoom)));
              },
              child: Container(
                padding: EdgeInsets.all(5),
                width: 36,
                height: 36,
                color: Color(0xFFFFFFFF),
                child: Icon(
                  Icons.my_location,
                  color: Colors.grey[700],
                  size: 26,
                ),
              ),
            ),
          ),
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
      mapToolbarEnabled: false,
      markers: Set.of((_marker != null) ? [_marker!] : []),
      initialCameraPosition: CameraPosition(
        target: _initialPosition,
        zoom: _currentZoom,
      ),
      onCameraMove: _onGeoChanged,
      onMapCreated: (GoogleMapController controller) {
        _controller = controller;
        _timerDummy = Timer(Duration(milliseconds: 300), () {
          setState(() {
            _mapLoading = false;
            _addMarker(-6.168033, 106.900467);
          });
        });
      },
      onTap: (pos){
        print('currentZoom : '+_currentZoom.toString());
      },
    );
  }
}
