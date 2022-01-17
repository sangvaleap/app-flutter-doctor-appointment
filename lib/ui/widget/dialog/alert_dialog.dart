import 'package:doctor_app/config/constant.dart';
import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AlertDialogPage extends StatefulWidget {
  @override
  _AlertDialogPageState createState() => _AlertDialogPageState();
}

class _AlertDialogPageState extends State<AlertDialogPage> {
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
              _globalWidget.createDetailWidget(
                  title: 'Alert Dialog',
                  desc: 'This is the example of alert dialog'
              ),
              Container(
                  margin: EdgeInsets.only(top: 10),
                  child: Text('Alert Dialog 1')
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 8),
                // this is the start of example
                child: _globalWidget.createButton(
                    buttonName: 'Open AlertDialog 1',
                    onPressed: (){
                      _showPopup1();
                    }
                ),
              ),
              Container(
                  margin: EdgeInsets.only(top: 10),
                  child: Text('Alert Dialog 2')
              ),
              Container(
                  margin: EdgeInsets.symmetric(vertical: 8),
                  // this is the start of example
                  child: _globalWidget.createButton(
                      buttonName: 'Open AlertDialog 2',
                      onPressed: (){
                        _showPopup2();
                      }
                  ),
              ),
              Container(
                  margin: EdgeInsets.only(top: 10),
                  child: Text('Alert Dialog 3')
              ),
              Container(
                  margin: EdgeInsets.symmetric(vertical: 8),
                  // this is the start of example
                  child: _globalWidget.createButton(
                      buttonName: 'Open AlertDialog 3',
                      onPressed: (){
                        _showPopup3();
                      }
                  ),
              ),
            ],
          ),
        )
    );
  }

  void _showPopup1() {
    // set up the buttons
    Widget cancelButton = TextButton(
        onPressed: () {
          Navigator.pop(context);
          Fluttertoast.showToast(msg: 'Press No', toastLength: Toast.LENGTH_SHORT);
        },
        child: Text('No', style: TextStyle(color: SOFT_BLUE))
    );
    Widget continueButton = TextButton(
        onPressed: () {
          Navigator.pop(context);
          Fluttertoast.showToast(msg: 'Press Yes', toastLength: Toast.LENGTH_SHORT);
        },
        child: Text('Yes', style: TextStyle(color: SOFT_BLUE))
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      title: Text('Title', style: TextStyle(fontSize: 18),),
      content: Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque tortor tortor, ultrices id scelerisque a, elementum id elit.', style: TextStyle(fontSize: 13, color: BLACK21)),
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

  void _showPopup2() {
    // set up the buttons
    Widget signinFacebook = TextButton(
        onPressed: () {
          Navigator.pop(context);
          Fluttertoast.showToast(msg: 'Signin with Facebook', toastLength: Toast.LENGTH_SHORT);
        },
        child: Text('Signin with Facebook', style: TextStyle(color: SOFT_BLUE))
    );
    Widget signinTwitter = TextButton(
        onPressed: () {
          Navigator.pop(context);
          Fluttertoast.showToast(msg: 'Signin with Twitter', toastLength: Toast.LENGTH_SHORT);
        },
        child: Text('Signin with Twitter', style: TextStyle(color: SOFT_BLUE))
    );
    Widget signinGoogle = TextButton(
        onPressed: () {
          Navigator.pop(context);
          Fluttertoast.showToast(msg: 'Signin with Google', toastLength: Toast.LENGTH_SHORT);
        },
        child: Text('Signin with Google', style: TextStyle(color: SOFT_BLUE))
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      title: Text('Title', style: TextStyle(fontSize: 18),),
      content: Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque tortor tortor, ultrices id scelerisque a, elementum id elit.', style: TextStyle(fontSize: 13, color: BLACK21)),
      actions: [
        signinFacebook,
        signinTwitter,
        signinGoogle,
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

  void _showPopup3() {
    // set up the buttons
    Widget cancelButton = TextButton(
        onPressed: () {
          Navigator.pop(context);
          Fluttertoast.showToast(msg: 'Press Cancel', toastLength: Toast.LENGTH_SHORT);
        },
        child: Text('Cancel', style: TextStyle(color: SOFT_BLUE))
    );
    Widget continueButton = TextButton(
        onPressed: () {
          Navigator.pop(context);
          Fluttertoast.showToast(msg: 'Press Submit', toastLength: Toast.LENGTH_SHORT);
        },
        child: Text('Submit', style: TextStyle(color: SOFT_BLUE))
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      title: Text('Title', style: TextStyle(fontSize: 18),),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque tortor tortor, ultrices id scelerisque a, elementum id elit.', style: TextStyle(fontSize: 13, color: BLACK21)),
          TextField(
            autofocus: true,
            style: TextStyle(color: BLACK21),
            decoration: InputDecoration(
              focusedBorder: UnderlineInputBorder(
                  borderSide:
                  BorderSide(color: PRIMARY_COLOR, width: 2.0)),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Color(0xFFCCCCCC)),
              ),
            ),
          ),
        ],
      ),
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
