import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';

class AnimatedContainer1Page extends StatefulWidget {
  @override
  _AnimatedContainer1PageState createState() => _AnimatedContainer1PageState();
}

class _AnimatedContainer1PageState extends State<AnimatedContainer1Page> {
  // initialize global widget
  final _globalWidget = GlobalWidget();

  double _containerWidth = 100;
  double _containerHeight = 100;

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
              _globalWidget.createDetailWidget(
                  title: 'Animated Container 1',
                  desc: 'This is the example of animated container'
              ),
              _globalWidget.createButton(
                  buttonName: 'Change size 1',
                  onPressed: (){
                    setState(() {
                      _containerWidth = 200;
                      _containerHeight = 200;
                    });
                  }
              ),
              SizedBox(height: 8),
              _globalWidget.createButton(
                  buttonName: 'Change size 2',
                  onPressed: (){
                    setState(() {
                      _containerWidth = 100;
                      _containerHeight = 100;
                    });
                  }
              ),
              SizedBox(height: 16),
              Container(
                margin: EdgeInsets.symmetric(vertical: 8),
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 500),
                  width: _containerWidth,
                  height: _containerHeight,
                  color: Colors.pinkAccent,
                  child: Center(
                    child: Text('container', style: TextStyle(
                      color: Colors.white
                    ))
                  ), // please note that width of container will not work if the container is inside ListView
                ),
              ),
            ],
          ),
        )
    );
  }
}
