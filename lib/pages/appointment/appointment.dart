import 'package:doctor_app/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import '../../provider/Auth_Provider.dart';

class Appointment extends StatefulWidget {
  @override
  _AppointmentState createState() => _AppointmentState();
}

class _AppointmentState extends State<Appointment> {
  // Auth_Provider authProvider;
  late SharedPreferences prefs;
  List<dynamic> activeAppoinmentList = [
    {
      'doctorName': 'Rapid-Action Coaching',
      'date': '21 June 2021',
      'time': '10:00 AM',
      'doctorType': '43-14271 60 Avenue British Columbia',
    },
    {
      'doctorName': 'Personal Impact Coaching',
      'date': '18 July 2021',
      'time': '12:30 PM',
      'doctorType': 'Online',
    },
    {
      'doctorName': 'Executive Leadership Coaching',
      'date': '22 Oct 2021',
      'time': '6:00 PM',
      'doctorType': '43-14271 60 Avenue British Columbia',
    }
  ];
  // _AppointmentState() {
  //   activeAppointments().then((val) => setState(() {
  //         activeAppoinmentList = val;
  //       }));
  // }
  // Future<List<dynamic>> activeAppointments() async {
  //   prefs = await SharedPreferences.getInstance();
  //   return authProvider.getAppointment(prefs.getString("oid"));
  // }

  final pastAppoinmentList = [
    {
      'doctorName': 'Beatriz Watson',
      'date': '25 April 2021',
      'time': '12:30 PM',
      'doctorType': 'SARS-CoV-2 Testing',
    },
    {
      'doctorName': 'Shira Gates',
      'date': '10 January 2021',
      'time': '11:00 AM',
      'doctorType': 'Microbiologist',
    }
  ];

  final cancelledAppoinmentList = [
    {
      'doctorName': 'Manzini Branch',
      'date': '02 May 2021',
      'time': '10:30 AM',
      'doctorType': 'Chemistry',
    }
  ];

