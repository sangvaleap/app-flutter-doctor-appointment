import 'dart:typed_data';

import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';

class SignatureResultPage extends StatefulWidget {
  final Uint8List data;

  const SignatureResultPage({Key? key, required this.data}) : super(key: key);

  @override
  _SignatureResultPageState createState() => _SignatureResultPageState();
}

class _SignatureResultPageState extends State<SignatureResultPage> {
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
        appBar: _globalWidget.globalAppBar(),
        body: Center(
          child: Container(
            constraints: BoxConstraints(
                minHeight: 100, minWidth: double.infinity, maxHeight: 200
            ),
            child: Image.memory(widget.data),
          ),
        )
    );
  }
}
