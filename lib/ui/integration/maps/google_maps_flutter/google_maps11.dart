import 'dart:async';

import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMaps11Page extends StatefulWidget {
  @override
  _GoogleMaps11PageState createState() => _GoogleMaps11PageState();
}

class _GoogleMaps11PageState extends State<GoogleMaps11Page> {
  // initialize global widget
  final _globalWidget = GlobalWidget();

  late GoogleMapController _controller;
  bool _mapLoading = true;
  Timer? _timerDummy;

  // latlng is for moving gps
  List<LatLng> _latlng = [];

  // to drawing polylines of moving gps and distance
  Map<PolylineId, Polyline> _mapPolylines = {};

  double _currentZoom = 14;

  final LatLng _initialPosition = LatLng(-6.168033, 106.900467);

  @override
  void initState() {
    _latlng.add(LatLng(-6.168033, 106.900467));
    _latlng.add(LatLng(-6.164770, 106.900630));
    _latlng.add(LatLng(-6.158637, 106.906376));
    
    super.initState();
  }

  @override
  void dispose() {
    _timerDummy?.cancel();
    super.dispose();
  }

  // add marker
  void _drawPolylines() {
    final PolylineId polylineId = PolylineId('1');
    final Polyline polyline = Polyline(
      polylineId: polylineId,
      visible: true,
      width: 2,
      points: _latlng,
      color: Colors.pinkAccent,
    );
    _mapPolylines[polylineId] = polyline;

    CameraUpdate u2 = CameraUpdate.newCameraPosition(CameraPosition(target: _initialPosition, zoom: 15));

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
      mapToolbarEnabled: true,
      polylines: Set<Polyline>.of(_mapPolylines.values),
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
            _drawPolylines();
          });
        });
      },
      onTap: (pos){
        print('currentZoom : '+_currentZoom.toString());
      },
    );
  }
}
