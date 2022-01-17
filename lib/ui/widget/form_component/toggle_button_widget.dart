import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';

class ToggleButtonWidgetPage extends StatefulWidget {
  @override
  _ToggleButtonWidgetPageState createState() => _ToggleButtonWidgetPageState();
}

class _ToggleButtonWidgetPageState extends State<ToggleButtonWidgetPage> {
  // initialize global widget
  final _globalWidget = GlobalWidget();

  List<bool> isSelected1 = [false, false, false];
  List<bool> isSelected2 = [true, false];
  List<bool> isSelected3 = [false, false, false];
  List<bool> isSelected4 = [false, true, false];
  List<bool> isSelected5 = [true, false, false];

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
                  title: 'ToggleButton Widget',
                  desc: 'This is the example of ToggleButton'
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                child: Text('Multi selection'),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 16),
                child: ToggleButtons(
                  children: <Widget>[
                    Icon(Icons.directions_car, color: Colors.purpleAccent),
                    Icon(Icons.motorcycle, color: Colors.pinkAccent),
                    Icon(Icons.local_shipping, color: Colors.cyan),
                  ],
                  onPressed: (int index) {
                    setState(() {
                      isSelected1[index] = !isSelected1[index];
                    });
                  },
                  isSelected: isSelected1,
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                child: Text('Only 1 selection'),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 16),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(32),
                ),
                child: ToggleButtons(
                  color: Colors.grey,
                  selectedColor: Colors.white,
                  fillColor: Colors.cyan,
                  selectedBorderColor: Colors.cyan,
                  borderRadius: BorderRadius.circular(32),
                  children: <Widget>[
                    Text('On'),
                    Text('Off')
                  ],
                  onPressed: (int index) {
                    setState(() {
                      for (int buttonIndex = 0; buttonIndex < isSelected2.length; buttonIndex++) {
                        if (buttonIndex == index) {
                          isSelected2[buttonIndex] = true;
                        } else {
                          isSelected2[buttonIndex] = false;
                        }
                      }
                    });
                  },
                  isSelected: isSelected2,
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                child: Text('Only 1 selection & can disable too'),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 16),
                child: ToggleButtons(
                  color: Colors.redAccent,
                  selectedColor: Colors.white,
                  fillColor: Colors.cyan,
                  children: <Widget>[
                    Icon(Icons.sports_basketball),
                    Icon(Icons.sports_volleyball),
                    Icon(Icons.sports_football),
                  ],
                  onPressed: (int index) {
                    setState(() {
                      for (int buttonIndex = 0; buttonIndex < isSelected3.length; buttonIndex++) {
                        if (buttonIndex == index) {
                          isSelected3[buttonIndex] = !isSelected3[buttonIndex];
                        } else {
                          isSelected3[buttonIndex] = false;
                        }
                      }
                    });
                  },
                  isSelected: isSelected3,
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                child: Text('Multi selection & but at least must have 1 selection'),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 16),
                child: ToggleButtons(
                  borderRadius: BorderRadius.circular(24),
                  children: <Widget>[
                    Icon(Icons.home, color: Colors.cyan),
                    Icon(Icons.settings),
                    Icon(Icons.star, color: Colors.orangeAccent),
                  ],
                  onPressed: (int index) {
                    int count = 0;
                    isSelected4.forEach((bool val) {
                      if (val) count++;
                    });

                    if (isSelected4[index] && count < 2)
                      return;

                    setState(() {
                      isSelected4[index] = !isSelected4[index];
                    });
                  },
                  isSelected: isSelected4,
                ),
              ),
            ],
          ),
        )
    );
  }
}
