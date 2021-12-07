import 'package:flutter/material.dart';

class ContactBox extends StatelessWidget {
  ContactBox({ Key? key, required this.icon, required this.color}) : super(key: key);
  IconData icon;
  Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 45,
      decoration: BoxDecoration(
        color: color.withAlpha(30),
        borderRadius: BorderRadius.circular(30)
      ),
      child: Icon(icon, color: color, size: 25,),
    );
  }
}