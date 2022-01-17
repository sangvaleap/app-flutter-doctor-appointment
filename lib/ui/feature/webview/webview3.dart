/*
https://pub.dev/packages/webview_flutter
don't forget to add assets/html/webview.html on pubspec.yaml
*/
import 'dart:convert';
import 'dart:io';
import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Webview3Page extends StatefulWidget {
  @override
  _Webview3PageState createState() => _Webview3PageState();
}

class _Webview3PageState extends State<Webview3Page> {
  // initialize global widget
  final _globalWidget = GlobalWidget();
  late WebViewController _controller;
  bool _loading = true;

  @override
  void initState() {
    super.initState();

    // Enable hybrid composition.
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
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
      body: Stack(
        children: [
          WebView(
            initialUrl: 'about:blank',
            onWebViewCreated: (WebViewController webviewController) {
              _controller = webviewController;
              _loadHtmlFromAssets();
            },
            javascriptMode: JavascriptMode.unrestricted,
            onPageStarted: (String url) {
              print('Page started loading: $url');
            },
            onPageFinished: (String url) {
              setState(() {
                _loading = false;
              });
              print('Page finished loading: $url');
            },
          ),
          (_loading)?Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: Colors.grey[100],
            child: Center(
              child: CircularProgressIndicator(),
            ),
          ):SizedBox.shrink(),
        ],
      ),
    );
  }

  _loadHtmlFromAssets() async {
    String file = await rootBundle.loadString('assets/html/webview.html');
    _controller.loadUrl(Uri.dataFromString(
        file,
        mimeType: 'text/html',
        encoding: Encoding.getByName('utf-8')).toString());
  }
}
