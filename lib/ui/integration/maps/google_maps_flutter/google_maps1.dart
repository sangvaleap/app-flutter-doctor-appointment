/*
This is google maps basic integration page
if you don't use _mapLoading variable, when the first time maps is loaded, you will see black screen for a while.

install plugin in pubspec.yaml
- google_maps_flutter => for google maps (https://pub.dev/packages/google_maps_flutter)
  add google maps api key to android manifest :
  <manifest ...
  <application ...
    <meta-data android:name="com.google.android.geo.API_KEY"
               android:value="YOUR KEY HERE"/>

  add google maps api key to ios/Runner/AppDelegate.swift
  import UIKit
  import Flutter
  import GoogleMaps

  @UIApplicationMain
  @objc class AppDelegate: FlutterAppDelegate {
    override func application(
      _ application: UIApplication,
      didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
      GMSServices.provideAPIKey("YOUR KEY HERE")
      GeneratedPluginRegistrant.register(with: self)
      return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
  }
 */

import 'dart:async';

import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMaps1Page extends StatefulWidget {
  @override
  _GoogleMaps1PageState createState() => _GoogleMaps1PageState();
}

class _GoogleMaps1PageState extends State<GoogleMaps1Page> {
  // initialize global widget
  final _globalWidget = GlobalWidget();

  final LatLng _initialPosition = LatLng(-6.168033, 106.900467);

  bool _mapLoading = true;
  Timer? _timerDummy;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _timerDummy?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _globalWidget.globalAppBar(),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.all(16),
            child: _globalWidget.createDetailWidget(
                title: 'Google Maps 1 (Basic Integration)',
                desc: 'This is the example of google maps integration'
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
          )
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
      initialCameraPosition: CameraPosition(
        target: _initialPosition,
        zoom: 14,
      ),
      onMapCreated: (GoogleMapController controller) {
        _timerDummy = Timer(Duration(milliseconds: 300), () {
          setState(() {
            _mapLoading = false;
          });
        });
      },
    );
  }
}
