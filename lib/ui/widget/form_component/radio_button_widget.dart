import 'package:doctor_app/config/constant.dart';
import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';

class RadioButtonWidgetPage extends StatefulWidget {
  @override
  _RadioButtonWidgetPageState createState() => _RadioButtonWidgetPageState();
}

class _RadioButtonWidgetPageState extends State<RadioButtonWidgetPage> {
  // initialize global widget
  final _globalWidget = GlobalWidget();

  String _val1 = 'one';
  String _val2 = 'car';
  String _val3 = 'A';

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
                  title: 'Radio Button Widget',
                  desc: 'This is the example of Radio Button'
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                child: Text('Standart Radio Button'),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 8),
                child: Wrap(
                  children: [
                    Column(
                      children: [
                        Radio(
                          value: 'one',
                          groupValue: _val1,
                          onChanged: (String? value) {
                            setState(() {
                              _val1 = value!;
                            });
                          },
                        ),
                        Text('One')
                      ],
                    ),
                    Column(
                      children: [
                        Radio(
                          value: 'two',
                          groupValue: _val1,
                          onChanged: (String? value) {
                            setState(() {
                              _val1 = value!;
                            });
                          },
                        ),
                        Text('Two')
                      ],
                    ),
                    Column(
                      children: [
                        Radio(
                          value: 'three',
                          groupValue: _val1,
                          onChanged: (String? value) {
                            setState(() {
                              _val1 = value!;
                            });
                          },
                        ),
                        Text('Three')
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 8),
                child: Row(
                  children: [
                    Radio(
                      value: 'four',
                      groupValue: _val1,
                      onChanged: (String? value) {
                        setState(() {
                          _val1 = value!;
                        });
                      },
                    ),
                    Text('Four'),
                    Radio(
                      value: 'five',
                      groupValue: _val1,
                      onChanged: (String? value) {
                        setState(() {
                          _val1 = value!;
                        });
                      },
                    ),
                    Text('Five'),
                    Radio(
                      value: 'six',
                      groupValue: _val1,
                      onChanged: (String? value) {
                        setState(() {
                          _val1 = value!;
                        });
                      },
                    ),
                    Text('Six')
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                child: Text('Radio Tile'),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 8),
                child: Column(
                  children: [
                    // This goes to the build method
                    RadioListTile(
                      value: 'car',
                      groupValue: _val2,
                      title: Text("Radio Title"),
                      subtitle: Text("Radio Subtitle"),
                      onChanged: (String? value) {
                        setState(() {
                          _val2 = value!;
                        });
                      },
                      activeColor: Colors.red,
                      secondary: OutlinedButton(
                          onPressed: () {
                            print("Say Hello");
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
                                    color: Colors.grey[300]!,
                                    width: 1.0
                                ),
                              )
                          ),
                          child: Text(
                            'Say Hi',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 14
                            ),
                            textAlign: TextAlign.center,
                          )
                      ),
                    ),
                    RadioListTile(
                      value: 'bike',
                      groupValue: _val2,
                      title: Text("Radio Title"),
                      subtitle: Text("Radio Subtitle"),
                      onChanged: (String? value) {
                        setState(() {
                          _val2 = value!;
                        });
                      },
                      activeColor: Colors.red,
                      secondary: OutlinedButton(
                          onPressed: () {
                            print("Say Hello");
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
                                    color: Colors.grey[300]!,
                                    width: 1.0
                                ),
                              )
                          ),
                          child: Text(
                            'Say Hi',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 14
                            ),
                            textAlign: TextAlign.center,
                          )
                      ),
                    ),
                    RadioListTile(
                      value: 'boat',
                      groupValue: _val2,
                      title: Text("Radio Title"),
                      subtitle: Text("Radio Subtitle"),
                      onChanged: (String? value) {
                        setState(() {
                          _val2 = value!;
                        });
                      },
                      activeColor: Colors.red,
                      secondary: OutlinedButton(
                          onPressed: () {
                            print("Say Hello");
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
                                    color: Colors.grey[300]!,
                                    width: 1.0
                                ),
                              )
                          ),
                          child: Text(
                            'Say Hi',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 14
                            ),
                            textAlign: TextAlign.center,
                          )
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                child: Text('Custom Radio Button'),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 8),
                child: Column(
                  children: [
                    // This goes to the build method
                    _customRadioButton(value: 'A', option: 'Option A'),
                    SizedBox(height: 16),
                    _customRadioButton(value: 'B', option: 'Option B'),
                    SizedBox(height: 16),
                    _customRadioButton(value: 'C', option: 'Option C'),
                    SizedBox(height: 16),
                    _customRadioButton(value: 'D', option: 'Option D'),
                  ],
                ),
              ),
            ],
          ),
        )
    );
  }

  Widget _customRadioButton({value = 'A', option = 'Option A'}){
    return GestureDetector(
      onTap: (){
        setState(() {
          _val3 = value;
        });
      },
      child: Row(
        children: [
          Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
                border: Border.all(
                    width: 1,
                    color: _val3==value?Colors.pinkAccent:Colors.grey
                ),
                borderRadius: BorderRadius.all(
                    Radius.circular(2)
                ),
                color: _val3==value?Colors.pinkAccent:Colors.white
            ),
            child: Center(
                child: Text(value, style: TextStyle(
                    color: _val3==value?Colors.white:BLACK21
                ))
            ),
          ),
          SizedBox(width: 16),
          Text(option)
        ],
      ),
    );
  }
}
