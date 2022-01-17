import 'package:doctor_app/config/constant.dart';
import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class InputChipPage extends StatefulWidget {
  @override
  _InputChipPageState createState() => _InputChipPageState();
}

class _InputChipPageState extends State<InputChipPage> {
  // initialize global widget
  final _globalWidget = GlobalWidget();

  TextEditingController _etEmail = TextEditingController();
  final _emailList = <String>[];

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _etEmail.dispose();
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
                  title: 'Input Chip',
                  desc: 'This is the example of input chip'
              ),
              Container(
                  margin: EdgeInsets.only(top: 10),
                  child: Text('Interactive Example')
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextField(
                    controller: _etEmail,
                    onSubmitted: (value) {
                      setState(() {
                        _etEmail.text = '';
                        _emailList.add(value);
                      });
                    },
                    decoration: InputDecoration(
                      hintText: 'Input a email',
                      isDense: true,
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),
                  SizedBox(height: 8),
                  Wrap(
                    spacing: 16,
                    children: _emailList.map((value) {
                      return InputChip(
                        backgroundColor: Colors.pinkAccent,
                        avatar: CircleAvatar(
                          backgroundImage: NetworkImage(GLOBAL_URL+'/assets/images/user/avatar.png'),
                        ),
                        label: Text(value, style: TextStyle(
                          color: Colors.white
                        )),
                        onDeleted: () {
                          setState(() {
                            _emailList.remove(value);
                          });
                        },
                        deleteIconColor: Colors.white,
                      );
                    }).toList(),
                  ),
                ],
              ),
              Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Text('Default')
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 8),
                // this is the start of example
                child: InputChip(
                  label: Text('example@domain.com'),
                ),
              ),
              Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Text('With on press')
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 8),
                // this is the start of example
                child: InputChip(
                  label: Text('example@domain.com'),
                  onPressed: () {
                    Fluttertoast.showToast(msg: 'Click input chip', toastLength: Toast.LENGTH_SHORT);
                  },
                ),
              ),
              Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Text('With avatar')
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 8),
                // this is the start of example
                child: InputChip(
                  label: Text('example@domain.com'),
                  onPressed: () {
                    Fluttertoast.showToast(msg: 'Click input chip', toastLength: Toast.LENGTH_SHORT);
                  },
                  avatar: CircleAvatar(
                    backgroundImage: NetworkImage(GLOBAL_URL+'/assets/images/user/avatar.png'),
                  ),
                ),
              ),
              Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Text('With deleted icon')
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 8),
                // this is the start of example
                child: InputChip(
                  label: Text('example@domain.com'),
                  onPressed: () {
                    Fluttertoast.showToast(msg: 'Click input chip', toastLength: Toast.LENGTH_SHORT);
                  },
                  avatar: CircleAvatar(
                    backgroundImage: NetworkImage(GLOBAL_URL+'/assets/images/user/avatar.png'),
                  ),
                  onDeleted: () {
                    Fluttertoast.showToast(msg: 'Click delete icon', toastLength: Toast.LENGTH_SHORT);
                  },
                  deleteIcon: Icon(Icons.remove_circle, size: 18),
                ),
              ),
              Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Text('Add some color')
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 8),
                // this is the start of example
                child: InputChip(
                  backgroundColor: Colors.pinkAccent,
                  label: Text('example@domain.com', style: TextStyle(
                    color: Colors.white
                  )),
                  onPressed: () {
                    Fluttertoast.showToast(msg: 'Click input chip', toastLength: Toast.LENGTH_SHORT);
                  },
                  avatar: CircleAvatar(
                    backgroundImage: NetworkImage(GLOBAL_URL+'/assets/images/user/avatar.png'),
                  ),
                  onDeleted: () {
                    Fluttertoast.showToast(msg: 'Click delete icon', toastLength: Toast.LENGTH_SHORT);
                  },
                  deleteIcon: Icon(Icons.remove_circle, size: 18, color: Colors.white),
                ),
              ),
            ],
          ),
        )
    );
  }
}
