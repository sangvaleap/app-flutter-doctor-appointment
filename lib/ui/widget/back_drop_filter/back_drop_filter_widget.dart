import 'dart:ui';

import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';

class BackDropFilterWidgetPage extends StatefulWidget {
  @override
  _BackDropFilterWidgetPageState createState() => _BackDropFilterWidgetPageState();
}

class _BackDropFilterWidgetPageState extends State<BackDropFilterWidgetPage> {
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
            _globalWidget.createDetailWidget2(
                title: 'Back Drop Filter Widget',
                desc: 'Back Drop Filter Widget used to do blur object.',
                icon: Icons.blur_on
            ),
            Stack(
              children: <Widget>[
                Image.asset('assets/images/lamp.jpg'),
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: ClipRect(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                      child: Container(
                        color: Colors.black.withOpacity(0.1),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        )
    );
  }
}
