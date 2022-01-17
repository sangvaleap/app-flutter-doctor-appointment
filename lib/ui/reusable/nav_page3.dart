import 'package:doctor_app/model/screen/notification1_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class NavPage3 extends StatefulWidget {
  @override
  _NavPage3State createState() => _NavPage3State();
}

class _NavPage3State extends State<NavPage3> {
  List<Notification1Model> _notificationData1 = [];

  void _getData(){
    _notificationData1 = [
      Notification1Model(
        id: 1,
        message: 'Your <b>email</b> has been change to the new email</b>',
        notifDate: '28 Jul 2020, 10:00',
      ),
      Notification1Model(
        id: 2,
        message: 'Your <b>password</b> has been successfully changed',
        notifDate: '28 Jul 2020, 10:00',
      ),
      Notification1Model(
        id: 3,
        message: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus aliquam eu massa in tempus. Etiam vitae sodales est.',
        notifDate: '28 Jul 2020, 10:00',
      ),
      Notification1Model(
        id: 4,
        message: 'Curabitur finibus euismod neque eget placerat. Donec tincidunt felis eget blandit dictum.',
        notifDate: '28 Jul 2020, 10:00',
      ),
      Notification1Model(
        id: 5,
        message: 'Interdum et malesuada fames ac ante ipsum primis in faucibus. Duis lacinia dui lacus, in pretium est fringilla a.',
        notifDate: '28 Jul 2020, 10:00',
      ),
      Notification1Model(
        id: 6,
        message: 'Suspendisse tempor urna tellus, vitae tristique mauris tincidunt sed.',
        notifDate: '28 Jul 2020, 10:00',
      ),
      Notification1Model(
        id: 7,
        message: 'Quisque finibus maximus nunc vitae pretium. Nullam lacinia blandit orci, finibus dictum justo ultricies et.',
        notifDate: '28 Jul 2020, 10:00',
      ),
      Notification1Model(
        id: 8,
        message: 'Duis ultrices lacus justo, non fringilla augue euismod gravida.',
        notifDate: '28 Jul 2020, 10:00',
      ),
      Notification1Model(
        id: 9,
        message: 'Etiam ante augue, euismod in facilisis sed, aliquam nec diam. Nullam porttitor sapien a suscipit cursus.',
        notifDate: '28 Jul 2020, 10:00',
      ),
      Notification1Model(
        id: 10,
        message: 'Morbi lacinia quam velit, nec semper leo mattis sit amet. In in diam id enim consequat vestibulum non quis lacus. Proin quis tellus purus.',
        notifDate: '28 Jul 2020, 10:00',
      ),
    ];
  }

  @override
  void initState() {
    _getData();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
            children: List.generate(_notificationData1.length, (index) {
              return _buildNotif(index);
            })
        )
    );
  }

  Widget _buildNotif(index){
    return Container(
        color: Colors.white,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                margin: EdgeInsets.only(top: 10),
                child: Html(
                  data: _notificationData1[index].message,
                  style: {
                    "html": Style.fromTextStyle(TextStyle(fontSize: 14)),
                  },
                ),
              ),
              Container(
                  padding: EdgeInsets.fromLTRB(20, 0, 20, 10),
                  margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                  child: Text(
                    _notificationData1[index].notifDate,
                    style: TextStyle(
                        fontSize: 13,
                        color: Colors.grey[500]
                    ),
                    textAlign: TextAlign.left,
                  )
              ),
              Container(color: Colors.grey[300], height: 1),
            ]
        )
    );
  }
}
