import 'package:doctor_app/constant/constant.dart';
// import 'package:doctor_app/pages/screens.dart';
import 'package:flutter/material.dart';
import 'package:horizontal_calendar_widget/date_helper.dart';
import 'package:horizontal_calendar_widget/horizontal_calendar.dart';
import 'package:page_transition/page_transition.dart';

const labelMonth = 'Month';
const labelDate = 'Date';
const labelWeekDay = 'Week Day';

class DoctorTimeSlot extends StatefulWidget {
  final String doctorType, experience, name, address, image;
  final phone, lat, lang;
  //final double cost;

  const DoctorTimeSlot({
    required Key key,
    required this.doctorType,
    required this.experience,
    required this.name,
    required this.address,
    @required this.phone,
    required this.image,
    @required this.lat,
    @required this.lang,
    //@required this.cost
  }) : super(key: key);
  @override
  _DoctorTimeSlotState createState() => _DoctorTimeSlotState();
}

class _DoctorTimeSlotState extends State<DoctorTimeSlot> {
  late String selectedTime = '';
  late String selectedDate;
  late String monthString;
  double cost = 850;
  final morningSlotList = [
    {'time': '08:30'},
    {'time': '09:00'},
    {'time': '09:30'},
    {'time': '10:00'},
    {'time': '10:30'},
    {'time': '11:00'}
  ];

  final afternoonSlotList = [
    {'time': '12:30'},
    {'time': '13:30'},
    {'time': '14:30'},
    {'time': '15:30'},
    {'time': '17:30'},
    {'time': '18:00'}
  ];

  final eveningSlotList = [
    {'time': '20:00'},
    {'time': '20:30'},
    {'time': '21:00'},
    {'time': '21:30'},
    {'time': '22:00'},
    {'time': '22:30'}
  ];

  late DateTime firstDate;
  late DateTime lastDate;
  String dateFormat = 'dd';
  String monthFormat = 'MMM';
  String weekDayFormat = 'EEE';
  List<String> order = [labelMonth, labelDate, labelWeekDay];
  bool forceRender = false;

  Color defaultDecorationColor = Colors.transparent;
  BoxShape defaultDecorationShape = BoxShape.circle;
  bool isCircularRadiusDefault = true;

  Color selectedDecorationColor = primaryColor;
  BoxShape selectedDecorationShape = BoxShape.circle;
  bool isCircularRadiusSelected = true;

  Color disabledDecorationColor = Colors.grey;
  BoxShape disabledDecorationShape = BoxShape.circle;
  bool isCircularRadiusDisabled = true;

  int minSelectedDateCount = 1;
  int maxSelectedDateCount = 1;
  late RangeValues selectedDateCount;

  late List<DateTime> initialSelectedDates;

  @override
  void initState() {
    super.initState();
    const int days = 30;
    firstDate = toDateMonthYear(DateTime.now());
    lastDate = toDateMonthYear(firstDate.add(Duration(days: days - 1)));
    selectedDateCount = RangeValues(
      minSelectedDateCount.toDouble(),
      maxSelectedDateCount.toDouble(),
    );
    initialSelectedDates = feedInitialSelectedDates(minSelectedDateCount, days);
    setState(() {
      selectedDate =
          '${firstDate.day}-${convertNumberMonthToStringMonth(firstDate.month)}';
    });
  }

  List<DateTime> feedInitialSelectedDates(int target, int calendarDays) {
    List<DateTime> selectedDates = [];

    for (int i = 0; i < calendarDays; i++) {
      if (selectedDates.length == target) {
        break;
      }
      DateTime date = firstDate.add(Duration(days: i));
      if (date.weekday != DateTime.sunday) {
        selectedDates.add(date);
      }
    }
    return selectedDates;
  }

