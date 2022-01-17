// Follow this instruction to make it work on Android and iOS https://pub.dev/packages/flutter_barcode_scanner

import 'package:doctor_app/config/constant.dart';
import 'package:doctor_app/ui/feature/barcode_scanner/barcode_scanner1.dart';
import 'package:doctor_app/ui/feature/barcode_scanner/barcode_scanner2.dart';
import 'package:doctor_app/ui/feature/barcode_scanner/barcode_scanner3.dart';
import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';

class BarcodeScannerListPage extends StatefulWidget {
  @override
  _BarcodeScannerListPageState createState() => _BarcodeScannerListPageState();
}

class _BarcodeScannerListPageState extends State<BarcodeScannerListPage> {
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
              child: Text('Barcode Scanner', style: TextStyle(
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
                        child: Text('Barcode Scanner is used to scan Normal Barcode or QR Code on application.\n\nBoth Barcode Scanner 1 and Barcode Scanner 2 can scan Normal and QR Code, the different is only Graphic Overlay.', style: TextStyle(
                            fontSize: 15, color: BLACK77,letterSpacing: 0.5
                        )),
                      )
                  ),
                  Flexible(
                      flex: 2,
                      child: Container(
                          alignment: Alignment.center,
                          child: Icon(Icons.qr_code, size: 50, color: SOFT_BLUE))
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
            _globalWidget.screenDetailList(context: context, title: 'Barcode Scanner 1 (Normal Barcode Graphics Overlay)', page: BarcodeScanner1Page()),
            _globalWidget.screenDetailList(context: context, title: 'Barcode Scanner 2 (QR Code Graphics Overlay)', page: BarcodeScanner2Page()),
            _globalWidget.screenDetailList(context: context, title: 'Barcode Scanner 3 (Continuous Scan)', page: BarcodeScanner3Page()),
          ],
        )
    );
  }
}
