import 'package:doctor_app/theme/colors.dart';
import 'package:flutter/material.dart';

class DoctorInfoBox extends StatelessWidget {
  DoctorInfoBox({ Key? key, required this.value, required this.info, this.icon = Icons.info ,this.color = primary,}) : super(key: key);
  IconData icon;
  Color color;
  String value;
  String info;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 150,
        height: 150,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 1,
              offset: Offset(1, 1), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: color, size: 40,),
            SizedBox(height: 7,),
            Text(value, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
            SizedBox(height: 7,),
            Text(info, style: TextStyle(fontSize: 12, color: Colors.grey, fontWeight: FontWeight.w500),)
          ],
        ),
      );
  }
}