  deleteAppointmentDialog(index) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        // return object of type Dialog
        return Dialog(
          elevation: 0.0,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          child: Wrap(
            children: [
              Container(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Are you sure you want to cancel this appointment?",
                      style: blackNormalTextStyle,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            width: (MediaQuery.of(context).size.width / 3.5),
                            alignment: Alignment.center,
                            padding: EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            child: Text(
                              'No',
                              style: primaryColorButtonTextStyle,
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              activeAppoinmentList.removeAt(index);
                            });
                            Navigator.pop(context);
                          },
                          child: Container(
                            width: (MediaQuery.of(context).size.width / 3.5),
                            alignment: Alignment.center,
                            padding: EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                              color: primaryColor,
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            child: Text(
                              'Yes',
                              style: whiteColorButtonTextStyle,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // authProvider = Provider.of(context, listen: false);
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: whiteColor,
        appBar: AppBar(
          backgroundColor: whiteColor,
          excludeHeaderSemantics: true,
          elevation: 1.0,
          // automaticallyImplyLeading: false,
          // title: Text(
          //   'Appointments',
          //   style: appBarTitleTextStyle,
          // ),
          title: TabBar(
            tabs: [
              Tab(
                child: tabItem('Active', activeAppoinmentList.length),
              ),
              Tab(
                child: tabItem('Past', pastAppoinmentList.length),
              ),
              Tab(
                child: tabItem('Cancelled', cancelledAppoinmentList.length),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            activeAppointment(),
            pastAppointment(),
            cancelledAppointment(),
          ],
        ),
      ),
    );
  }

  tabItem(text, number) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          text,
          style: blackSmallTextStyle,
        ),
        SizedBox(width: 4.0),
        Container(
          width: 20.0,
          height: 20.0,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: primaryColor,
          ),
          child: Text(
            '$number',
            style: TextStyle(
              color: whiteColor,
              fontSize: 10.0,
            ),
          ),
        ),
      ],
    );
  }

  activeAppointment() {
    return (activeAppoinmentList.length == 0)
        ? Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.date_range,
                  color: greyColor,
                  size: 70.0,
                ),
                heightSpace,
                Text(
                  'No Active Appointments',
                  style: greyNormalTextStyle,
                ),
              ],
            ),
          )
        : ListView.builder(
            itemCount: activeAppoinmentList.length,
            itemBuilder: (context, index) {
              final item = activeAppoinmentList[index];
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.all(fixPadding * 2.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 80.0,
                          height: 80.0,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40.0),
                            border: Border.all(width: 1.0, color: Colors.green),
                            color: Colors.green[50],
                          ),
                          child: Text(
                            item['date'],
                            textAlign: TextAlign.center,
                            style: greenColorNormalTextStyle,
                          ),
                        ),
                        widthSpace,
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    item['time'],
                                    style: blackHeadingTextStyle,
                                  ),
                                  InkWell(
                                    onTap: () => deleteAppointmentDialog(index),
                                    child: Icon(
                                      Icons.close,
                                      size: 18.0,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 7.0),
                              Text(
                                '${item['doctorName']}',
                                style: blackNormalTextStyle,
                                overflow: TextOverflow.ellipsis,
                              ),
                              SizedBox(height: 7.0),
                              Text(
                                'Victor Mema',
                                style: primaryColorsmallTextStyle,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  divider(),
                ],
              );
            },
          );
  }

  pastAppointment() {
    return (pastAppoinmentList.length == 0)
        ? Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.date_range,
                  color: greyColor,
                  size: 70.0,
                ),
                heightSpace,
                Text(
                  'No Past Appointments',
                  style: greyNormalTextStyle,
                ),
              ],
            ),
          )
        : ListView.builder(
            itemCount: pastAppoinmentList.length,
            itemBuilder: (context, index) {
              final item = pastAppoinmentList[index];
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.all(fixPadding * 2.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 80.0,
                          height: 80.0,
                          alignment: Alignment.center,
                          padding: EdgeInsets.all(3.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40.0),
                            border: Border.all(width: 1.0, color: primaryColor),
                            color: primaryColor.withOpacity(0.15),
                          ),
                          child: Text(
                            item['date'] ?? '',
                            textAlign: TextAlign.center,
                            style: primaryColorNormalTextStyle,
                          ),
                        ),
                        widthSpace,
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item['time'] ?? '',
                                style: blackHeadingTextStyle,
                              ),
                              SizedBox(height: 7.0),
                              Text(
                                '${item['doctorName']}',
                                style: blackNormalTextStyle,
                                overflow: TextOverflow.ellipsis,
                              ),
                              SizedBox(height: 7.0),
                              Text(
                                '${item['doctorType']}',
                                style: primaryColorsmallTextStyle,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  divider(),
                ],
              );
            },
          );
  }

  cancelledAppointment() {
    return (cancelledAppoinmentList.length == 0)
        ? Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.date_range,
                  color: greyColor,
                  size: 70.0,
                ),
                heightSpace,
                Text(
                  'No Cancelled Appointments',
                  style: greyNormalTextStyle,
                ),
              ],
            ),
          )
        : ListView.builder(
            itemCount: cancelledAppoinmentList.length,
            itemBuilder: (context, index) {
              final item = cancelledAppoinmentList[index];
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.all(fixPadding * 2.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 80.0,
                          height: 80.0,
                          alignment: Alignment.center,
                          padding: EdgeInsets.all(3.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40.0),
                            border: Border.all(width: 1.0, color: Colors.red),
                            color: Colors.red[50],
                          ),
                          child: Text(
                            item['date'] ?? '',
                            textAlign: TextAlign.center,
                            style: redColorNormalTextStyle,
                          ),
                        ),
                        widthSpace,
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item['time'] ?? '',
                                style: blackHeadingTextStyle,
                              ),
                              SizedBox(height: 7.0),
                              Text(
                                '${item['doctorName']}',
                                style: blackNormalTextStyle,
                                overflow: TextOverflow.ellipsis,
                              ),
                              SizedBox(height: 7.0),
                              Text(
                                '${item['doctorType']}',
                                style: primaryColorsmallTextStyle,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  divider(),
                ],
              );
            },
          );
  }

  divider() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
      width: MediaQuery.of(context).size.width - fixPadding * 4.0,
      height: 1.0,
      color: Colors.grey[200],
    );
  }
}
