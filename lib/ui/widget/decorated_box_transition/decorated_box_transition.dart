import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';

class DecoratedBoxTransitionPage extends StatefulWidget {
  @override
  _DecoratedBoxTransitionPageState createState() => _DecoratedBoxTransitionPageState();
}

class _DecoratedBoxTransitionPageState extends State<DecoratedBoxTransitionPage> with TickerProviderStateMixin {
  // initialize global widget
  final _globalWidget = GlobalWidget();

  final DecorationTween decorationTween = DecorationTween(
    begin: BoxDecoration(
      color: Color(0xFFFFFFFF),
      border: Border.all(style: BorderStyle.none),
      borderRadius: BorderRadius.circular(60.0),
      shape: BoxShape.rectangle,
      boxShadow: <BoxShadow>[
        BoxShadow(
          color: Color(0x66666666),
          blurRadius: 10.0,
          spreadRadius: 3.0,
          offset: Offset(0, 6.0),
        )
      ],
    ),
    end: BoxDecoration(
      color: Color(0xFFFFFFFF),
      border: Border.all(
        style: BorderStyle.none,
      ),
      borderRadius: BorderRadius.zero,
      // No shadow.
    ),
  );

  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: Duration(seconds: 3),
  )..repeat(reverse: true);

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
                title: 'Decorated Box Transition',
                desc: 'Animated version of a DecoratedBox that animates the different properties of its Decoration.',
                icon: Icons.animation
            ),
            SizedBox(height: 16),
            Container(
              margin: EdgeInsets.symmetric(vertical: 8),
              child: DecoratedBoxTransition(
                position: DecorationPosition.background,
                decoration: decorationTween.animate(_controller),
                child: Container(
                  width: 200,
                  height: 200,
                  padding: EdgeInsets.all(10),
                  child: Icon(Icons.star, color: Colors.orange, size: 100),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
