import 'package:doctor_app/config/constant.dart';
import 'package:doctor_app/ui/reusable/cache_image_network.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

class UserProfile1Page extends StatefulWidget {
  @override
  _UserProfile1PageState createState() => _UserProfile1PageState();
}

class _UserProfile1PageState extends State<UserProfile1Page> {
  Color _color1 = Color(0xFFE43F3F);
  Color _color2 = Color(0xFF333333);
  Color _color3 = Color(0xFF666666);

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
        appBar: AppBar(
          backgroundColor: _color1,
          systemOverlayStyle: SystemUiOverlayStyle.light,
          elevation: 0,
          centerTitle: true,
          title: Text('User Profile', style: TextStyle(
            fontSize: 18,
          )),
        ),
        body: ListView(
          padding: EdgeInsets.all(32),
          children: [
            Center(
              child: GestureDetector(
                onTap: (){
                  _showAlertDialog(context);
                },
                child: ClipOval(
                  child: buildCacheNetworkImage(url: GLOBAL_URL+'/assets/images/user/avatar.png', width: 200),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 32),
              alignment: Alignment.center,
              child: Text('Robert Steven', style: TextStyle(
                  fontSize: 18, fontWeight: FontWeight.bold, color: _color2
              )),
            ),
            Container(
              margin: EdgeInsets.only(top: 12),
              alignment: Alignment.center,
              child: GestureDetector(
                onTap: (){
                  Fluttertoast.showToast(msg: 'Click edit profile', toastLength: Toast.LENGTH_SHORT);
                },
                child: Text('edit profile', style: TextStyle(
                    fontSize: 14, fontWeight: FontWeight.bold, color: _color1, decoration: TextDecoration.underline, decorationThickness: 2
                )),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 32),
              padding: EdgeInsets.all(32),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                    Radius.circular(10.0)
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Name', style: TextStyle(
                      color: Colors.grey[700], fontSize: 13
                  )),
                  SizedBox(height: 4),
                  Text('Robert Steven', style: TextStyle(
                      color: _color3, fontSize: 15, fontWeight: FontWeight.bold
                  )),
                  SizedBox(height: 16),
                  Text('Email', style: TextStyle(
                      color: Colors.grey[700], fontSize: 13
                  )),
                  SizedBox(height: 4),
                  Text('example@domain.com', style: TextStyle(
                      color: _color3, fontSize: 15, fontWeight: FontWeight.bold
                  )),
                  SizedBox(height: 16),
                  Text('Phone Number', style: TextStyle(
                      color: Colors.grey[700], fontSize: 13
                  )),
                  SizedBox(height: 4),
                  Text('0811888999', style: TextStyle(
                      color: _color3, fontSize: 15, fontWeight: FontWeight.bold
                  )),
                ],
              ),
            )
          ],
        )
    );
  }

  void _showAlertDialog(BuildContext context) {
    // set up the buttons
    Widget cancelButton = TextButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: Text('No', style: TextStyle(color: SOFT_BLUE))
    );
    Widget continueButton = TextButton(
        onPressed: () {
          Navigator.pop(context);
          Fluttertoast.showToast(msg: 'Click edit profile picture', toastLength: Toast.LENGTH_SHORT);
        },
        child: Text('Yes', style: TextStyle(color: SOFT_BLUE))
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      content: Text('Edit Profile Picture ?'),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
