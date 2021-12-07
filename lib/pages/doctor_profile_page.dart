import 'package:doctor_app/data/json.dart';
import 'package:doctor_app/theme/colors.dart';
import 'package:doctor_app/widgets/avatar_image.dart';
import 'package:doctor_app/widgets/contact_box.dart';
import 'package:doctor_app/widgets/doctor_info_box.dart';
import 'package:doctor_app/widgets/mybutton.dart';
import 'package:flutter/material.dart';

class DoctorProfilePage extends StatefulWidget {
  const DoctorProfilePage({ Key? key }) : super(key: key);

  @override
  _DoctorProfilePageState createState() => _DoctorProfilePageState();
}

class _DoctorProfilePageState extends State<DoctorProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text("Doctor's Profile", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),),
      ),
      body: getBody(),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: MyButton(
          disableButton: false,
          bgColor: primary,
          title: "Request For Appointment",
          onTap: (){

          }
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  getBody(){
    return SingleChildScrollView(
      padding: EdgeInsets.only(left: 15, right: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("Patient time 8:00am - 5:00pm", style: TextStyle(fontSize: 13, color: Colors.green)),
          SizedBox(height: 25, ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Dr. Terry Aminoff", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
                  SizedBox(height: 5, ),
                  Text("Dentist Specialist", style: TextStyle(color: Colors.grey, fontSize: 14),),
                ],
              ),
              AvatarImage(doctors[0]['image'].toString(), radius: 10,)
            ],
          ),
          SizedBox(height: 25, ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.star, size: 18, color: Colors.orangeAccent,),
              Icon(Icons.star, size: 18, color: Colors.orangeAccent,),
              Icon(Icons.star, size: 18, color: Colors.orangeAccent,),
              Icon(Icons.star, size: 18, color: Colors.orangeAccent,),
              Icon(Icons.star, size: 18, color: Colors.grey.shade300,),
            ],
          ),
          SizedBox(height: 5, ),
          Text("4.0 Out of 5.0", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
          SizedBox(height: 3, ),
          Text("340 Patients review", style: TextStyle(color: Colors.grey, fontSize: 12),),
          SizedBox(height: 25, ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ContactBox(icon: Icons.videocam_rounded, color: Colors.blue,),
              ContactBox(icon: Icons.call_end, color: Colors.green,),
              ContactBox(icon: Icons.chat_rounded, color: Colors.purple,),
            ],
          ),
          SizedBox(height: 25, ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              DoctorInfoBox(value: "500+", info: "Successful Patients", icon: Icons.groups_rounded, color: Colors.green,),
              DoctorInfoBox(value: "10 Years", info: "Experience", icon: Icons.medical_services_rounded, color: Colors.purple,),
            ],
          ),
          SizedBox(height: 15, ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
             DoctorInfoBox(value: "28+", info: "Successful OT", icon: Icons.bloodtype_rounded, color: Colors.blue,),
             DoctorInfoBox(value: "8+", info: "Certificates Achieved", icon: Icons.card_membership_rounded, color: Colors.orange,),
            ],
          ),
        ],
      ),
    );
  }

}