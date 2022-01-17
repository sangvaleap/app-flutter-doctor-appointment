import 'package:doctor_app/config/apps/ecommerce/constant.dart';
import 'package:doctor_app/config/apps/ecommerce/global_style.dart';
import 'package:doctor_app/ui/apps/ecommerce/account/account_information/edit_email.dart';
import 'package:doctor_app/ui/apps/ecommerce/account/account_information/edit_name.dart';
import 'package:doctor_app/ui/apps/ecommerce/account/account_information/edit_phone_number.dart';
import 'package:doctor_app/ui/apps/ecommerce/reusable_widget.dart';
import 'package:doctor_app/ui/reusable/cache_image_network.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AccountInformationPage extends StatefulWidget {
  @override
  _AccountInformationPageState createState() => _AccountInformationPageState();
}

class _AccountInformationPageState extends State<AccountInformationPage> {
  // initialize reusable widget
  final _reusableWidget = ReusableWidget();

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
            color: GlobalStyle.appBarIconThemeColor,
          ),
          elevation: GlobalStyle.appBarElevation,
          title: Text(
            'Account Information',
            style: GlobalStyle.appBarTitle,
          ),
          backgroundColor: GlobalStyle.appBarBackgroundColor,
          systemOverlayStyle: GlobalStyle.appBarSystemOverlayStyle,
          bottom: _reusableWidget.bottomAppBar(),
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
                  style: GlobalStyle.accountInformationLabel,
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
                        style: GlobalStyle.accountInformationValue,
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => EditNamePage()));
                      },
                      child: Text('Edit', style: GlobalStyle.accountInformationEdit),
                    )
                  ],
                ),
                SizedBox(
                  height: 24,
                ),
                Row(
                  children: [
                    Text(
                      'Email',
                      style: GlobalStyle.accountInformationLabel,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    _verifiedLabel()
                  ],
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
                        style: GlobalStyle.accountInformationValue,
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => EditEmailPage()));
                      },
                      child: Text('Edit', style: GlobalStyle.accountInformationEdit),
                    )
                  ],
                ),
                SizedBox(
                  height: 24,
                ),
                Row(
                  children: [
                    Text(
                      'Phone Number',
                      style: GlobalStyle.accountInformationLabel,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    _verifiedLabel()
                  ],
                ),
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        '0811888999',
                        style: GlobalStyle.accountInformationValue,
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => EditPhoneNumberPage()));
                      },
                      child: Text('Edit', style: GlobalStyle.accountInformationEdit),
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
                  child: Icon(Icons.edit, size: 12, color: CHARCOAL),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _verifiedLabel(){
    return Container(
      padding: EdgeInsets.fromLTRB(8, 2, 8, 2),
      decoration: BoxDecoration(
          color: SOFT_BLUE,
          borderRadius: BorderRadius.circular(2)
      ),
      child: Row(
        children: [
          Text('verified', style: TextStyle(
              color: Colors.white, fontSize: 11
          )),
          SizedBox(
            width: 4,
          ),
          Icon(Icons.done, color: Colors.white, size: 11)
        ],
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
      content: Text('Do you want to edit profile picture ?', style: TextStyle(fontSize: 13, color: BLACK_GREY)),
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
