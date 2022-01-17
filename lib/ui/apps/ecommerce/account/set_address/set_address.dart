import 'package:doctor_app/config/apps/ecommerce/constant.dart';
import 'package:doctor_app/config/apps/ecommerce/global_style.dart';
import 'package:doctor_app/model/apps/ecommerce/address_model.dart';
import 'package:doctor_app/ui/apps/ecommerce/account/set_address/add_address.dart';
import 'package:doctor_app/ui/apps/ecommerce/account/set_address/edit_address.dart';
import 'package:doctor_app/ui/apps/ecommerce/reusable_widget.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SetAddressPage extends StatefulWidget {
  @override
  _SetAddressPageState createState() => _SetAddressPageState();
}

class _SetAddressPageState extends State<SetAddressPage> {
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
            'Set Address',
            style: GlobalStyle.appBarTitle,
          ),
          actions: [
            Padding(
                padding: EdgeInsets.only(right: 20.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => AddAddressPage()));
                  },
                  child: Icon(
                    Icons.add,
                    size: 26.0,
                  ),
                )
            ),
          ],
          backgroundColor: GlobalStyle.appBarBackgroundColor,
          systemOverlayStyle: GlobalStyle.appBarSystemOverlayStyle,
          bottom: _reusableWidget.bottomAppBar(),
        ),
        body: ListView.builder(
          itemCount: addressData.length,
          // Add one more item for progress indicator
          padding: EdgeInsets.symmetric(vertical: 0),
          itemBuilder: (BuildContext context, int index) {
            return _buildAddressCard(index);
          },
        )
    );
  }

  Widget _buildAddressCard(int index){
    return Container(
      margin: EdgeInsets.fromLTRB(12, 6, 12, 0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 2,
        color: Colors.white,
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // if default address == true, add default label
              addressData[index].defaultAddress==true?Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(addressData[index].title, style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16
                  )),
                  _reusableWidget.createDefaultLabel(context)
                ],
              ):Text(addressData[index].title, style: GlobalStyle.addressTitle),
              Container(
                margin: EdgeInsets.only(top: 20),
                child: Text(addressData[index].recipientName, style: GlobalStyle.addressContent),
              ),
              Container(
                margin: EdgeInsets.only(top: 4),
                child: Text(addressData[index].phoneNumber, style: GlobalStyle.addressContent),
              ),
              Container(
                margin: EdgeInsets.only(top: 4),
                child: Text(addressData[index].addressLine1, style: GlobalStyle.addressContent),
              ),
              Container(
                margin: EdgeInsets.only(top: 4),
                child: Text(addressData[index].addressLine2+' '+addressData[index].postalCode, style: GlobalStyle.addressContent),
              ),
              Container(
                margin: EdgeInsets.only(top: 4),
                child: Text(addressData[index].state, style: GlobalStyle.addressContent),
              ),
              Container(
                  margin: EdgeInsets.only(top: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      addressData[index].defaultAddress==false?GestureDetector(
                        onTap: (){
                          _showPopupMakeDefault();
                        },
                        child: Text('Make Default', style: GlobalStyle.addressAction),
                      ):Wrap(),
                      index!=0?SizedBox(
                        width: 12,
                      ):Wrap(),
                      GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => EditAddressPage()));
                        },
                        child: Text('Edit', style: GlobalStyle.addressAction),
                      ),
                      SizedBox(
                        width: 12,
                      ),
                      GestureDetector(
                        onTap: (){
                          _showPopupDeleteAddress(index);
                        },
                        child: Text('Delete', style: GlobalStyle.addressAction),
                      ),
                    ],
                  )
              )
            ],
          ),
        ),
      ),
    );
  }

  void _showPopupDeleteAddress(int index) {
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
          if(index==0){
            Fluttertoast.showToast(msg: 'Please change default address if you want to delete this address', toastLength: Toast.LENGTH_LONG);
          } else {
            setState(() {
              addressData.removeAt(index);
            });
          }
        },
        child: Text('Yes', style: TextStyle(color: SOFT_BLUE))
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      title: Text('Delete Address', style: TextStyle(fontSize: 18),),
      content: Text('Are you sure to delete this address ?', style: TextStyle(fontSize: 13, color: BLACK_GREY)),
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

  void _showPopupMakeDefault() {
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
            _reusableWidget.startLoading(context, 'Success', 0);
        },
        child: Text('Yes', style: TextStyle(color: SOFT_BLUE))
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      title: Text('Make Default', style: TextStyle(fontSize: 18),),
      content: Text('Are you sure to make this address as a default address ?', style: TextStyle(fontSize: 13, color: BLACK_GREY)),
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
