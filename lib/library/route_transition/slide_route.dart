import 'package:flutter/material.dart';

class SlideRoute extends PageRouteBuilder {
  final Widget page;
  final String slideFrom;

  SlideRoute({required this.page, this.slideFrom = 'left'})
      : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) {
            return page;
          },
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) {
            Offset _offset = Offset(-1, 0);
            if(slideFrom=='right'){
              _offset = Offset(1, 0);
            } else if(slideFrom=='top'){
              _offset = Offset(0, -1);
            } else if(slideFrom=='bottom'){
              _offset = Offset(0, 1);
            }
            return SlideTransition(
              position: Tween<Offset>(
                begin: _offset,
                end: Offset.zero,
              ).animate(animation),
              child: child,
            );
          }
        );
}
