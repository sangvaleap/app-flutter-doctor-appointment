import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';

class ColoringTextPage extends StatefulWidget {
  @override
  _ColoringTextPageState createState() => _ColoringTextPageState();
}

class _ColoringTextPageState extends State<ColoringTextPage> {
  // initialize global widget
  final _globalWidget = GlobalWidget();

  final Shader linearGradient1 = LinearGradient(
    colors: <Color>[Color(0xffDA44bb), Color(0xff8921aa)],
  ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 0.0));

  final Shader linearGradient2 = LinearGradient(
    colors: <Color>[Colors.red, Colors.blue],
  ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 0.0));

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
            _globalWidget.createDetailWidget(
                title: 'Coloring Text',
                desc: 'This is the example of text with different color, use different method to get color, hex color, rgb color, gradient color'
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 8),
              child: Text('lorem ipsum dolor sit amet', style: TextStyle(
                  fontSize: 16,
                  color: Colors.red
              )),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 8),
              child: Text('lorem ipsum dolor sit amet', style: TextStyle(
                  fontSize: 16,
                  color: Color(0xFF00AAFF)
              )),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 8),
              child: Text('lorem ipsum dolor sit amet', style: TextStyle(
                  fontSize: 16,
                  color: Colors.green[400]
              )),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 8),
              child: Text('lorem ipsum dolor sit amet', style: TextStyle(
                  fontSize: 16,
                  color: Color.fromARGB(255, 204, 0, 255)
              )),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 8),
              child: Text('lorem ipsum dolor sit amet', style: TextStyle(
                  fontSize: 16,
                  background: Paint()..color = Colors.grey,
              )),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 8),
              child: Text('lorem ipsum dolor sit amet', style: TextStyle(
                  fontSize: 16,
                  foreground: Paint()..shader = linearGradient1
              )),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 8),
              child: Text('lorem ipsum dolor sit amet', style: TextStyle(
                  fontSize: 16,
                  foreground: Paint()..shader = linearGradient2
              )),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 8),
              child: Text('lorem ipsum dolor sit amet', style: TextStyle(
                fontSize: 16,
                color: Colors.white,
                backgroundColor: Colors.blue,
              )),
            ),
          ],
        )
    );
  }
}
