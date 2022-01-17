/*
https://pub.dev/packages/flutter_spinkit
*/
import 'dart:math';
import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingAnimationPage extends StatefulWidget {
  @override
  _LoadingAnimationPageState createState() => _LoadingAnimationPageState();
}

class _LoadingAnimationPageState extends State<LoadingAnimationPage> {
  // initialize global widget
  final _globalWidget = GlobalWidget();

  Random _random = Random();
  final List bColor = [Colors.pinkAccent, Colors.orange, Colors.green, Colors.lightBlue, Colors.teal];

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
        body: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(24, 24, 24, 16),
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _globalWidget.createDetailWidget(
                    title: 'Loading Animation',
                    desc: 'This is the example of Loading Indicator with Animation'
                ),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  child: Text('Rotating Circle'),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 16),
                  width: 200,
                  height: 100,
                  color: bColor[_random.nextInt(4)],
                  child: SpinKitRotatingCircle(color: Colors.white),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Text('Rotating Plain'),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 16),
                  width: 200,
                  height: 100,
                  color: bColor[_random.nextInt(4)],
                  child: SpinKitRotatingPlain(color: Colors.white),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Text('Chasing Dots'),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 16),
                  width: 200,
                  height: 100,
                  color: bColor[_random.nextInt(4)],
                  child: SpinKitChasingDots(color: Colors.white),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Text('Pumping Heart'),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 16),
                  width: 200,
                  height: 100,
                  color: bColor[_random.nextInt(4)],
                  child: SpinKitPumpingHeart(color: Colors.white),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Text('Pulse'),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 16),
                  width: 200,
                  height: 100,
                  color: bColor[_random.nextInt(4)],
                  child: SpinKitPulse(color: Colors.white),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Text('Double Bounce'),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 16),
                  width: 200,
                  height: 100,
                  color: bColor[_random.nextInt(4)],
                  child: SpinKitDoubleBounce(color: Colors.white),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Text('Wave from Start'),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 16),
                  width: 200,
                  height: 100,
                  color: bColor[_random.nextInt(4)],
                  child: SpinKitWave(color: Colors.white, type: SpinKitWaveType.start),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Text('Wave from Center'),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 16),
                  width: 200,
                  height: 100,
                  color: bColor[_random.nextInt(4)],
                  child: SpinKitWave(color: Colors.white, type: SpinKitWaveType.center),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Text('Wave from End'),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 16),
                  width: 200,
                  height: 100,
                  color: bColor[_random.nextInt(4)],
                  child: SpinKitWave(color: Colors.white, type: SpinKitWaveType.end),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Text('Piano Wave from Start'),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 16),
                  width: 200,
                  height: 100,
                  color: bColor[_random.nextInt(4)],
                  child: SpinKitPianoWave(color: Colors.white, type: SpinKitPianoWaveType.start),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Text('Piano Wave from Center'),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 16),
                  width: 200,
                  height: 100,
                  color: bColor[_random.nextInt(4)],
                  child: SpinKitPianoWave(color: Colors.white, type: SpinKitPianoWaveType.center),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Text('Piano Wave from End'),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 16),
                  width: 200,
                  height: 100,
                  color: bColor[_random.nextInt(4)],
                  child: SpinKitPianoWave(color: Colors.white, type: SpinKitPianoWaveType.end),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Text('Three Bounce'),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 16),
                  width: 200,
                  height: 100,
                  color: bColor[_random.nextInt(4)],
                  child: SpinKitThreeBounce(color: Colors.white),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Text('Three In Out'),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 16),
                  width: 200,
                  height: 100,
                  color: bColor[_random.nextInt(4)],
                  child: SpinKitThreeInOut(color: Colors.white),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Text('Wandering Cubes'),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 16),
                  width: 200,
                  height: 100,
                  color: bColor[_random.nextInt(4)],
                  child: SpinKitWanderingCubes(color: Colors.white),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Text('Wandering Cubes Circle'),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 16),
                  width: 200,
                  height: 100,
                  color: bColor[_random.nextInt(4)],
                  child: SpinKitWanderingCubes(color: Colors.white, shape: BoxShape.circle),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Text('Circle'),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 16),
                  width: 200,
                  height: 100,
                  color: bColor[_random.nextInt(4)],
                  child: SpinKitCircle(color: Colors.white),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Text('Fading Four Circle'),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 16),
                  width: 200,
                  height: 100,
                  color: bColor[_random.nextInt(4)],
                  child: SpinKitFadingFour(color: Colors.white),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Text('Fading Four Rectangle'),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 16),
                  width: 200,
                  height: 100,
                  color: bColor[_random.nextInt(4)],
                  child: SpinKitFadingFour(color: Colors.white, shape: BoxShape.rectangle),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Text('Fading Cube'),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 16),
                  width: 200,
                  height: 100,
                  color: bColor[_random.nextInt(4)],
                  child: SpinKitFadingCube(color: Colors.white),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Text('Cube Grid'),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 16),
                  width: 200,
                  height: 100,
                  color: bColor[_random.nextInt(4)],
                  child: SpinKitCubeGrid(color: Colors.white),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Text('Folding Cube'),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 16),
                  width: 200,
                  height: 100,
                  color: bColor[_random.nextInt(4)],
                  child: SpinKitFoldingCube(color: Colors.white),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Text('Ring'),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 16),
                  width: 200,
                  height: 100,
                  color: bColor[_random.nextInt(4)],
                  child: SpinKitRing(color: Colors.white),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Text('Dual Ring'),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 16),
                  width: 200,
                  height: 100,
                  color: bColor[_random.nextInt(4)],
                  child: SpinKitDualRing(color: Colors.white),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Text('Spinning Lines'),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 16),
                  width: 200,
                  height: 100,
                  color: bColor[_random.nextInt(4)],
                  child: SpinKitSpinningLines(color: Colors.white),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Text('Fading Grid Circle'),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 16),
                  width: 200,
                  height: 100,
                  color: bColor[_random.nextInt(4)],
                  child: SpinKitFadingGrid(color: Colors.white),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Text('Fading Grid Rectangle'),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 16),
                  width: 200,
                  height: 100,
                  color: bColor[_random.nextInt(4)],
                  child: SpinKitFadingGrid(color: Colors.white, shape: BoxShape.rectangle),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Text('Square Circle'),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 16),
                  width: 200,
                  height: 100,
                  color: bColor[_random.nextInt(4)],
                  child: SpinKitSquareCircle(color: Colors.white),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Text('Spinning Circle'),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 16),
                  width: 200,
                  height: 100,
                  color: bColor[_random.nextInt(4)],
                  child: SpinKitSpinningCircle(color: Colors.white),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Text('Spinning Rectangle'),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 16),
                  width: 200,
                  height: 100,
                  color: bColor[_random.nextInt(4)],
                  child: SpinKitSpinningCircle(color: Colors.white, shape: BoxShape.rectangle),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Text('Fading Circle'),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 16),
                  width: 200,
                  height: 100,
                  color: bColor[_random.nextInt(4)],
                  child: SpinKitFadingCircle(color: Colors.white),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Text('Hour Glass'),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 16),
                  width: 200,
                  height: 100,
                  color: bColor[_random.nextInt(4)],
                  child: SpinKitHourGlass(color: Colors.white),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Text('Pouring Hour Glass'),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 16),
                  width: 200,
                  height: 100,
                  color: bColor[_random.nextInt(4)],
                  child: SpinKitPouringHourGlass(color: Colors.white),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Text('Pouring Hour Glass Refined'),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 16),
                  width: 200,
                  height: 100,
                  color: bColor[_random.nextInt(4)],
                  child: SpinKitPouringHourGlassRefined(color: Colors.white),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Text('Ripple'),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 16),
                  width: 200,
                  height: 100,
                  color: bColor[_random.nextInt(4)],
                  child: SpinKitRipple(color: Colors.white),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Text('Dancing Square'),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 16),
                  width: 200,
                  height: 100,
                  color: bColor[_random.nextInt(4)],
                  child: SpinKitDancingSquare(color: Colors.white),
                ),
              ],
            ),
          ),
        )
    );
  }
}
