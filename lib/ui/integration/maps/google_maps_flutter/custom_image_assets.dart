/*
This function is used for draw custom marker icon on the google maps using image assets
 */

import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class CustomImageAssets extends CustomPainter {
  final String imageLabel;
  final ui.Image imageData;
  final Color labelColor;
  final double fontSize;

  CustomImageAssets({this.imageLabel='label', required this.imageData, this.labelColor=Colors.pinkAccent, this.fontSize=30});

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
          text: this.imageLabel,
          style: TextStyle(fontSize: fontSize, color: Colors.white),
        ),
        textDirection: TextDirection.ltr
    );

    textPainter.layout(minWidth: 0, maxWidth: size.width);
    textPainter.paint(canvas, Offset(15, size.height/2-textPainter.size.height/2));

    Paint paint2 = Paint();
    paint2.blendMode = BlendMode.src;
    canvas.drawImage(imageData, Offset(size.width/2-imageData.width/2, size.height+10), paint2);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
