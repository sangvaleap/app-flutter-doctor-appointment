import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';

class AnimatedPhysicalModelPage extends StatefulWidget {
  @override
  _AnimatedPhysicalModelPageState createState() => _AnimatedPhysicalModelPageState();
}

class _AnimatedPhysicalModelPageState extends State<AnimatedPhysicalModelPage> {
  // initialize global widget
  final _globalWidget = GlobalWidget();

  bool _first = true;

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
                title: 'Animated Physical Model',
                desc: 'Animated version of PhysicalModel.',
                icon: Icons.animation
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 8),
              child: _globalWidget.createButton(
                  buttonName: 'Change',
                  onPressed: (){
                    setState(() {
                      _first = !_first;
                    });
                  }
              ),
            ),
            SizedBox(height: 16),
            Container(
              margin: EdgeInsets.symmetric(vertical: 8),
              child: AnimatedPhysicalModel(
                duration: Duration(milliseconds: 500),
                curve: Curves.fastOutSlowIn,
                elevation: _first ? 0 : 20.0,
                shape: BoxShape.rectangle,
                shadowColor: Colors.black,
                color: Colors.white,
                borderRadius: _first
                    ? BorderRadius.all(Radius.circular(0))
                    : BorderRadius.all(Radius.circular(20)),
                child: Container(
                  height: 120.0,
                  width: 120.0,
                  color: Colors.blue[50],
                  child: FlutterLogo(
                    size: 100,
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
