import 'package:doctor_app/config/apps/ecommerce/constant.dart';
import 'package:doctor_app/config/apps/ecommerce/global_style.dart';
import 'package:doctor_app/model/apps/ecommerce/address_model.dart';
import 'package:doctor_app/ui/apps/ecommerce/reusable_widget.dart';
import 'package:flutter/material.dart';

class ChangeAddressPage extends StatefulWidget {
  @override
  _ChangeAddressPageState createState() => _ChangeAddressPageState();
}

class _ChangeAddressPageState extends State<ChangeAddressPage> {
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
            'Change Address',
            style: GlobalStyle.appBarTitle,
          ),
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
              addressData[index].defaultAddress==true?Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(addressData[index].title, style: GlobalStyle.addressTitle),
                  Container(
                    margin: EdgeInsets.only(right: 8),
                    padding: EdgeInsets.fromLTRB(8, 2, 8, 2),
                    decoration: BoxDecoration(
                        color: SOFT_BLUE,
                        borderRadius: BorderRadius.circular(2)
                    ),
                    child: Row(
                      children: [
                        Text('Default', style: TextStyle(
                            color: Colors.white, fontSize: 13
                        )),
                        SizedBox(
                          width: 4,
                        ),
                        Icon(Icons.done, color: Colors.white, size: 11)
                      ],
                    ),
                  )
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
                          Navigator.pop(context);
                        },
                        child: Text('Use this', style: GlobalStyle.addressAction),
                      ):Wrap(),
                      index!=0?SizedBox(
                        width: 12,
                      ):Wrap(),
                    ],
                  )
              )
            ],
          ),
        ),
      ),
    );
  }
}
