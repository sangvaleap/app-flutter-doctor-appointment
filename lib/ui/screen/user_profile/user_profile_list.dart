import 'package:doctor_app/config/constant.dart';
import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:doctor_app/ui/screen/user_profile/user_profile1.dart';
import 'package:doctor_app/ui/screen/user_profile/user_profile2.dart';
import 'package:doctor_app/ui/screen/user_profile/user_profile3.dart';
import 'package:flutter/material.dart';

class UserProfileListPage extends StatefulWidget {
  @override
  _UserProfileListPageState createState() => _UserProfileListPageState();
}

class _UserProfileListPageState extends State<UserProfileListPage> {
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
              child: Text('User Profile Screen', style: TextStyle(
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
                        child: Text('User profile screen', style: TextStyle(
                            fontSize: 15, color: BLACK77,letterSpacing: 0.5
                        )),
                      )
                  ),
                  Flexible(
                      flex: 2,
                      child: Container(
                          alignment: Alignment.center,
                          child: Icon(Icons.account_circle, size: 50, color: SOFT_BLUE))
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 48),
              child: Text('Screen List', style: TextStyle(
                  fontSize: 18, color: BLACK21, fontWeight: FontWeight.w500
              )),
            ),
            SizedBox(height: 18),
            _globalWidget.screenDetailList(context: context, title: 'User Profile 1', page: UserProfile1Page()),
            _globalWidget.screenDetailList(context: context, title: 'User Profile 2', page: UserProfile2Page()),
            _globalWidget.screenDetailList(context: context, title: 'User Profile 3', page: UserProfile3Page()),
          ],
        )
    );
  }
}
