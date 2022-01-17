import 'package:flutter/foundation.dart';
import 'package:universal_io/io.dart';

import 'package:doctor_app/config/constant.dart';
import 'package:doctor_app/ui/reusable/cache_image_network.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

class UserProfile2Page extends StatefulWidget {
  @override
  _UserProfile2PageState createState() => _UserProfile2PageState();
}

class _UserProfile2PageState extends State<UserProfile2Page> {
  Color _gradientTop = Color(0xFF039be6);
  Color _gradientBottom = Color(0xFF0299e2);
  Color _color1 = Color(0xFF0181cc);
  Color _color2 = Color(0xFF333333);

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
    double topHeight = MediaQuery.of(context).size.height / 3;
    if(kIsWeb){
      topHeight = MediaQuery.of(context).size.height / 2.5;
    }
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: Platform.isIOS?SystemUiOverlayStyle.light:SystemUiOverlayStyle(
            statusBarIconBrightness: Brightness.light
        ),
        child: SingleChildScrollView(
          child: Stack(
            children: <Widget>[
              Container(
                alignment: Alignment.topCenter,
                padding: EdgeInsets.fromLTRB(20, 40, 20, 0),
                height: topHeight,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [_gradientTop, _gradientBottom],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    GestureDetector(
                        onTap: () {
                          Navigator.of(context, rootNavigator: true).pop();
                        },
                        child: Icon(Icons.arrow_back, color: Colors.white)),
                    GestureDetector(
                        onTap: () {
                          Fluttertoast.showToast(msg: 'Click edit profile', toastLength: Toast.LENGTH_SHORT);
                        },
                        child: Text('Edit', style: TextStyle(color: Colors.white))),
                  ],
                ),
              ),
              Container(
                alignment: Alignment.topCenter,
                margin:
                EdgeInsets.only(top: (MediaQuery.of(context).size.height / 8)),
                child: Image.asset('assets/images/logo_horizontal.png', height: 30, color: Colors.white),
              ),
              Container(
                alignment: Alignment.topCenter,
                margin: EdgeInsets.only(
                    top: (topHeight) -
                        MediaQuery.of(context).size.width / 5.5),
                child: Column(
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        _showAlertDialog(context);
                      },
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: MediaQuery.of(context).size.width / 5.5,
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: (MediaQuery.of(context).size.width / 5.5) - 4,
                          child: ClipOval(
                              child: buildCacheNetworkImage(url: GLOBAL_URL+'/assets/images/user/avatar.png', width: 300)
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
                      alignment: Alignment.topLeft,
                      margin: EdgeInsets.only(top: 64),
                      child: Column(
                        children: <Widget>[
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Icon(Icons.person, color: _color1, size: 20),
                              SizedBox(width: 20,),
                              Flexible(child:
                                Text('Robert Steven', style: TextStyle(
                                  fontSize: 16, color: _color2, fontWeight: FontWeight.w600
                                ))
                              )
                            ],
                          ),
                          SizedBox(height: 24),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Icon(Icons.email, color: _color1, size: 20),
                              SizedBox(width: 20,),
                              Flexible(child:
                                Text('example@domain.com', style: TextStyle(
                                  fontSize: 16, color: _color2, fontWeight: FontWeight.w600
                                ))
                              )
                            ],
                          ),
                          SizedBox(height: 24),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Icon(Icons.phone_android, color: _color1, size: 20),
                              SizedBox(width: 20,),
                              Flexible(child:
                                Text('0811888999', style: TextStyle(
                                  fontSize: 16, color: _color2, fontWeight: FontWeight.w600
                                ))
                              )
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
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
