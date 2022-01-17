import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class BarcodeScanner1Page extends StatefulWidget {
  @override
  _BarcodeScanner1PageState createState() => _BarcodeScanner1PageState();
}

class _BarcodeScanner1PageState extends State<BarcodeScanner1Page> {
  // initialize global widget
  final _globalWidget = GlobalWidget();

  String _scanBarcode = 'Unknown';

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> scanBarcodeNormal() async {
    String barcodeScanRes;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          "#ff6666", "Cancel", true, ScanMode.BARCODE);
      print(barcodeScanRes);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }

    if (!mounted) return;

    setState(() {
      _scanBarcode = barcodeScanRes;
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
                  title: 'Normal Barcode',
                  desc: 'This is the example of Normal Barcode Graphics Overlay'
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 8),
              // this is the start of example
              child: _globalWidget.createButton(
                  buttonName: 'Start 2D Barcode scan',
                  onPressed: (){
                    scanBarcodeNormal();
                  }
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 8),
              child: Text('Scan result : ', style: TextStyle(fontSize: 16)),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 8),
              child: Text(_scanBarcode.toString(), style: TextStyle(fontSize: 16)),
            ),
          ],
        ),
      ),
    );
  }
}
