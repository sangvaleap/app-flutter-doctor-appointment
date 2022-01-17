/*
https://pub.dev/packages/webview_flutter
*/
import 'dart:convert';
import 'dart:io';
import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Webview6Page extends StatefulWidget {
  @override
  _Webview6PageState createState() => _Webview6PageState();
}

class _Webview6PageState extends State<Webview6Page> {
  // initialize global widget
  final _globalWidget = GlobalWidget();
  late WebViewController _controller;
  bool _loading = true;

  final String htmlString = '''
<html>
<head>
    <title>Communicate from Webview to Flutter</title>
</head>
<body>
<div>Communicate from Webview to Flutter</div>
<br><br>
<button onclick="sendBack();">Click Me</button>
<script type="text/javascript">
    function sendBack() {
        messageHandler.postMessage("Hello from JS");
    }
</script>
</body>
</html>
''';

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
              _loadHtmlFromTextString();
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
            javascriptChannels: Set.from([
              JavascriptChannel(
                  name: 'messageHandler',
                  onMessageReceived: (JavascriptMessage message) {
                    Fluttertoast.showToast(msg: 'message : '+message.message, toastLength: Toast.LENGTH_SHORT);
                  })
            ]),
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

  _loadHtmlFromTextString() async {
    final String contentBase64 =
    base64Encode(const Utf8Encoder().convert(htmlString));
    await _controller.loadUrl('data:text/html;base64,$contentBase64');
  }
}
