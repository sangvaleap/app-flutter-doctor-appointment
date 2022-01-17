/*
This function is used for draw custom marker _icon on the google maps
 */

import 'package:flutter/material.dart';

class CustomIcon extends CustomPainter {
  final String iconLabel;
  final IconData iconData;
  final Color iconColor;
  final Color labelColor;
  final double fontSize;
  final double iconSize;

  CustomIcon({this.iconLabel='label', this.iconData=Icons.directions_car, this.iconSize=50, this.iconColor=Colors.green, this.labelColor=Colors.pinkAccent, this.fontSize=30});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();

    final rect = Rect.fromLTWH(0, 0, size.width, size.height);
    final RRect rRect = RRect.fromRectAndRadius(rect, Radius.circular(10));

    paint.color = labelColor;
    paint.strokeWidth = 2;

    canvas.drawRRect(rRect, paint);

    final textPainter = TextPainter(
        text: TextSpan(
          text: this.iconLabel,
          style: TextStyle(fontSize: fontSize, color: Colors.white),
        ),
        textDirection: TextDirection.ltr
    );

    textPainter.layout(minWidth: 0, maxWidth: size.width);
    textPainter.paint(canvas, Offset(15, size.height/2-textPainter.size.height/2));

    TextPainter textPainter2 = TextPainter(textDirection: TextDirection.rtl);
    textPainter2.text = TextSpan(text: String.fromCharCode(iconData.codePoint), style: TextStyle(fontSize: iconSize, fontFamily: iconData.fontFamily, color: iconColor));
    textPainter2.layout();
    textPainter2.paint(canvas, Offset(size.width/2-textPainter2.size.width/2, size.height));
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
