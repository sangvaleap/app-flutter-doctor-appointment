import 'package:doctor_app/config/constant.dart';
import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';

class TextFieldWidgetPage extends StatefulWidget {
  @override
  _TextFieldWidgetPageState createState() => _TextFieldWidgetPageState();
}

class _TextFieldWidgetPageState extends State<TextFieldWidgetPage> {
  // initialize global widget
  final _globalWidget = GlobalWidget();

  bool _obscureText = true;
  IconData _iconVisible = Icons.visibility_off;

  void _toggleObscureText() {
    setState(() {
      _obscureText = !_obscureText;
      if (_obscureText == true) {
        _iconVisible = Icons.visibility_off;
      } else {
        _iconVisible = Icons.visibility;
      }
    });
  }

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
                  title: 'TextField Widget',
                  desc: 'This is the example of TextField'
              ),
              Container(
                child: TextField(
                  style: TextStyle(color: BLACK21),
                  decoration: InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.pinkAccent, width: 2.0)),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFFCCCCCC)),
                    ),
                    labelText: 'Name',
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 30),
                child: Container(
                  color: Colors.grey[200],
                  child: TextField(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.fromLTRB(16, 16, 16, 16),
                      labelText: 'Name'
                    )
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 30),
                child: Container(
                  child: TextField(
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.pinkAccent,
                          labelText: 'Name',
                          labelStyle: TextStyle(color: Colors.white)
                      )
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 30),
                child: Container(
                  child: TextField(
                      decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(30),
                            ),
                            borderSide: BorderSide(color: Colors.pinkAccent),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(30),
                            ),
                            borderSide: BorderSide(color: Colors.pinkAccent),
                          ),
                          filled: true,
                          fillColor: Colors.pinkAccent,
                          hintText: 'Name',
                          hintStyle: TextStyle(color: Colors.white)
                      )
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 30),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Name'
                  )
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 30),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Name',
                    floatingLabelBehavior: FloatingLabelBehavior.never
                  )
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 30),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Name',
                  )
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 30),
                child: TextField(
                  obscureText: _obscureText,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                    suffixIcon: IconButton(
                      icon: Icon(_iconVisible, color: Colors.grey[400], size: 20),
                      onPressed: () {
                        _toggleObscureText();
                      }),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 30),
                child: TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Number and left icon',
                      prefixIcon: Icon(Icons.phone)
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 30),
                child: TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Number and right icon',
                      suffixIcon: Icon(Icons.phone),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 30),
                child: TextField(
                  maxLength: 8,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Max Length'
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 30),
                child: TextField(
                  minLines: 3,
                  maxLines: null,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Message'
                  ),
                ),
              )
            ],
          ),
        )
    );
  }
}
