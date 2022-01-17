import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class AnimatedBuilderPage extends StatefulWidget {
  @override
  _AnimatedBuilderPageState createState() => _AnimatedBuilderPageState();
}

class _AnimatedBuilderPageState extends State<AnimatedBuilderPage> with TickerProviderStateMixin{
  // initialize global widget
  final _globalWidget = GlobalWidget();

  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 10),
    vsync: this,
  )..repeat();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
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
                title: 'Animated Builder',
                desc: 'A general-purpose widget for building animations.',
                icon: Icons.animation
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 8),
              child: Center(
                child: AnimatedBuilder(
                  animation: _controller,
                  child: Container(
                    width: 200.0,
                    height: 200.0,
                    color: Colors.pinkAccent,
                    child: Center(
                      child: Text('Rotate', style: TextStyle(
                        color: Colors.white
                      )),
                    ),
                  ),
                  builder: (BuildContext context, Widget? child) {
                    return Transform.rotate(
                      angle: _controller.value * 2.0 * math.pi,
                      child: child,
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
