import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';

class AnimatedSizePage extends StatefulWidget {
  @override
  _AnimatedSizePageState createState() => _AnimatedSizePageState();
}

class _AnimatedSizePageState extends State<AnimatedSizePage> {
  // initialize global widget
  final _globalWidget = GlobalWidget();

  bool _first = true;
  double _size = 100;

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
                title: 'Animated Size',
                desc: 'Animated widget that automatically transitions its size over a given duration whenever the given child\'s size changes.',
                icon: Icons.animation
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 8),
              child: _globalWidget.createButton(
                  buttonName: 'Change',
                  onPressed: (){
                    setState(() {
                      if(_first){
                        _size = 200;
                      } else {
                        _size = 100;
                      }
                      _first = !_first;
                    });
                  }
              ),
            ),
            SizedBox(height: 16),
            Container(
              margin: EdgeInsets.symmetric(vertical: 8),
              child: AnimatedSize(
                curve: Curves.easeIn,
                duration: Duration(seconds: 1),
                child: FlutterLogo(size: _size),
              ),
            )
          ],
        ),
      ),
    );
  }
}
