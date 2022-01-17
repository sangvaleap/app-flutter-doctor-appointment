import 'package:doctor_app/config/apps/ecommerce/constant.dart';
import 'package:doctor_app/config/apps/ecommerce/global_style.dart';
import 'package:doctor_app/ui/apps/ecommerce/account/payment_method/add_payment_method.dart';
import 'package:doctor_app/ui/apps/ecommerce/account/payment_method/edit_payment_method.dart';
import 'package:doctor_app/ui/apps/ecommerce/reusable_widget.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class PaymentMethodPage extends StatefulWidget {
  @override
  _PaymentMethodPageState createState() => _PaymentMethodPageState();
}

class _PaymentMethodPageState extends State<PaymentMethodPage> {
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
            'Payment Method',
            style: GlobalStyle.appBarTitle,
          ),
          backgroundColor: GlobalStyle.appBarBackgroundColor,
          systemOverlayStyle: GlobalStyle.appBarSystemOverlayStyle,
          bottom: _reusableWidget.bottomAppBar(),
        ),
        body: ListView(
          padding: EdgeInsets.all(16),
          children: [
            Text('Default Payment Preferences', style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.w500, color: CHARCOAL
            )),
            Container(
              margin: EdgeInsets.only(top: 8),
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Color(0xffcccccc),
                  width: 1.0,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Text('Payment Method', style: TextStyle(
                        fontSize:14, color: Colors.grey[400]
                    )),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 8),
                    child: Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: 8),
                          padding: EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Color(0xffcccccc),
                              width: 1.0,
                            ),
                          ),
                          child: Image.asset('assets/images/visa.png', height: 10),
                        ),
                        Text('Visa card ending in 4392', style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold, color: CHARCOAL
                        ))
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 24),
                    child: Text('Billing Address', style: TextStyle(
                        fontSize:14, color: Colors.grey[400]
                    )),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 8),
                    child: Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque tortor tortor, ultrices id scelerisque a, elementum id elit.', style: TextStyle(
                        fontSize: 14, color: CHARCOAL
                    )),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 24),
                    child: Text('Phone Number', style: TextStyle(
                        fontSize:14, color: Colors.grey[400]
                    )),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 8),
                    child: Text('0811888999', style: TextStyle(
                        fontSize: 14, color: CHARCOAL
                    )),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 32,
            ),
            Container(
              margin: EdgeInsets.only(bottom: 8),
              child: Text('List of Payment Method', style: TextStyle(
                  fontSize: 16, fontWeight: FontWeight.w500, color: CHARCOAL
              )),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Container(
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(
                      color: Color(0xffcccccc),
                      width: 1.0,
                    ),
                  ),
                ),
                child: DataTable(
                  columns: <DataColumn>[
                    DataColumn(label: Text('Credit Card', style: TextStyle(fontWeight: FontWeight.bold, color: CHARCOAL))),
                    DataColumn(label: Text('Name on Card', style: TextStyle(fontWeight: FontWeight.bold, color: CHARCOAL))),
                    DataColumn(label: Text('Expires on', style: TextStyle(fontWeight: FontWeight.bold, color: CHARCOAL))),
                    DataColumn(label: Text('Action', style: TextStyle(fontWeight: FontWeight.bold, color: CHARCOAL))),
                  ],
                  rows: <DataRow>[
                    DataRow(
                      cells: <DataCell>[
                        DataCell(
                            Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(right: 8),
                                  padding: EdgeInsets.all(4),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Color(0xffcccccc),
                                      width: 1.0,
                                    ),
                                  ),
                                  child: Image.asset('assets/images/visa.png', height: 10),
                                ),
                                Text('Visa card ending in 4392')
                              ],
                            )
                        ),
                        DataCell(Text("Robert Steven")),
                        DataCell(Text("04/2023")),
                        DataCell(
                            Row(
                              children: [
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
                                          color: Colors.white, fontSize: 11
                                      )),
                                      SizedBox(
                                        width: 4,
                                      ),
                                      Icon(Icons.done, color: Colors.white, size: 11)
                                    ],
                                  ),
                                ),
                                GestureDetector(
                                  onTap: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => EditPaymentMethodPage()));
                                  },
                                  child: Text('Edit', style: TextStyle(
                                      color: SOFT_BLUE
                                  )),
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 8),
                                  child: GestureDetector(
                                    onTap: (){
                                      _showPopupDeletePayment(0);
                                    },
                                    child: Text('Delete', style: TextStyle(
                                        color: SOFT_BLUE
                                    )),
                                  ),
                                )
                              ],
                            )
                        ),
                      ],
                    ),
                    DataRow(
                      cells: <DataCell>[
                        DataCell(
                            Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(right: 8),
                                  padding: EdgeInsets.all(4),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Color(0xffcccccc),
                                      width: 1.0,
                                    ),
                                  ),
                                  child: Image.asset('assets/images/mastercard.png', height: 20),
                                ),
                                Text('MasterCard ending in 5309')
                              ],
                            )
                        ),
                        DataCell(Text("Robert Steven")),
                        DataCell(Text("07/2022")),
                        DataCell(
                            Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(right: 8),
                                  child: GestureDetector(
                                    onTap: (){
                                      showPopupMakeDefault();
                                    },
                                    child: Text('Make Default', style: TextStyle(
                                        color: SOFT_BLUE
                                    )),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => EditPaymentMethodPage()));
                                  },
                                  child: Text('Edit', style: TextStyle(
                                      color: SOFT_BLUE
                                  )),
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 8),
                                  child: GestureDetector(
                                    onTap: (){
                                      _showPopupDeletePayment(1);
                                    },
                                    child: Text('Delete', style: TextStyle(
                                        color: SOFT_BLUE
                                    )),
                                  ),
                                )
                              ],
                            )
                        ),
                      ],
                    ),
                    DataRow(
                      cells: <DataCell>[
                        DataCell(
                            Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(right: 8),
                                  padding: EdgeInsets.all(4),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Color(0xffcccccc),
                                      width: 1.0,
                                    ),
                                  ),
                                  child: Image.asset('assets/images/visa.png', height: 10),
                                ),
                                Text('Visa card ending in 2285')
                              ],
                            )
                        ),
                        DataCell(Text("Robert Steven")),
                        DataCell(Text("11/2021")),
                        DataCell(
                            Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(right: 8),
                                  child: GestureDetector(
                                    onTap: (){
                                      showPopupMakeDefault();
                                    },
                                    child: Text('Make Default', style: TextStyle(
                                        color: SOFT_BLUE
                                    )),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => EditPaymentMethodPage()));
                                  },
                                  child: Text('Edit', style: TextStyle(
                                      color: SOFT_BLUE
                                  )),
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 8),
                                  child: GestureDetector(
                                    onTap: (){
                                      _showPopupDeletePayment(2);
                                    },
                                    child: Text('Delete', style: TextStyle(
                                        color: SOFT_BLUE
                                    )),
                                  ),
                                )
                              ],
                            )
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 32),
              child: OutlinedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => AddPaymentMethodPage()));
                  },
                  style: ButtonStyle(
                      overlayColor: MaterialStateProperty.all(Colors.transparent),
                      shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          )
                      ),
                      side: MaterialStateProperty.all(
                        BorderSide(
                            color: SOFT_BLUE,
                            width: 1.0
                        ),
                      )
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12.0),
                    child: Text(
                      'Add a card',
                      style: TextStyle(
                          color: SOFT_BLUE,
                          fontWeight: FontWeight.bold,
                          fontSize: 13
                      ),
                      textAlign: TextAlign.center,
                    ),
                  )
              ),
            )
          ],
        )
    );
  }

  void showPopupMakeDefault() {
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
      content: Text('Are you sure to make this card as a default payment ?', style: TextStyle(fontSize: 13, color: BLACK_GREY)),
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

  void _showPopupDeletePayment(int index) {
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
            Fluttertoast.showToast(msg: 'Please change default payment method if you want to delete this payment method', toastLength: Toast.LENGTH_LONG);
          } else {
            _reusableWidget.startLoading(context, 'Delete Payment Method Success', 0);
          }
        },
        child: Text('Yes', style: TextStyle(color: SOFT_BLUE))
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      title: Text('Delete Payment Method', style: TextStyle(fontSize: 18),),
      content: Text('Are you sure to delete this payment method ?', style: TextStyle(fontSize: 13, color: BLACK_GREY)),
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
