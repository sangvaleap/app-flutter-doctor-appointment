import 'package:flutter/widgets.dart';

class OverBoardAnimator {
  late TickerProvider _vsync;
  late AnimationController _controller;
  late Animation _animation;

  OverBoardAnimator(vsync) {
    this._vsync = vsync;
    _controller = AnimationController(
        vsync: _vsync, duration: const Duration(milliseconds: 500));
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);
    //print('creating new animator');
  }

  AnimationController getController() {
    return _controller;
  }

  Animation getAnimator() {
    return _animation;
  }

  dispose() {
    _controller.dispose();
  }
}
