import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class BottomSheet3Page extends StatefulWidget {
  @override
  _BottomSheet3PageState createState() => _BottomSheet3PageState();
}

class _BottomSheet3PageState extends State<BottomSheet3Page> {
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
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(24, 24, 24, 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: _globalWidget.createDetailWidget(
                  title: 'Bottom Sheet for Choose',
                  desc: 'This is the example of bottom sheet for choose'
              ),
            ),
            Container(
                margin: EdgeInsets.symmetric(vertical: 8),
                child: _globalWidget.createButton(
                    buttonName: 'Open BottomSheet',
                    onPressed: (){
                      showModalBottomSheet<void>(
                        context: context,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(24), topRight: Radius.circular(24)),
                        ),
                        builder: (BuildContext context) {
                          return _showPopup();
                        },
                      );
                    }
                ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _showPopup(){
    // must use StateSetter to update data between main screen and popup.
    // if use default setState, the data will not update
    return StatefulBuilder(builder: (BuildContext context, StateSetter mystate) {
      return Container(
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                margin: EdgeInsets.only(top: 12, bottom: 12),
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                    color: Colors.grey[500],
                    borderRadius: BorderRadius.circular(10)
                ),
              ),
            ),
            Container(
              child: Text('Payment Method', style: TextStyle(
                  fontSize: 16, fontWeight: FontWeight.bold
              )),
            ),
            Flexible(
              child: ListView(
                padding: EdgeInsets.symmetric(vertical: 16),
                children: [
                  GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: (){
                      Navigator.pop(context);
                      Fluttertoast.showToast(msg: 'Click visa card ending in 4392', toastLength: Toast.LENGTH_SHORT);
                    },
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
                        Text('Visa card ending in 4392')
                      ],
                    ),
                  ),
                  Divider(
                    height: 32,
                    color: Colors.grey[400],
                  ),
                  GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: (){
                      Navigator.pop(context);
                      Fluttertoast.showToast(msg: 'Click MasterCard ending in 5309', toastLength: Toast.LENGTH_SHORT);
                    },
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
                          child: Image.asset('assets/images/mastercard.png', height: 20),
                        ),
                        Text('MasterCard ending in 5309')
                      ],
                    ),
                  ),
                  Divider(
                    height: 32,
                    color: Colors.grey[400],
                  ),
                  GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: (){
                      Navigator.pop(context);
                      Fluttertoast.showToast(msg: 'Click visa card ending in 2285', toastLength: Toast.LENGTH_SHORT);
                    },
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
                        Text('Visa card ending in 2285')
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      );
    });
  }
}
