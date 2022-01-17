import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';

class AnimatedContainer2Page extends StatefulWidget {
  @override
  _AnimatedContainer2PageState createState() => _AnimatedContainer2PageState();
}

class _AnimatedContainer2PageState extends State<AnimatedContainer2Page> {
  // initialize global widget
  final _globalWidget = GlobalWidget();

  Color _containerColor = Colors.pinkAccent;

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
                  title: 'Animated Container 2',
                  desc: 'This is the example of animated container'
              ),
              _globalWidget.createButton(
                  buttonName: 'Change color to green',
                  onPressed: (){
                    setState(() {
                      _containerColor = Colors.green;
                    });
                  }
              ),
              SizedBox(height: 8),
              _globalWidget.createButton(
                  buttonName: 'Change color to orange',
                  onPressed: (){
                    setState(() {
                      _containerColor = Colors.orangeAccent;
                    });
                  }
              ),
              SizedBox(height: 16),
              AnimatedContainer(
                duration: Duration(milliseconds: 500),
                width: 100,
                height: 100,
                color: _containerColor,
                child: Center(
                    child: Text('container', style: TextStyle(
                        color: Colors.white
                    ))
                ), // please note that width of container will not work if the container is inside ListView
              ),
            ],
          ),
        )
    );
  }
}
