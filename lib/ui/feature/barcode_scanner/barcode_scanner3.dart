import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class BarcodeScanner3Page extends StatefulWidget {
  @override
  _BarcodeScanner3PageState createState() => _BarcodeScanner3PageState();
}

class _BarcodeScanner3PageState extends State<BarcodeScanner3Page> {
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

  startBarcodeScanStream() async {
    FlutterBarcodeScanner.getBarcodeStreamReceiver("#ff6666", "Cancel", true, ScanMode.QR)!.listen((barcode){
      print('Barcode : '+barcode);
    });
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
                  title: 'Barcode Scan Stream',
                  desc: 'This is the example of Barcode Scan Stream'
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 8),
              // this is the start of example
              child: _globalWidget.createButton(
                  buttonName: 'Start barcode scan stream',
                  onPressed: (){
                    startBarcodeScanStream();
                  }
              ),
            ),
          ],
        ),
      ),
    );
  }
}
