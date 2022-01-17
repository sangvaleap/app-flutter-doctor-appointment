import 'package:doctor_app/config/apps/ecommerce/constant.dart';
import 'package:doctor_app/config/apps/ecommerce/global_style.dart';
import 'package:doctor_app/ui/apps/ecommerce/reusable_widget.dart';
import 'package:flutter/material.dart';

class AddPaymentMethodPage extends StatefulWidget {
  @override
  _AddPaymentMethodPageState createState() => _AddPaymentMethodPageState();
}

class _AddPaymentMethodPageState extends State<AddPaymentMethodPage> {
  // initialize reusable widget
  final _reusableWidget = ReusableWidget();

  List<String> _monthList = [];
  List<String> _yearList = [];
  String? _expiredMonth;
  String? _expiredYear;

  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((_) async {
      _initForLang();
    });

    super.initState();
  }

  void _initForLang(){
    setState(() {
      _expiredMonth = 'Month';
      _expiredYear = 'Year';
      // select box data for month of credit card
      _monthList.add('Month');
      _monthList.add("01");
      _monthList.add('02');
      _monthList.add('03');
      _monthList.add('04');
      _monthList.add('05');
      _monthList.add('06');
      _monthList.add('07');
      _monthList.add('08');
      _monthList.add('09');
      _monthList.add('10');
      _monthList.add('11');
      _monthList.add('12');

      // select box data for year of credit card
      _yearList.add('Year');
      _yearList.add("2020");
      _yearList.add('2021');
      _yearList.add('2022');
      _yearList.add('2023');
      _yearList.add('2024');
      _yearList.add('2025');
    });
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
            'Add Payment Method',
            style: GlobalStyle.appBarTitle,
          ),
          backgroundColor: GlobalStyle.appBarBackgroundColor,
          systemOverlayStyle: GlobalStyle.appBarSystemOverlayStyle,
          bottom: _reusableWidget.bottomAppBar(),
        ),
        body: ListView(
          padding: EdgeInsets.all(16),
          children: [
            Text('Credit Card Information', style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 18
            )),
            Container(
              margin: EdgeInsets.only(top: 20),
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
                ],
              ),
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  focusedBorder: UnderlineInputBorder(
                      borderSide:
                      BorderSide(color: PRIMARY_COLOR, width: 2.0)),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFFCCCCCC)),
                  ),
                  labelText: 'Credit Card Number *',
                  labelStyle:
                  TextStyle(color: BLACK_GREY)),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              decoration: InputDecoration(
                  focusedBorder: UnderlineInputBorder(
                      borderSide:
                      BorderSide(color: PRIMARY_COLOR, width: 2.0)),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFFCCCCCC)),
                  ),
                  labelText: 'Name of Cardholder *',
                  labelStyle:
                  TextStyle(color: BLACK_GREY)),
            ),
            SizedBox(
              height: 20,
            ),
            Text('Expired Date *', style: TextStyle(
                color: BLACK_GREY, fontSize: 12
            )),
            Row(
              children: [
                _buildExpiredMonth(),
                SizedBox(
                  width: 16,
                ),
                _buildExpiredYear(),
              ],
            ),
            SizedBox(
              height: 32,
            ),
            Text('Billing Information', style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 18
            )),
            TextField(
              decoration: InputDecoration(
                  focusedBorder: UnderlineInputBorder(
                      borderSide:
                      BorderSide(color: PRIMARY_COLOR, width: 2.0)),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFFCCCCCC)),
                  ),
                  labelText: 'Full Name *',
                  labelStyle:
                  TextStyle(color: BLACK_GREY)),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              decoration: InputDecoration(
                  focusedBorder: UnderlineInputBorder(
                      borderSide:
                      BorderSide(color: PRIMARY_COLOR, width: 2.0)),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFFCCCCCC)),
                  ),
                  labelText: 'Company Name',
                  labelStyle:
                  TextStyle(color: BLACK_GREY)),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              decoration: InputDecoration(
                  focusedBorder: UnderlineInputBorder(
                      borderSide:
                      BorderSide(color: PRIMARY_COLOR, width: 2.0)),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFFCCCCCC)),
                  ),
                  labelText: 'Address Line 1 *',
                  labelStyle:
                  TextStyle(color: BLACK_GREY)),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              decoration: InputDecoration(
                  focusedBorder: UnderlineInputBorder(
                      borderSide:
                      BorderSide(color: PRIMARY_COLOR, width: 2.0)),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFFCCCCCC)),
                  ),
                  labelText: 'Address Line 2',
                  labelStyle:
                  TextStyle(color: BLACK_GREY)),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              decoration: InputDecoration(
                  focusedBorder: UnderlineInputBorder(
                      borderSide:
                      BorderSide(color: PRIMARY_COLOR, width: 2.0)),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFFCCCCCC)),
                  ),
                  labelText: 'City *',
                  labelStyle:
                  TextStyle(color: BLACK_GREY)),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              decoration: InputDecoration(
                  focusedBorder: UnderlineInputBorder(
                      borderSide:
                      BorderSide(color: PRIMARY_COLOR, width: 2.0)),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFFCCCCCC)),
                  ),
                  labelText: 'State / Province / Region *',
                  labelStyle:
                  TextStyle(color: BLACK_GREY)),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  focusedBorder: UnderlineInputBorder(
                      borderSide:
                      BorderSide(color: PRIMARY_COLOR, width: 2.0)),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFFCCCCCC)),
                  ),
                  labelText: 'Postal Code *',
                  labelStyle:
                  TextStyle(color: BLACK_GREY)),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  focusedBorder: UnderlineInputBorder(
                      borderSide:
                      BorderSide(color: PRIMARY_COLOR, width: 2.0)),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFFCCCCCC)),
                  ),
                  labelText: 'Recipient\'s Phone Number *',
                  labelStyle:
                  TextStyle(color: BLACK_GREY)),
            ),
            SizedBox(
              height: 40,
            ),
            Container(
              child: TextButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) => PRIMARY_COLOR,
                    ),
                    overlayColor: MaterialStateProperty.all(Colors.transparent),
                    shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(3.0),
                        )
                    ),
                  ),
                  onPressed: () {
                    _reusableWidget.startLoading(context, 'Add Payment Method Success', 1);
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5.0),
                    child: Text(
                      'Save',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  )
              ),
            ),
          ],
        )
    );
  }

  //  dropdown menu
  DropdownButton<String> _buildExpiredMonth() {
    return DropdownButton<String>(
      value: _expiredMonth,
      icon: Icon(Icons.arrow_drop_down),
      iconSize: 24,
      elevation: 16,
      style: TextStyle(color: Colors.grey[700], fontSize: 16),
      underline: Container(
        height: 1,
        color: Colors.grey[600],
      ),
      onChanged: (String? data) {
        setState(() {
          _expiredMonth = data!;
        });
      },
      items: _monthList.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Container(child: Text(value), alignment: Alignment.center,),
        );
      }).toList(),
    );
  }

  DropdownButton<String> _buildExpiredYear() {
    return DropdownButton<String>(
      value: _expiredYear,
      icon: Icon(Icons.arrow_drop_down),
      iconSize: 24,
      elevation: 16,
      style: TextStyle(color: Colors.grey[700], fontSize: 16),
      underline: Container(
        height: 1,
        color: Colors.grey[600],
      ),
      onChanged: (String? data) {
        setState(() {
          _expiredYear = data!;
        });
      },
      items: _yearList.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Container(child: Text(value), alignment: Alignment.center,),
        );
      }).toList(),
    );
  }
}
