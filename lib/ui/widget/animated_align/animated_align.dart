import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';

class AnimatedAlignPage extends StatefulWidget {
  @override
  _AnimatedAlignPageState createState() => _AnimatedAlignPageState();
}

class _AnimatedAlignPageState extends State<AnimatedAlignPage> {
  // initialize global widget
  final _globalWidget = GlobalWidget();

  Alignment _alignment = Alignment.center;

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
                title: 'Animated Align',
                desc: 'Animated version of Align which automatically transitions the child\'s position over a given duration whenever the given alignment changes.',
                icon: Icons.animation
            ),
            Wrap(
              children: [
                Container(
                  margin: EdgeInsets.only(right: 16, bottom: 16),
                  child: _globalWidget.createButton(
                      buttonName: 'Top Left',
                      onPressed: (){
                        setState(() {
                          _alignment = Alignment.topLeft;
                        });
                      }
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(right: 16, bottom: 16),
                  child: _globalWidget.createButton(
                      buttonName: 'Top Center',
                      onPressed: (){
                        setState(() {
                          _alignment = Alignment.topCenter;
                        });
                      }
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(right: 16, bottom: 16),
                  child: _globalWidget.createButton(
                      buttonName: 'Top Right',
                      onPressed: (){
                        setState(() {
                          _alignment = Alignment.topRight;
                        });
                      }
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(right: 16, bottom: 16),
                  child: _globalWidget.createButton(
                      buttonName: 'Center Left',
                      onPressed: (){
                        setState(() {
                          _alignment = Alignment.centerLeft;
                        });
                      }
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(right: 16, bottom: 16),
                  child: _globalWidget.createButton(
                      buttonName: 'Center',
                      onPressed: (){
                        setState(() {
                          _alignment = Alignment.center;
                        });
                      }
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(right: 16, bottom: 16),
                  child: _globalWidget.createButton(
                      buttonName: 'Center Right',
                      onPressed: (){
                        setState(() {
                          _alignment = Alignment.centerRight;
                        });
                      }
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(right: 16, bottom: 16),
                  child: _globalWidget.createButton(
                      buttonName: 'Bottom Left',
                      onPressed: (){
                        setState(() {
                          _alignment = Alignment.bottomLeft;
                        });
                      }
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(right: 16, bottom: 16),
                  child: _globalWidget.createButton(
                      buttonName: 'Bottom Center',
                      onPressed: (){
                        setState(() {
                          _alignment = Alignment.bottomCenter;
                        });
                      }
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(right: 16, bottom: 16),
                  child: _globalWidget.createButton(
                      buttonName: 'Bottom Right',
                      onPressed: (){
                        setState(() {
                          _alignment = Alignment.bottomRight;
                        });
                      }
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Container(
              width: 250.0,
              height: 250.0,
              color: Colors.pinkAccent,
              child: AnimatedAlign(
                alignment: _alignment,
                duration: Duration(seconds: 1),
                curve: Curves.fastOutSlowIn,
                child: FlutterLogo(size: 50.0),
              ),
            )
          ],
        ),
      ),
    );
  }
}
