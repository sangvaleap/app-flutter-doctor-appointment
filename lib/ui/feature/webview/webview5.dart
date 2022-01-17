/*
https://pub.dev/packages/webview_flutter
*/
import 'dart:convert';
import 'dart:io';
import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Webview5Page extends StatefulWidget {
  @override
  _Webview5PageState createState() => _Webview5PageState();
}

class _Webview5PageState extends State<Webview5Page> {
  // initialize global widget
  final _globalWidget = GlobalWidget();
  late WebViewController _controller;
  bool _loading = true;

  final String htmlString = '''
<html>
<head>
    <title>Communicate from Flutter to Webview</title>
</head>
<body>
<div>Communicate from Flutter to Webview</div>
<div id="text-change">This text will change if you pressed the FAB Button</div>
<script type="text/javascript">
    function communicateFromFlutter(newstring) {
        document.getElementById("text-change").innerHTML = newstring;
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
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.edit),
        onPressed: () {
          _controller.evaluateJavascript('communicateFromFlutter("Hiii, this text is <strong>changed</strong>")');
        },
      ),
    );
  }

  _loadHtmlFromTextString() async {
    final String contentBase64 =
    base64Encode(const Utf8Encoder().convert(htmlString));
    await _controller.loadUrl('data:text/html;base64,$contentBase64');
  }
}
