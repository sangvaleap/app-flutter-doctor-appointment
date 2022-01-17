import 'package:doctor_app/config/constant.dart';
import 'package:doctor_app/ui/integration/maps/google_maps_flutter/google_maps1.dart';
import 'package:doctor_app/ui/integration/maps/google_maps_flutter/google_maps10.dart';
import 'package:doctor_app/ui/integration/maps/google_maps_flutter/google_maps11.dart';
import 'package:doctor_app/ui/integration/maps/google_maps_flutter/google_maps12.dart';
import 'package:doctor_app/ui/integration/maps/google_maps_flutter/google_maps13.dart';
import 'package:doctor_app/ui/integration/maps/google_maps_flutter/google_maps14.dart';
import 'package:doctor_app/ui/integration/maps/google_maps_flutter/google_maps15.dart';
import 'package:doctor_app/ui/integration/maps/google_maps_flutter/google_maps2.dart';
import 'package:doctor_app/ui/integration/maps/google_maps_flutter/google_maps3.dart';
import 'package:doctor_app/ui/integration/maps/google_maps_flutter/google_maps4.dart';
import 'package:doctor_app/ui/integration/maps/google_maps_flutter/google_maps5.dart';
import 'package:doctor_app/ui/integration/maps/google_maps_flutter/google_maps6.dart';
import 'package:doctor_app/ui/integration/maps/google_maps_flutter/google_maps7.dart';
import 'package:doctor_app/ui/integration/maps/google_maps_flutter/google_maps8.dart';
import 'package:doctor_app/ui/integration/maps/google_maps_flutter/google_maps9.dart';
import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';

class GoogleMapsListPage extends StatefulWidget {
  @override
  _GoogleMapsListPageState createState() => _GoogleMapsListPageState();
}

class _GoogleMapsListPageState extends State<GoogleMapsListPage> {
  // initialize global widget
  final _globalWidget = GlobalWidget();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: _globalWidget.globalAppBar(),
        body: ListView(
          padding: EdgeInsets.fromLTRB(24, 24, 24, 16),
          children: [
            Container(
              child: Text('Google Maps Flutter Package', style: TextStyle(
                  fontSize: 18, color: BLACK21, fontWeight: FontWeight.w500
              )),
            ),
            Container(
              margin: EdgeInsets.only(top: 24),
              child: Row(
                children: [
                  Flexible(
                      flex:5,
                      child: Container(
                        child: Text('Used to show maps with google maps flutter. To using google maps for web, you must have a valid API_KEY for Google Maps Platform. Check on this link https://cloud.google.com/maps-platform/pricing/sheet', style: TextStyle(
                            fontSize: 15, color: BLACK77,letterSpacing: 0.5
                        )),
                      )
                  ),
                  Flexible(
                      flex: 2,
                      child: Container(
                          alignment: Alignment.center,
                          child: Icon(Icons.map, size: 50, color: SOFT_BLUE))
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 48),
              child: Text('List', style: TextStyle(
                  fontSize: 18, color: BLACK21, fontWeight: FontWeight.w500
              )),
            ),
            SizedBox(height: 18),
            _globalWidget.screenDetailList(context: context, title: 'Google Maps 1 (Basic Integration)', page: GoogleMaps1Page()),
            _globalWidget.screenDetailList(context: context, title: 'Google Maps 2 (GoogleMaps Properties)', page: GoogleMaps2Page()),
            _globalWidget.screenDetailList(context: context, title: 'Google Maps 3 (Single Marker)', page: GoogleMaps3Page()),
            _globalWidget.screenDetailList(context: context, title: 'Google Maps 4 (Multi Marker)', page: GoogleMaps4Page()),
            _globalWidget.screenDetailList(context: context, title: 'Google Maps 5 (Single Marker - Custom Image)', page: GoogleMaps5Page()),
            _globalWidget.screenDetailList(context: context, title: 'Google Maps 6 (Multi Marker - Custom Image)', page: GoogleMaps6Page()),
            _globalWidget.screenDetailList(context: context, title: 'Google Maps 7 (Controller)', page: GoogleMaps7Page()),
            _globalWidget.screenDetailList(context: context, title: 'Google Maps 8 (Single Marker - Visibility On / Off)', page: GoogleMaps8Page()),
            _globalWidget.screenDetailList(context: context, title: 'Google Maps 9 (Multi Marker - Visibility On / Off)', page: GoogleMaps9Page()),
            _globalWidget.screenDetailList(context: context, title: 'Google Maps 10 (Sliding Detail Information)', page: GoogleMaps10Page()),
            _globalWidget.screenDetailList(context: context, title: 'Google Maps 11 (Draw Polylines)', page: GoogleMaps11Page()),
            _globalWidget.screenDetailList(context: context, title: 'Google Maps 12 (Draw Circle)', page: GoogleMaps12Page()),
            _globalWidget.screenDetailList(context: context, title: 'Google Maps 13 (Custom Icon with label)', page: GoogleMaps13Page()),
            _globalWidget.screenDetailList(context: context, title: 'Google Maps 14 (Custom Image with label)', page: GoogleMaps14Page()),
            _globalWidget.screenDetailList(context: context, title: 'Google Maps 15 (Get address from latitude and longitude)', page: GoogleMaps15Page()),
          ],
        )
    );
  }
}
