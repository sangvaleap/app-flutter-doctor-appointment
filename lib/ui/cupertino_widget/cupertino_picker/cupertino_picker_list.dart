import 'package:doctor_app/config/constant.dart';
import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:doctor_app/ui/cupertino_widget/cupertino_picker/cupertino_picker1.dart';
import 'package:doctor_app/ui/cupertino_widget/cupertino_picker/cupertino_picker2.dart';
import 'package:doctor_app/ui/cupertino_widget/cupertino_picker/cupertino_picker3.dart';
import 'package:doctor_app/ui/cupertino_widget/cupertino_picker/cupertino_picker4.dart';
import 'package:flutter/material.dart';

class CupertinoPickerListPage extends StatefulWidget {
  @override
  _CupertinoPickerListPageState createState() => _CupertinoPickerListPageState();
}

class _CupertinoPickerListPageState extends State<CupertinoPickerListPage> {
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
              child: Text('Cupertino Picker', style: TextStyle(
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
                        child: Text('An iOS-style picker control. Used to select an item in a short list.', style: TextStyle(
                            fontSize: 15, color: BLACK77,letterSpacing: 0.5
                        )),
                      )
                  ),
                  Flexible(
                      flex: 2,
                      child: Container(
                          alignment: Alignment.center,
                          child: Icon(Icons.filter_list_outlined, size: 50, color: SOFT_BLUE))
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
            _globalWidget.screenDetailList(context: context, title: 'Cupertino Picker 1 - Standart', page: CupertinoPicker1Page()),
            _globalWidget.screenDetailList(context: context, title: 'Cupertino Picker 2 - Styling Selected Value', page: CupertinoPicker2Page()),
            _globalWidget.screenDetailList(context: context, title: 'Cupertino Picker 3 - Infinite Loop', page: CupertinoPicker3Page()),
            _globalWidget.screenDetailList(context: context, title: 'Cupertino Picker 4 - with Dialog', page: CupertinoPicker4Page()),
          ],
        )
    );
  }
}
