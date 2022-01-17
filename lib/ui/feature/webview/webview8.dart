/*
https://pub.dev/packages/webview_flutter
*/
import 'dart:io';
import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Webview8Page extends StatefulWidget {
  @override
  _Webview8PageState createState() => _Webview8PageState();
}

class _Webview8PageState extends State<Webview8Page> {
  // initialize global widget
  final _globalWidget = GlobalWidget();
  late WebViewController _controller;
  bool _loading = true;

  final String _initialUrl = 'https://devkit.ijteknologi.com/';
  final String _lookupUrl = 'devkit.ijteknologi.com';
  bool connectionStatus = true;

  Future _checkConnection() async {
    try {
      final result = await InternetAddress.lookup(_lookupUrl);
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        connectionStatus = true;
      }
    } on SocketException catch (e) {
      print('e : '+e.toString());
      connectionStatus = false;
    }
  }

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
      body: FutureBuilder(
        future: _checkConnection(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (connectionStatus == true) {
            return WillPopScope(
              onWillPop: () => _onWillPop(context),
              child: Stack(
                children: [
                  WebView(
                    initialUrl: _initialUrl,
                    javascriptMode: JavascriptMode.unrestricted,
                    gestureNavigationEnabled: true,
                    onWebViewCreated: (WebViewController webviewController) {
                      _controller = webviewController;
                    },
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
          } else {
            return Container(
              child: Center(
                child: Text('No Internet Connection / Custom Error Screen'),
              ),
            );
          }
        }
      ),
    );
  }

  Future<bool> _onWillPop(BuildContext context) async {
    if (await _controller.canGoBack()) {
      _controller.goBack();
      return Future.value(false);
    } else {
      return Future.value(true);
    }
  }
}
