/*
https://pub.dev/packages/signature
*/
import 'dart:typed_data';

import 'package:doctor_app/ui/feature/signature/signature_result.dart';
import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';
import 'package:signature/signature.dart';

class Signature1Page extends StatefulWidget {
  @override
  _Signature1PageState createState() => _Signature1PageState();
}

class _Signature1PageState extends State<Signature1Page> {
  // initialize global widget
  final _globalWidget = GlobalWidget();

  final SignatureController _controller = SignatureController(
    penStrokeWidth: 3,
    penColor: Colors.black,
    exportBackgroundColor: Colors.white,
  );

  @override
  void initState() {
    _controller.addListener(() => print("Value changed"));
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
                  title: 'Signature 1',
                  desc: 'This is the example of digital signature 1, write inside the box'
              ),
            ),
            //SIGNATURE CANVAS
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1,
                  color: Colors.grey[300]!
                ),
              ),
              child: Signature(
                controller: _controller,
                width: MediaQuery.of(context).size.width-50, // 50 is get from left padding 24, right padding 24, and border left and right 2, so total is 50
                height: 400,
                backgroundColor: Colors.white,
              ),
            ),
            //OK AND CLEAR BUTTONS
            Container(
              decoration: BoxDecoration(color: Colors.pinkAccent),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.check),
                    color: Colors.white,
                    onPressed: () async {
                      if (_controller.isNotEmpty) {
                        await _controller.toPngBytes().then((Uint8List? data){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => SignatureResultPage(data: data!)));
                        });
                      }
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.undo),
                    color: Colors.white,
                    onPressed: () {
                      setState(() => _controller.undo());
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.redo),
                    color: Colors.white,
                    onPressed: () {
                      setState(() => _controller.redo());
                    },
                  ),
                  //CLEAR CANVAS
                  IconButton(
                    icon: Icon(Icons.clear),
                    color: Colors.white,
                    onPressed: () {
                      setState(() {
                        _controller.clear();
                      });
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
