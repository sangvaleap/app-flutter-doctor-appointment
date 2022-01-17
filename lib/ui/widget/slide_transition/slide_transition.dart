import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';

class SlideTransitionPage extends StatefulWidget {
  @override
  _SlideTransitionPageState createState() => _SlideTransitionPageState();
}

class _SlideTransitionPageState extends State<SlideTransitionPage> with TickerProviderStateMixin {
  // initialize global widget
  final _globalWidget = GlobalWidget();

  late final AnimationController _controller = AnimationController(
    duration: Duration(seconds: 2),
    vsync: this,
  )..repeat(reverse: true);
  late final Animation<Offset> _offsetAnimation = Tween<Offset>(
    begin: Offset.zero,
    end: Offset(1.5, 0.0),
  ).animate(CurvedAnimation(
    parent: _controller,
    curve: Curves.elasticIn,
  ));

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
                title: 'Slide Transition',
                desc: 'Animates the position of a widget relative to its normal position.',
                icon: Icons.animation
            ),
            SizedBox(height: 16),
            Container(
              margin: EdgeInsets.symmetric(vertical: 8),
              child: SlideTransition(
                position: _offsetAnimation,
                child: Image.asset('assets/images/lamp.jpg', height: 200),
              ),
            )
          ],
        ),
      ),
    );
  }
}
