import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';

class AnimatedContainer3Page extends StatefulWidget {
  @override
  _AnimatedContainer3PageState createState() => _AnimatedContainer3PageState();
}

class _AnimatedContainer3PageState extends State<AnimatedContainer3Page> {
  // initialize global widget
  final _globalWidget = GlobalWidget();

  Alignment _containerAlignment = Alignment.topLeft;

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
                  title: 'Animated Container 3',
                  desc: 'This is the example of animated container'
              ),
              _globalWidget.createButton(
                  buttonName: 'Move to top right',
                  onPressed: (){
                    setState(() {
                      _containerAlignment = Alignment.topRight;
                    });
                  }
              ),
              SizedBox(height: 8),
              _globalWidget.createButton(
                  buttonName: 'Move to bottom right',
                  onPressed: (){
                    setState(() {
                      _containerAlignment = Alignment.bottomRight;
                    });
                  }
              ),
              SizedBox(height: 16),
              AnimatedContainer(
                duration: Duration(milliseconds: 500),
                width: 400,
                height: 400,
                color: Colors.grey[200],
                alignment: _containerAlignment,
                child: Container(
                  width: 100,
                  height: 100,
                  color: Colors.pinkAccent,
                  child: Center(
                    child: Text('Container', style: TextStyle(
                      color: Colors.white
                    )),
                  )
                ),
              ),
            ],
          ),
        )
    );
  }
}
