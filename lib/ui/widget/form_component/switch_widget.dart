import 'package:doctor_app/config/constant.dart';
import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';

class SwitchWidgetPage extends StatefulWidget {
  @override
  _SwitchWidgetPageState createState() => _SwitchWidgetPageState();
}

class _SwitchWidgetPageState extends State<SwitchWidgetPage> {
  // initialize global widget
  final _globalWidget = GlobalWidget();

  bool _val = true;

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
                  title: 'Switch Widget',
                  desc: 'This is the example of Switch'
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                child: Text('Switch'),
              ),
              Column(
                children: [
                  Switch(
                    value: _val,
                    onChanged: (value) {
                      setState(() {
                        _val = value;
                      });
                    },
                  ),
                  Switch(
                    value: _val,
                    onChanged: (value) {
                      setState(() {
                        _val = value;
                      });
                    },
                    activeTrackColor: Colors.orangeAccent,
                    activeColor: Colors.green,
                  ),
                  Switch(
                    value: _val,
                    onChanged: (value) {
                      setState(() {
                        _val = value;
                      });
                    },
                    activeTrackColor: Colors.orangeAccent,
                    activeColor: Colors.green,
                    inactiveTrackColor: Colors.purple,
                    inactiveThumbColor: Colors.cyan,
                  ),
                  Transform.scale(
                    scale: 2,
                    child: Switch(
                      value: _val,
                      onChanged: (value) {
                        setState(() {
                          _val = value;
                        });
                      },
                    ),
                  ),
                  Transform.scale(
                    scale: 2,
                    child: Switch(
                      value: _val,
                      onChanged: (value) {
                        setState(() {
                          _val = value;
                        });
                      },
                      activeThumbImage: NetworkImage(GLOBAL_URL+'/assets/images/product/1.jpg'),
                      inactiveThumbImage: NetworkImage(GLOBAL_URL+'/assets/images/product/2.jpg'),
                    ),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 30),
                child: Text('SwitchTile'),
              ),
              SwitchListTile(
                contentPadding: EdgeInsets.only(left: 16, right: 4),
                title: Text('Title switch'),
                value: _val,
                activeColor: PRIMARY_COLOR,
                onChanged: (bool value) {
                  setState(() {
                    _val = value;
                  });
                },
              ),
              SwitchListTile(
                contentPadding: EdgeInsets.only(left: 16, right: 4),
                title: Text('Title switch'),
                subtitle: Text('Subtitle switch'),
                value: _val,
                activeTrackColor: Colors.lightGreenAccent,
                activeColor: Colors.pinkAccent,
                onChanged: (bool value) {
                  setState(() {
                    _val = value;
                  });
                },
              ),
              SwitchListTile(
                contentPadding: EdgeInsets.only(left: 16, right: 4),
                title: Text('Title switch'),
                subtitle: Text('Subtitle switch'),
                secondary: Icon(Icons.home),
                value: _val,
                activeTrackColor: Colors.yellow,
                activeColor: Colors.purple,
                onChanged: (bool value) {
                  setState(() {
                    _val = value;
                  });
                },
              )
            ],
          ),
        )
    );
  }
}