  String convertNumberMonthToStringMonth(month) {
    if (month == 1) {
      monthString = 'January 2021';
    } else if (month == 2) {
      monthString = 'February 2021';
    } else if (month == 3) {
      monthString = 'March 2021';
    } else if (month == 4) {
      monthString = 'April 2021';
    } else if (month == 5) {
      monthString = 'May 2021';
    } else if (month == 6) {
      monthString = 'June 2021';
    } else if (month == 7) {
      monthString = 'July 2021';
    } else if (month == 8) {
      monthString = 'August 2021';
    } else if (month == 9) {
      monthString = 'September 2021';
    } else if (month == 10) {
      monthString = 'October 2021';
    } else if (month == 11) {
      monthString = 'November 2021';
    } else if (month == 12) {
      monthString = 'December 2021';
    }
    return monthString;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        backgroundColor: whiteColor,
        titleSpacing: 0.0,
        elevation: 0.0,
        title: Text(
          'Time Slots',
          style: appBarTitleTextStyle,
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: blackColor,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      bottomNavigationBar: (selectedTime == '')
          ? Container(
              height: 0.0,
              width: 0.0,
            )
          : Material(
              elevation: 5.0,
              child: Container(
                color: Colors.white,
                width: double.infinity,
                height: 70.0,
                padding: EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
                alignment: Alignment.center,
                child: InkWell(
                  borderRadius: BorderRadius.circular(15.0),
                  onTap: () {
                    // Navigator.push(
                    //     context,
                    //     PageTransition(
                    //         type: PageTransitionType.rightToLeft,
                    //         duration: Duration(milliseconds: 600),
                    //         child: ConsultationDetail(
                    //           name: widget.name,
                    //           doctorType: widget.doctorType,
                    //           doctorExp: widget.experience,
                    //           image: widget.image,
                    //           date: selectedDate,
                    //           time: selectedTime,
                    //           cost: cost,
                    //         )));
                  },
                  child: Container(
                    width: double.infinity,
                    height: 50.0,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      color: primaryColor,
                    ),
                    child: Text(
                      'Book now',
                      style: whiteColorButtonTextStyle,
                    ),
                  ),
                ),
              ),
            ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Material(
            elevation: 1.0,
            child: Container(
              color: whiteColor,
              padding: EdgeInsets.only(top: fixPadding * 2.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Hero(
                          tag: widget.image,
                          child: Container(
                            width: 76.0,
                            height: 76.0,
                            decoration: BoxDecoration(
                              color: whiteColor,
                              borderRadius: BorderRadius.circular(38.0),
                              border:
                                  Border.all(width: 0.3, color: primaryColor),
                              boxShadow: <BoxShadow>[
                                BoxShadow(
                                  blurRadius: 1.0,
                                  spreadRadius: 1.0,
                                  color: Colors.grey.withOpacity(0.5),
                                ),
                              ],
                              image: DecorationImage(
                                image: AssetImage(widget.image),
                                fit: BoxFit.fitHeight,
                              ),
                            ),
                          ),
                        ),
                        widthSpace,
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      ' ${widget.name}',
                                      style: blackNormalBoldTextStyle,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  Wrap(
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          // Navigator.push(
                                          //     context,
                                          //     PageTransition(
                                          //         duration: Duration(
                                          //             milliseconds: 600),
                                          //         type: PageTransitionType.fade,
                                          //         child: LabList()));
                                        },
                                        child: Text(
                                          'View Profile',
                                          style: primaryColorsmallBoldTextStyle,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(height: 7.0),
                              Text(
                                widget.doctorType,
                                style: greyNormalTextStyle,
                              ),
                              SizedBox(height: 7.0),
                              Text(
                                '${widget.experience} Years Experience',
                                style: primaryColorNormalTextStyle,
                              ),
                              SizedBox(height: 7.0),
                              Text(
                                '\E$cost',
                                style: blackHeadingTextStyle,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  HorizontalCalendar(
                    key: forceRender ? UniqueKey() : Key('Calendar'),
                    selectedDateTextStyle: TextStyle(color: whiteColor),
                    selectedMonthTextStyle: TextStyle(color: whiteColor),
                    selectedWeekDayTextStyle: TextStyle(color: whiteColor),
                    spacingBetweenDates: 10.0,
                    height: 105,
                    padding: EdgeInsets.all(fixPadding * 2.0),
                    firstDate: firstDate,
                    lastDate: lastDate,
                    dateFormat: dateFormat,
                    weekDayFormat: weekDayFormat,
                    monthFormat: monthFormat,
                    defaultDecoration: BoxDecoration(
                      color: defaultDecorationColor,
                      shape: defaultDecorationShape,
                      borderRadius:
                          defaultDecorationShape == BoxShape.rectangle &&
                                  isCircularRadiusDefault
                              ? BorderRadius.circular(8)
                              : null,
                    ),
                    selectedDecoration: BoxDecoration(
                      color: selectedDecorationColor,
                      shape: selectedDecorationShape,
                      borderRadius:
                          selectedDecorationShape == BoxShape.rectangle &&
                                  isCircularRadiusSelected
                              ? BorderRadius.circular(8)
                              : null,
                    ),
                    disabledDecoration: BoxDecoration(
                      color: disabledDecorationColor,
                      shape: disabledDecorationShape,
                      borderRadius:
                          disabledDecorationShape == BoxShape.rectangle &&
                                  isCircularRadiusDisabled
                              ? BorderRadius.circular(8)
                              : null,
                    ),
                    isDateDisabled: (date) => date.weekday == DateTime.sunday,
                    labelOrder: order.map(toLabelType).toList(),
                    maxSelectedDateCount: maxSelectedDateCount,
                    initialSelectedDates: initialSelectedDates,
                    onDateSelected: (e) async {
                      setState(() {
                        selectedDate =
                            '${e.day}-${convertNumberMonthToStringMonth(e.month)}';
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: slots(),
          ),
        ],
      ),
    );
  }

  LabelType toLabelType(String label) {
    LabelType type = LabelType.values.firstWhere((e) => e.toString() == label);
    switch (label) {
      case labelMonth:
        type = LabelType.month;
        break;
      case labelDate:
        type = LabelType.date;
        break;
      case labelWeekDay:
        type = LabelType.weekday;
        break;
    }
    return type;
  }

  slots() {
    return ListView(
      children: [
        heightSpace,
        // Morning Slot Start
        Container(
          padding: EdgeInsets.only(
              bottom: fixPadding * 2.0,
              right: fixPadding * 2.0,
              left: fixPadding * 2.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/icons/sunrise.png',
                height: 35.0,
                width: 35.0,
                fit: BoxFit.cover,
              ),
              widthSpace,
              Text(
                '${morningSlotList.length} Slots',
                style: blackNormalBoldTextStyle,
              )
            ],
          ),
        ),
        Wrap(
          children: morningSlotList
              .map(
                (e) => Padding(
                  padding: EdgeInsets.only(
                      left: fixPadding * 2.0, bottom: fixPadding * 2.0),
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        selectedTime = e['time'].toString();
                      });
                    },
                    child: Container(
                      width: 90.0,
                      padding: EdgeInsets.all(fixPadding),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        border: Border.all(width: 0.7, color: greyColor),
                        color: (e['time'] == selectedTime)
                            ? primaryColor
                            : whiteColor,
                      ),
                      child: Text(e['time'].toString(),
                          style: (e['time'] == selectedTime)
                              ? whiteColorNormalTextStyle
                              : primaryColorNormalTextStyle),
                    ),
                  ),
                ),
              )
              .toList()
              .cast<Widget>(),
        ),

        // Morning Slot End

        // Afternoon Slot Start
        Container(
          padding: EdgeInsets.only(
              bottom: fixPadding * 2.0,
              right: fixPadding * 2.0,
              left: fixPadding * 2.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/icons/sun.png',
                height: 35.0,
                width: 35.0,
                fit: BoxFit.cover,
              ),
              widthSpace,
              Text(
                '${afternoonSlotList.length} Slots',
                style: blackNormalBoldTextStyle,
              )
            ],
          ),
        ),
        Wrap(
          children: afternoonSlotList
              .map(
                (e) => Padding(
                  padding: EdgeInsets.only(
                      left: fixPadding * 2.0, bottom: fixPadding * 2.0),
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        selectedTime = e['time'].toString();
                      });
                    },
                    child: Container(
                      width: 90.0,
                      padding: EdgeInsets.all(fixPadding),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        border: Border.all(width: 0.7, color: greyColor),
                        color: (e['time'] == selectedTime)
                            ? primaryColor
                            : whiteColor,
                      ),
                      child: Text(e['time'].toString(),
                          style: (e['time'] == selectedTime)
                              ? whiteColorNormalTextStyle
                              : primaryColorNormalTextStyle),
                    ),
                  ),
                ),
              )
              .toList()
              .cast<Widget>(),
        ),
        // Afternoon Slot End

        // Evening Slot Start
        Container(
          padding: EdgeInsets.only(
              bottom: fixPadding * 2.0,
              right: fixPadding * 2.0,
              left: fixPadding * 2.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/icons/sun-night.png',
                height: 35.0,
                width: 35.0,
                fit: BoxFit.cover,
              ),
              widthSpace,
              Text(
                '${eveningSlotList.length} Slots',
                style: blackNormalBoldTextStyle,
              )
            ],
          ),
        ),
        Wrap(
          children: eveningSlotList
              .map(
                (e) => Padding(
                  padding: EdgeInsets.only(
                      left: fixPadding * 2.0, bottom: fixPadding * 2.0),
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        selectedTime = e['time'].toString();
                      });
                    },
                    child: Container(
                      width: 90.0,
                      padding: EdgeInsets.all(fixPadding),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        border: Border.all(width: 0.7, color: greyColor),
                        color: (e['time'] == selectedTime)
                            ? primaryColor
                            : whiteColor,
                      ),
                      child: Text(e['time'].toString(),
                          style: (e['time'] == selectedTime)
                              ? whiteColorNormalTextStyle
                              : primaryColorNormalTextStyle),
                    ),
                  ),
                ),
              )
              .toList()
              .cast<Widget>(),
        ),
        // Evening Slot End
      ],
    );
  }
}
