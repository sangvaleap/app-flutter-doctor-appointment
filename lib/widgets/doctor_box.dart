import 'package:flutter/material.dart';

class DoctorBox extends StatelessWidget {
  DoctorBox({ Key? key, required this.index, required this.doctor, required this.onTap}) : super(key: key);
  final int index;
  final doctor;
  final GestureTapCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.all(5),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                height: index.isEven ? 100 : 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    image: NetworkImage(doctor["image"]),
                    fit: BoxFit.cover
                  ),
                )
              ),
            ),
            SizedBox(height: 10),
            Text(doctor["name"], maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
            SizedBox(height: 3),
            Text(doctor["skill"], style: TextStyle(color: Colors.grey, fontSize: 13),),
            SizedBox(height: 3),
            Row(
              children: [
                Icon(Icons.star, color: Colors.yellow, size: 14,), 
                SizedBox(width: 2,),
                Text("${doctor["review"]} Review", style: TextStyle(fontSize: 12),)
              ],
            ),
            SizedBox(height: 3),
          ],
        )
      ),
    );
  }
}