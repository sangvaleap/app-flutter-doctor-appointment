import 'package:doctor_app/config/constant.dart';
import 'package:doctor_app/ui/reusable/cache_image_network.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

class User1Page extends StatefulWidget {
  @override
  _User1PageState createState() => _User1PageState();
}

class _User1PageState extends State<User1Page> {
  Color _color1 = Color(0xff777777);
  Color _color2 = Color(0xFF515151);
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
          elevation: 0,
          title: Text(
            'Account',
            style: TextStyle(
                fontSize: 18,
                color: Colors.black
            ),
          ),
          backgroundColor: Colors.white,
          systemOverlayStyle: SystemUiOverlayStyle.dark,
          actions: [
            GestureDetector(
                onTap: () {
                  Fluttertoast.showToast(msg: 'Click message', toastLength: Toast.LENGTH_SHORT);
                },
                child: Icon(Icons.email, color: _color1)),
            IconButton(
                icon: Icon(Icons.notifications, color: _color1,),
                onPressed: () {
                  Fluttertoast.showToast(msg: 'Click notification', toastLength: Toast.LENGTH_SHORT);
                }),
          ],
          bottom: PreferredSize(
              child: Container(
                color: Colors.grey[100],
                height: 1.0,
              ),
              preferredSize: Size.fromHeight(1.0)),
        ),
        body: ListView(
          padding: EdgeInsets.all(16),
          children: [
            _createAccountInformation(),
            _createListMenu('Change Password'),
            Divider(height: 0, color: Colors.grey[400]),
            _createListMenu('Set Address'),
            Divider(height: 0, color: Colors.grey[400]),
            _createListMenu('Order List'),
            Divider(height: 0, color: Colors.grey[400]),
            _createListMenu('Review'),
            Divider(height: 0, color: Colors.grey[400]),
            _createListMenu('Payment Method'),
            Divider(height: 0, color: Colors.grey[400]),
            _createListMenu('Last Seen Product'),
            Divider(height: 0, color: Colors.grey[400]),
            _createListMenu('Change Language'),
            Divider(height: 0, color: Colors.grey[400]),
            _createListMenu('Notification Setting'),
            Divider(height: 0, color: Colors.grey[400]),
            _createListMenu('About'),
            Divider(height: 0, color: Colors.grey[400]),
            _createListMenu('Terms and Conditions'),
            Divider(height: 0, color: Colors.grey[400]),
            _createListMenu('Privacy Policy'),
            Divider(height: 0, color: Colors.grey[400]),
            Container(
              margin: EdgeInsets.fromLTRB(0, 18, 0, 0),
              child: GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: (){
                  Fluttertoast.showToast(msg: 'Click log out', toastLength: Toast.LENGTH_SHORT);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.power_settings_new, size: 20, color: ASSENT_COLOR),
                    SizedBox(width: 8),
                    Text('Sign Out', style: TextStyle(
                        fontSize: 15, color: ASSENT_COLOR
                    )),
                  ],
                ),
              ),
            ),
          ],
        )
    );
  }

  Widget _createAccountInformation(){
    final double profilePictureSize = MediaQuery.of(context).size.width/4;
    return Container(
      margin: EdgeInsets.only(bottom: 14),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: profilePictureSize,
            height: profilePictureSize,
            child: GestureDetector(
              onTap: () {
                Fluttertoast.showToast(msg: 'Click picture', toastLength: Toast.LENGTH_SHORT);
              },
              child: CircleAvatar(
                backgroundColor: Colors.grey[200],
                radius: profilePictureSize,
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: profilePictureSize-4,
                  child: Hero(
                    tag: 'profilePicture',
                    child: ClipOval(
                        child: buildCacheNetworkImage(width: profilePictureSize-4, height: profilePictureSize-4, url: GLOBAL_URL+'/assets/images/user/avatar.png')
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            width: 16,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Robert Steven', style: TextStyle(
                    fontSize: 18, fontWeight: FontWeight.bold
                )),
                SizedBox(
                  height: 8,
                ),
                GestureDetector(
                  onTap: (){
                    Fluttertoast.showToast(msg: 'Click account information / user profile', toastLength: Toast.LENGTH_SHORT);
                  },
                  child: Row(
                    children: [
                      Text('Account Information', style: TextStyle(
                          fontSize: 14, color: _color1
                      )),
                      SizedBox(
                        width: 8,
                      ),
                      Icon(Icons.chevron_right, size: 20, color: SOFT_GREY)
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _createListMenu(String menuTitle){
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: (){
        Fluttertoast.showToast(msg: 'Click '+menuTitle, toastLength: Toast.LENGTH_SHORT);
      },
      child: Container(
        margin: EdgeInsets.fromLTRB(0, 18, 0, 18),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(menuTitle, style: TextStyle(
                fontSize: 15, color: _color2
            )),
            Icon(Icons.chevron_right, size: 20, color: SOFT_GREY),
          ],
        ),
      ),
    );
  }
}
