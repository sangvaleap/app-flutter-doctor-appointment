import 'dart:async';
import 'dart:typed_data';

import 'package:doctor_app/ui/integration/maps/google_maps_flutter/custom_icon.dart';
import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:ui' as ui;

class GoogleMaps13Page extends StatefulWidget {
  @override
  _GoogleMaps13PageState createState() => _GoogleMaps13PageState();
}

class _GoogleMaps13PageState extends State<GoogleMaps13Page> {
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

  // this function is to create custom marker with label at the top of icon
  Future<BitmapDescriptor> _createIconLabel({String label='label', IconData icon=Icons.directions_car, double iconSize=50, double fontSize=30, labelColor: Colors.pinkAccent}) async {
    ui.PictureRecorder recorder = ui.PictureRecorder();
    final canvas = Canvas(recorder);
    CustomIcon iconLabeling = CustomIcon(iconLabel: label, iconData: icon, iconSize: iconSize, iconColor: Colors.green[800]!, labelColor: labelColor, fontSize: fontSize);

    final textPainter = TextPainter(
        text: TextSpan(
          text: label,
          style: TextStyle(fontSize: fontSize),
        ),
        textDirection: TextDirection.ltr);
    textPainter.layout();

    iconLabeling.paint(canvas, Size(textPainter.size.width + 30, textPainter.size.height + 25));
    final ui.Image image = await recorder.endRecording().toImage(
        textPainter.size.width.toInt() + 30,
        textPainter.size.height.toInt() + 25 + iconSize.toInt());
    final ByteData byteData = (await image.toByteData(format: ui.ImageByteFormat.png))!;

    Uint8List data = byteData.buffer.asUint8List();

    return BitmapDescriptor.fromBytes(data);
  }

  // add marker
  void _addMarker(double lat, double lng) {
    LatLng position = LatLng(lat, lng);

    _createIconLabel(label: 'My Car', icon: Icons.directions_car).then((BitmapDescriptor customIcon) {
      setState(() {
        _marker = Marker(
          markerId: MarkerId('marker1'),
          anchor: Offset(0.5, 0.5),
          position: position,
          onTap: () {
            _createIconLabel(label: 'My Car', icon: Icons.directions_car, labelColor: Colors.blue).then((BitmapDescriptor customIcon2) {
              setState(() {
                _marker = _marker!.copyWith(
                  iconParam: customIcon2,
                );
              });
            });
            Fluttertoast.showToast(msg: 'Click marker', toastLength: Toast.LENGTH_SHORT);
          },
          icon: customIcon,
        );
      });
    });

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
      markers: Set.of((_marker != null) ? [_marker!] : []),
      initialCameraPosition: CameraPosition(
        target: _initialPosition,
        zoom: _currentZoom,
      ),
      onTap: (v){
        _createIconLabel(label: 'My Car', icon: Icons.directions_car).then((BitmapDescriptor customIcon) {
          setState(() {
            _marker = _marker!.copyWith(
              iconParam: customIcon,
            );
          });
        });
        print('currentZoom : '+_currentZoom.toString());
      },
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
    );
  }
}
