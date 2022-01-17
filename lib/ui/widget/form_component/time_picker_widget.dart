import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';
import 'package:date_format/date_format.dart';

class TimePickerWidgetPage extends StatefulWidget {
  @override
  _TimePickerWidgetPageState createState() => _TimePickerWidgetPageState();
}

class _TimePickerWidgetPageState extends State<TimePickerWidgetPage> {
  // initialize global widget
  final _globalWidget = GlobalWidget();

  late String _setTime;
  late String _hour, _minute, _time;
  TimeOfDay selectedTime = TimeOfDay(hour: 00, minute: 00);

  TextEditingController _timeController = TextEditingController();

  @override
  void initState() {
    _timeController.text = formatDate(
        DateTime(2019, 08, 1, DateTime.now().hour, DateTime.now().minute),
        [hh, ':', nn, " ", am]).toString();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: _globalWidget.globalAppBar(),
        body: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(24, 24, 24, 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _globalWidget.createDetailWidget(
                  title: 'TimePicker Widget',
                  desc: 'This is the example of TimePicker'
              ),
              Container(
                  margin: EdgeInsets.symmetric(vertical: 8),
                  child: GestureDetector(
                    onTap: () {
                      _selectTime(context);
                    },
                    child: TextFormField(
                      style: TextStyle(fontSize: 40),
                      onSaved: (String? val) {
                        _setTime = val!;
                        print(_setTime.toString());
                      },
                      enabled: false,
                      keyboardType: TextInputType.text,
                      controller: _timeController,
                      decoration: InputDecoration(
                          disabledBorder:
                          UnderlineInputBorder(borderSide: BorderSide.none),
                          contentPadding: EdgeInsets.all(5)),
                    ),
                  )
              ),
            ],
          ),
        )
    );
  }

  Future<Null> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );
    if (picked != null)
      setState(() {
        selectedTime = picked;
        _hour = selectedTime.hour.toString();
        _minute = selectedTime.minute.toString();
        _time = _hour + ' : ' + _minute;
        _timeController.text = _time;
        _timeController.text = formatDate(
            DateTime(2019, 08, 1, selectedTime.hour, selectedTime.minute),
            [hh, ':', nn, " ", am]).toString();
      });
  }
}
