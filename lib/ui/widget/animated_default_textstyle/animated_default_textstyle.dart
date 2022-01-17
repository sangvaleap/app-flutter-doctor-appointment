import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';

class AnimatedDefaultTextstylePage extends StatefulWidget {
  @override
  _AnimatedDefaultTextstylePageState createState() => _AnimatedDefaultTextstylePageState();
}

class _AnimatedDefaultTextstylePageState extends State<AnimatedDefaultTextstylePage> {
  // initialize global widget
  final _globalWidget = GlobalWidget();

  bool _first = false;
  double _fontSize = 24;
  FontWeight _fontWeight = FontWeight.normal;
  Color _color = Colors.black;

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
                title: 'Animated Default Textstyle',
                desc: 'Animated version of DefaultTextStyle which automatically transitions the default text style (the text style to apply to descendant Text widgets without explicit style) over a given duration whenever the given style changes.',
                icon: Icons.animation
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 8),
              child: _globalWidget.createButton(
                  buttonName: 'Change',
                  onPressed: (){
                    setState(() {
                      if(_first){
                        _fontSize = 24;
                        _fontWeight = FontWeight.normal;
                        _color = Colors.black;
                      } else {
                        _fontSize = 36;
                        _fontWeight = FontWeight.bold;
                        _color = Colors.blue;
                      }
                      _first = !_first;
                    });
                  }
              ),
            ),
            SizedBox(height: 16),
            Container(
              margin: EdgeInsets.symmetric(vertical: 8),
              child: AnimatedDefaultTextStyle(
                duration: Duration(milliseconds: 300),
                style: TextStyle(
                  fontSize: _fontSize,
                  color: _color,
                  fontWeight: _fontWeight,
                ),
                child: Text('This text will change'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
