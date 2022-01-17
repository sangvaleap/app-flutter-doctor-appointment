import 'package:doctor_app/config/constant.dart';
import 'package:doctor_app/ui/feature/category_menu/category_menu1.dart';
import 'package:doctor_app/ui/feature/category_menu/category_menu2.dart';
import 'package:doctor_app/ui/feature/category_menu/category_menu3.dart';
import 'package:doctor_app/ui/feature/category_menu/category_menu4.dart';
import 'package:doctor_app/ui/feature/category_menu/category_menu5.dart';
import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';

class CategoryMenuListPage extends StatefulWidget {
  @override
  _CategoryMenuListPageState createState() => _CategoryMenuListPageState();
}

class _CategoryMenuListPageState extends State<CategoryMenuListPage> {
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
              child: Text('Category Menu', style: TextStyle(
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
                        child: Text('Category menu used to list all category of the apps.', style: TextStyle(
                            fontSize: 15, color: BLACK77,letterSpacing: 0.5
                        )),
                      )
                  ),
                  Flexible(
                      flex: 2,
                      child: Container(
                          alignment: Alignment.center,
                          child: Icon(Icons.category, size: 50, color: SOFT_BLUE))
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
            _globalWidget.screenDetailList(context: context, title: 'Category Menu 1 (Standart)', page: CategoryMenu1Page()),
            _globalWidget.screenDetailList(context: context, title: 'Category Menu 2 (Horizontal)', page: CategoryMenu2Page()),
            _globalWidget.screenDetailList(context: context, title: 'Category Menu 3 (Bordering)', page: CategoryMenu3Page()),
            _globalWidget.screenDetailList(context: context, title: 'Category Menu 4 (Image Bordering)', page: CategoryMenu4Page()),
            _globalWidget.screenDetailList(context: context, title: 'Category Menu 5 (Card)', page: CategoryMenu5Page()),
          ],
        )
    );
  }
}
