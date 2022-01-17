import 'package:doctor_app/config/constant.dart';
import 'package:doctor_app/ui/reusable/cache_image_network.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

class UserProfile3Page extends StatefulWidget {
  @override
  _UserProfile3PageState createState() => _UserProfile3PageState();
}

class _UserProfile3PageState extends State<UserProfile3Page> {
  Color _color1 = Color(0xFF07ac12);
  Color _color2 = Color(0xff777777);
  Color _color3 = Color(0xFF515151);

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
          iconTheme: IconThemeData(
            color: Colors.black, //change your color here
          ),
          systemOverlayStyle: SystemUiOverlayStyle.dark,
          elevation: 0,
          title: Text(
            'User Profile',
            style: TextStyle(
                fontSize: 18,
                color: Colors.black
            ),
          ),
          backgroundColor: Colors.white,
          bottom: PreferredSize(
              child: Container(
                color: Colors.grey[100],
                height: 1.0,
              ),
              preferredSize: Size.fromHeight(1.0)),
        ),
        body: Container(
          margin: EdgeInsets.fromLTRB(16, 0, 16, 16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _createProfilePicture(),
                SizedBox(height: 40),
                Text(
                  'Name',
                  style: TextStyle(
                      fontSize: 15,
                      color: _color2,
                      fontWeight: FontWeight.normal
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        'Robert Steven',
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.black
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        Fluttertoast.showToast(msg: 'Click edit name', toastLength: Toast.LENGTH_SHORT);
                      },
                      child: Text('Edit', style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: _color1,
                      )),
                    )
                  ],
                ),
                SizedBox(
                  height: 24,
                ),
                Text(
                  'Email',
                  style: TextStyle(
                      fontSize: 15,
                      color: _color2,
                      fontWeight: FontWeight.normal
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        'robert.steven@ijteknologi.com',
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.black
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        Fluttertoast.showToast(msg: 'Click edit email', toastLength: Toast.LENGTH_SHORT);
                      },
                      child: Text('Edit', style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: _color1,
                      )),
                    )
                  ],
                ),
                SizedBox(
                  height: 24,
                ),
                Text(
                  'Phone Number',
                  style: TextStyle(
                      fontSize: 15,
                      color: _color2,
                      fontWeight: FontWeight.normal
                  ),
                ),
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        '0811888999',
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.black
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        Fluttertoast.showToast(msg: 'Click edit phone number', toastLength: Toast.LENGTH_SHORT);
                      },
                      child: Text('Edit', style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: _color1,
                      )),
                    )
                  ],
                ),
              ],
            ),
          ),
        )
    );
  }

  Widget _createProfilePicture(){
    final double profilePictureSize = MediaQuery.of(context).size.width/3;
    return Align(
      alignment: Alignment.center,
      child: Container(
        margin: EdgeInsets.only(top: 40),
        width: profilePictureSize,
        height: profilePictureSize,
        child: GestureDetector(
          onTap: () {
            _showPopupUpdatePicture();
          },
          child: Stack(
            children: [
              CircleAvatar(
                backgroundColor: Colors.white,
                radius: (profilePictureSize),
                child: Hero(
                  tag: 'profilePicture',
                  child: ClipOval(
                      child: buildCacheNetworkImage(width: profilePictureSize, height: profilePictureSize, url: GLOBAL_URL+'/assets/images/user/avatar.png')
                  ),
                ),
              ),
              // create edit icon in the picture
              Container(
                width: 30,
                height: 30,
                margin: EdgeInsets.only(top: 0, left: MediaQuery.of(context).size.width/4),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  elevation: 1,
                  child: Icon(Icons.edit, size: 12, color: _color3),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showPopupUpdatePicture() {
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
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      title: Text('Edit Profile Picture', style: TextStyle(fontSize: 18),),
      content: Text('Do you want to edit profile picture ?', style: TextStyle(fontSize: 13, color: _color2)),
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
