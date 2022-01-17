import 'package:doctor_app/config/constant.dart';
import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:doctor_app/ui/widget/form_component/button_widget.dart';
import 'package:doctor_app/ui/widget/form_component/checkbox_widget.dart';
import 'package:doctor_app/ui/widget/form_component/date_picker_widget.dart';
import 'package:doctor_app/ui/widget/form_component/dropdown_widget.dart';
import 'package:doctor_app/ui/widget/form_component/radio_button_widget.dart';
import 'package:doctor_app/ui/widget/form_component/slider_widget.dart';
import 'package:doctor_app/ui/widget/form_component/switch_widget.dart';
import 'package:doctor_app/ui/widget/form_component/text_field_widget.dart';
import 'package:doctor_app/ui/widget/form_component/time_picker_widget.dart';
import 'package:doctor_app/ui/widget/form_component/toggle_button_widget.dart';
import 'package:flutter/material.dart';

class FormComponentWidgetListPage extends StatefulWidget {
  @override
  _FormComponentWidgetListPageState createState() => _FormComponentWidgetListPageState();
}

class _FormComponentWidgetListPageState extends State<FormComponentWidgetListPage> {
  // initialize global widget
  final _globalWidget = GlobalWidget();

  @override
  void initState() {
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
        body: ListView(
          padding: EdgeInsets.fromLTRB(24, 24, 24, 16),
          children: [
            Container(
              child: Text('Form Component Widget', style: TextStyle(
                  fontSize: 18, color: BLACK21, fontWeight: FontWeight.w500
              )),
            ),
            Container(
              margin: EdgeInsets.only(top: 24),
              child: Row(
                children: [
                  Flexible(
                      flex:5,
                      child: Container(
                        child: Text('Form component usually used to manipulated data.', style: TextStyle(
                            fontSize: 15, color: BLACK77,letterSpacing: 0.5
                        )),
                      )
                  ),
                  Flexible(
                      flex: 2,
                      child: Container(
                          alignment: Alignment.center,
                          child: Icon(Icons.list_alt, size: 50, color: SOFT_BLUE))
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 48),
              child: Text('List', style: TextStyle(
                  fontSize: 18, color: BLACK21, fontWeight: FontWeight.w500
              )),
            ),
            SizedBox(height: 18),
            _globalWidget.screenDetailList(context: context, title: 'TextField', page: TextFieldWidgetPage()),
            _globalWidget.screenDetailList(context: context, title: 'Checkbox', page: CheckboxWidgetPage()),
            _globalWidget.screenDetailList(context: context, title: 'RadioButton', page: RadioButtonWidgetPage()),
            _globalWidget.screenDetailList(context: context, title: 'DropdownButton', page: DropdownButtonWidgetPage()),
            _globalWidget.screenDetailList(context: context, title: 'Button', page: ButtonWidgetPage()),
            _globalWidget.screenDetailList(context: context, title: 'Slider', page: SliderWidgetPage()),
            _globalWidget.screenDetailList(context: context, title: 'Switch', page: SwitchWidgetPage()),
            _globalWidget.screenDetailList(context: context, title: 'ToggleButton', page: ToggleButtonWidgetPage()),
            _globalWidget.screenDetailList(context: context, title: 'DatePicker', page: DatePickerWidgetPage()),
            _globalWidget.screenDetailList(context: context, title: 'TimePicker', page: TimePickerWidgetPage()),
          ],
        )
    );
  }
}
