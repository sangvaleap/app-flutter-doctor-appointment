/*
https://pub.dev/packages/flutter_signature_pad
*/

import 'dart:convert';

import 'package:doctor_app/ui/feature/signature/signature_result.dart';
import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signature_pad/flutter_signature_pad.dart';
import 'dart:ui' as ui;

class Signature2Page extends StatefulWidget {
  @override
  _Signature2PageState createState() => _Signature2PageState();
}

class _Signature2PageState extends State<Signature2Page> {
  // initialize global widget
  final _globalWidget = GlobalWidget();
  var color = Colors.black;
  var strokeWidth = 3.0;
  final _sign = GlobalKey<SignatureState>();

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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: _globalWidget.createDetailWidget(
                  title: 'Signature 2',
                  desc: 'This is the example of digital signature 2, write inside the box'
              ),
            ),
            //SIGNATURE CANVAS
            Container(
              height: 400,
              decoration: BoxDecoration(
                border: Border.all(
                    width: 1,
                    color: Colors.grey[300]!
                ),
              ),
              child: Signature(
                color: color,
                key: _sign,
                onSign: () {
                  final sign = _sign.currentState;
                  debugPrint('${sign!.points.length} points in the signature');
                },
                strokeWidth: strokeWidth,
              ),
            ),
            SizedBox(height: 32),
            Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _globalWidget.createButton(
                        buttonName: 'Save',
                        onPressed: () async {
                          final sign = _sign.currentState;
                          //retrieve image data, do whatever you want with it (send to server, save locally...)
                          final image = await sign!.getData();
                          await image.toByteData(format: ui.ImageByteFormat.png). then((val){
                            final encoded = base64.encode(val!.buffer.asUint8List());
                            debugPrint("onPressed " + encoded);
                            Navigator.push(context, MaterialPageRoute(builder: (context) => SignatureResultPage(data: val.buffer.asUint8List())));
                          });
                        }
                    ),
                    SizedBox(width: 16),
                    _globalWidget.createButton(
                        buttonName: 'Clear',
                        onPressed: (){
                          final sign = _sign.currentState;
                          sign!.clear();
                          debugPrint("cleared");
                        }
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}