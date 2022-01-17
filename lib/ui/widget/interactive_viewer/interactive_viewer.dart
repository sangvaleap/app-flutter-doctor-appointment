import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';

class InteractiveViewerPage extends StatefulWidget {
  @override
  _InteractiveViewerPageState createState() => _InteractiveViewerPageState();
}

class _InteractiveViewerPageState extends State<InteractiveViewerPage> {
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
                title: 'Interactive Viewer',
                desc: 'A widget that enables pan and zoom interactions with its child.',
                icon: Icons.zoom_out_map
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 8),
              child: InteractiveViewer(
                maxScale: 10,
                child: Image.asset('assets/images/lamp.jpg')),
            )
          ],
        ),
      ),
    );
  }
}
