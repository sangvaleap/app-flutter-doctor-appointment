import 'package:doctor_app/config/constant.dart';
import 'package:doctor_app/ui/feature/interactive_chip/action_chip.dart';
import 'package:doctor_app/ui/feature/interactive_chip/choice_chip.dart';
import 'package:doctor_app/ui/feature/interactive_chip/filter_chip.dart';
import 'package:doctor_app/ui/feature/interactive_chip/input_chip.dart';
import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';

class InteractiveChipListPage extends StatefulWidget {
  @override
  _InteractiveChipListPageState createState() => _InteractiveChipListPageState();
}

class _InteractiveChipListPageState extends State<InteractiveChipListPage> {
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
              child: Text('Interactive Chip List', style: TextStyle(
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
                        child: Text('Chip for input, choice, filter and action.', style: TextStyle(
                            fontSize: 15, color: BLACK77,letterSpacing: 0.5
                        )),
                      )
                  ),
                  Flexible(
                      flex: 2,
                      child: Container(
                          alignment: Alignment.center,
                          child: Icon(Icons.label, size: 50, color: SOFT_BLUE))
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
            _globalWidget.screenDetailList(context: context, title: 'Input Chip', page: InputChipPage()),
            _globalWidget.screenDetailList(context: context, title: 'Choice Chip', page: ChoiceChipPage()),
            _globalWidget.screenDetailList(context: context, title: 'Filter Chip', page: FilterChipPage()),
            _globalWidget.screenDetailList(context: context, title: 'Action Chip', page: ActionChipPage()),
          ],
        )
    );
  }
}
