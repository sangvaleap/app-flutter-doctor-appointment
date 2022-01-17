import 'package:doctor_app/config/constant.dart';
import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';

class CheckboxWidgetPage extends StatefulWidget {
  @override
  _CheckboxWidgetPageState createState() => _CheckboxWidgetPageState();
}

class _CheckboxWidgetPageState extends State<CheckboxWidgetPage> {
  // initialize global widget
  final _globalWidget = GlobalWidget();

  bool _val1 = false;
  bool _val2 = true;
  bool _val3 = true;
  bool? _val4 = false;
  bool? _val5;
  bool _val6 = false;
  bool _val7 = true;
  bool _val8 = true;
  bool _val9 = true;
  bool _val10 = true;

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
                  title: 'Checkbox Widget',
                  desc: 'This is the example of Checkbox'
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                child: Text('Standart Checkbox'),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 8),
                child: Wrap(
                  children: [
                    Checkbox(
                      value: _val1,
                      onChanged: (bool? value) {
                        setState(() {
                          _val1 = value!;
                        });
                      },
                    ),
                    Checkbox(
                      activeColor: Colors.pinkAccent,
                      value: _val2,
                      onChanged: (bool? value) {
                        setState(() {
                          _val2 = value!;
                        });
                      },
                    ),           // [Wednesday] checkbox
                    Checkbox(
                      activeColor: Colors.grey[100],
                      checkColor: Colors.pinkAccent,
                      value: _val3,
                      onChanged: (bool? value) {
                        setState(() {
                          _val3 = value!;
                        });
                      },
                    ),
                    Checkbox(
                      tristate: true,
                      value: _val4,
                      onChanged: (value) {
                        setState(() {
                          _val4 = value;
                        });
                      },
                    ),
                    Checkbox(
                      tristate: true,
                      value: _val5,
                      onChanged: (value) {
                        setState(() {
                          _val5 = value;
                        });
                      },
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                child: Text('Custom Checkbox'),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 8),
                child: Wrap(
                  spacing: 16,
                  children: [
                    GestureDetector(
                      onTap: (){
                        setState(() {
                          _val6 = !_val6;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.blue),
                        child: Padding(
                          padding: const EdgeInsets.all(4),
                          child: _val6
                              ? Icon(
                            Icons.check,
                            size: 20.0,
                            color: Colors.white,
                          )
                              : Icon(
                            Icons.check_box_outline_blank,
                            size: 20.0,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        setState(() {
                          _val7 = !_val7;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 1,
                          ),
                          borderRadius: BorderRadius.all(
                              Radius.circular(10.0)
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(4),
                          child: _val7
                          ?Icon(
                            Icons.check,
                            size: 20.0,
                            color: BLACK21,
                          ):Icon(
                            Icons.check_box_outline_blank,
                            size: 20.0,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                child: Text('CheckboxTile'),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 8),
                decoration: BoxDecoration(border: Border.all(color: Colors.teal)),
                child: CheckboxListTile(
                  title: const Text('Title'),
                  subtitle: const Text('Subtitle'),
                  value: _val8,
                  onChanged: (bool? value) {
                    setState(() {
                      _val8 = value!;
                    });
                  },
                ),
              ),
              Card(
                elevation: 5,
                margin: EdgeInsets.symmetric(vertical: 8),
                child: CheckboxListTile(
                  title: const Text('Title'),
                  subtitle: const Text('Subtitle'),
                  value: _val9,
                  onChanged: (bool? value) {
                    setState(() {
                      _val9 = value!;
                    });
                  },
                ),
              ),
              Card(
                elevation: 5,
                margin: EdgeInsets.symmetric(vertical: 8),
                child: CheckboxListTile(
                  title: const Text('Title'),
                  secondary: const Icon(Icons.person),
                  subtitle: const Text('Subtitle'),
                  value: _val10,
                  onChanged: (bool? value) {
                    setState(() {
                      _val10 = value!;
                    });
                  },
                ),
              ),
            ],
          ),
        )
    );
  }
}
