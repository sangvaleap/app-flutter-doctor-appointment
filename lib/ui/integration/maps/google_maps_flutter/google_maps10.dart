import 'dart:async';

import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class GoogleMaps10Page extends StatefulWidget {
  @override
  _GoogleMaps10PageState createState() => _GoogleMaps10PageState();
}

class _GoogleMaps10PageState extends State<GoogleMaps10Page> {
  // initialize global widget
  final _globalWidget = GlobalWidget();

  final LatLng _initialPosition = LatLng(-6.168033, 106.900467);

  bool _mapLoading = true;
  Timer? _timerDummy;

  final double _initFabHeight = 110;
  late double _fabHeight;
  late double _panelHeightOpen;
  double _panelHeightClosed = 95.0;

  @override
  void initState() {
    _fabHeight = _initFabHeight;

    super.initState();
  }

  @override
  void dispose() {
    _timerDummy?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _panelHeightOpen = (MediaQuery.of(context).size.height-MediaQuery.of(context).padding.top - kToolbarHeight) * 0.75;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _globalWidget.globalAppBar(),
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          SlidingUpPanel(
            maxHeight: _panelHeightOpen,
            minHeight: _panelHeightClosed,
            boxShadow: [],
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
                ):SizedBox.shrink(),
              ],
            ),
            panelBuilder: (sc) => _panel(sc),
            onPanelSlide: (double pos) => setState((){
              _fabHeight = pos * (_panelHeightOpen - _panelHeightClosed) + _initFabHeight;
            }),
          ),
          Positioned(
            bottom: _fabHeight,
            right: 16,
            child: GestureDetector(
              onTap: (){
                Fluttertoast.showToast(msg: 'Click Location', toastLength: Toast.LENGTH_SHORT);
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

  Widget _panel(ScrollController sc){
    return ListView(
      controller: sc,
      children: [
        SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 50,
              height: 5,
              decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.all(Radius.circular(12))
              ),
            ),
          ],
        ),
        Container(
          padding: EdgeInsets.all(16),
          child: Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque tortor tortor, ultrices id scelerisque a, elementum id elit. Maecenas feugiat tellus sed augue malesuada, id tempus ex sodales. Nulla at cursus eros. Integer porttitor ac ipsum quis sollicitudin. Sed mollis sapien massa, et dignissim turpis vulputate et. Ut ac odio porta, blandit velit in, pharetra lacus. Integer aliquam dolor nec augue porttitor hendrerit. Vestibulum aliquam urna finibus, luctus felis nec, hendrerit augue. Fusce eget lacinia leo. Vivamus porttitor, lacus eget rutrum tempus, odio magna tincidunt elit, ut vulputate nibh velit eu lectus. Morbi felis mi, efficitur sed diam in, elementum ullamcorper leo. Ut bibendum lorem consectetur pellentesque gravida. Sed est orci, consectetur id nunc quis, volutpat consectetur nisi.\n\n'
              'Donec est neque, accumsan sit amet imperdiet porta, suscipit eu ex. Phasellus lobortis mollis pharetra. Donec maximus rhoncus elit, sed pellentesque justo pretium vel. Integer vitae facilisis lectus. Suspendisse potenti. Mauris iaculis placerat feugiat. Integer commodo dui sit amet finibus congue. Nulla egestas lacus vel elit aliquet, at pulvinar ex venenatis. Vivamus eget maximus libero, quis vulputate diam. Pellentesque vel justo vel lectus viverra aliquet ut eget metus.\n\n'
              'Vivamus malesuada velit pretium laoreet pulvinar. Duis non dignissim sapien, vitae viverra purus. Curabitur a gravida mauris. Nullam turpis odio, ultricies sed ultricies non, sodales eget purus. Donec pulvinar bibendum metus vitae ornare. Phasellus eleifend orci eget blandit sollicitudin. Sed sed urna in magna dignissim eleifend.\n\n'
              'Vestibulum vitae erat maximus, laoreet ex quis, laoreet nunc. Sed porttitor massa eget cursus rhoncus. Suspendisse et tellus et enim ullamcorper semper eget in nisl. Nam metus mauris, sollicitudin in venenatis at, pretium at nulla. Sed a accumsan dui. Quisque fermentum mollis erat, ac fringilla eros auctor eu. Donec placerat mi ut sem ullamcorper tempor. Pellentesque ut nulla sollicitudin, tempus arcu quis, vulputate dolor. Sed ultrices cursus nisl, nec tempor neque tempus at. Pellentesque nec dolor faucibus, porttitor quam sed, vehicula est. Vestibulum placerat placerat neque eu posuere. Pellentesque id mauris hendrerit, placerat lacus id, auctor eros. Praesent vestibulum mattis est, non facilisis urna accumsan et. Vestibulum scelerisque ornare sapien, nec blandit purus rhoncus mollis. Sed faucibus, augue consequat rhoncus rutrum, sapien mauris dictum quam, nec tempus orci urna vitae lorem. Curabitur sit amet nisl et lacus fringilla pulvinar.\n\n'
              'Phasellus pellentesque et magna in aliquam. Etiam vehicula dui vitae lectus ultrices iaculis. Nullam volutpat magna vel volutpat laoreet. Donec accumsan mi augue, nec elementum libero imperdiet eget. Duis in enim facilisis, lobortis tellus id, tincidunt urna. Donec ipsum neque, pharetra id imperdiet eget, varius bibendum sapien. Suspendisse tincidunt justo a purus molestie, sed elementum urna scelerisque. Suspendisse eget erat ultrices, suscipit nunc ut, iaculis lacus. Donec finibus, nisi vitae porta sodales, diam sapien scelerisque tortor, vel aliquet urna ex non urna. Etiam dictum eros ut justo ultrices tincidunt. Nulla et neque velit. Phasellus malesuada, lectus et sodales iaculis, sapien nibh ultrices tellus, ut ultrices magna tellus eget tellus. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras non diam ac quam aliquet facilisis sit amet at lectus. Nulla vestibulum libero arcu, eu malesuada ipsum congue feugiat.'),
        )
      ],
    );
  }
}
