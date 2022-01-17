import 'package:doctor_app/config/constant.dart';
import 'package:doctor_app/ui/integration/api/api1.dart';
import 'package:doctor_app/ui/integration/api/api2.dart';
import 'package:doctor_app/ui/integration/api/crud/api3.dart';
import 'package:doctor_app/ui/integration/api/login_module/login.dart';
import 'package:doctor_app/ui/integration/api/product_grid.dart';
import 'package:doctor_app/ui/integration/api/product_listview.dart';
import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';

class ApiListPage extends StatefulWidget {
  @override
  _ApiListPageState createState() => _ApiListPageState();
}

class _ApiListPageState extends State<ApiListPage> {
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
              child: Text('Get Data from API List', style: TextStyle(
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
                        child: Text('API is used to connect data from backend server.', style: TextStyle(
                            fontSize: 15, color: BLACK77,letterSpacing: 0.5
                        )),
                      )
                  ),
                  Flexible(
                      flex: 2,
                      child: Container(
                          alignment: Alignment.center,
                          child: Icon(Icons.sync_alt, size: 50, color: SOFT_BLUE))
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
            _globalWidget.screenDetailList(context: context, title: 'API 1 (GET Method)', page: Api1Page()),
            _globalWidget.screenDetailList(context: context, title: 'API 2 (POST Method)', page: Api2Page()),
            _globalWidget.screenDetailList(context: context, title: 'API 3 (CRUD)', page: Api3Page()),
            _globalWidget.screenDetailList(context: context, title: 'Login Module', page: LoginPage()),
            _globalWidget.screenDetailList(context: context, title: 'Product Grid', page: ProductGridPage()),
            _globalWidget.screenDetailList(context: context, title: 'Product ListView', page: ProductListviewPage()),
          ],
        )
    );
  }
}
