import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';

class AspectRatioPage extends StatefulWidget {
  @override
  _AspectRatioPageState createState() => _AspectRatioPageState();
}

class _AspectRatioPageState extends State<AspectRatioPage> {
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
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(24, 24, 24, 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _globalWidget.createDetailWidget2(
                title: 'Aspect Ratio',
                desc: 'A widget that attempts to size the child to a specific aspect ratio.',
                icon: Icons.aspect_ratio
            ),
            SizedBox(height: 16),
            Container(
              margin: EdgeInsets.symmetric(vertical: 8),
              child: Container(
                color: Colors.grey[400],
                alignment: Alignment.center,
                width: double.infinity,
                height: 100.0,
                child: AspectRatio(
                  aspectRatio: 16 / 9,
                  child: Container(
                    color: Colors.pinkAccent,
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 8),
              child: Container(
                color: Colors.grey[400],
                alignment: Alignment.center,
                width: 100.0,
                height: 100.0,
                child: AspectRatio(
                  aspectRatio: 2.0,
                  child: Container(
                    width: 100.0,
                    height: 50.0,
                    color: Colors.pinkAccent,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
