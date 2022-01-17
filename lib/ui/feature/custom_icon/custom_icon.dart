import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';

class CustomIconPage extends StatefulWidget {
  @override
  _CustomIconPageState createState() => _CustomIconPageState();
}

class _CustomIconPageState extends State<CustomIconPage> {
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
                  title: 'Custom Icon',
                  desc: 'This is the example of custom icon with label'
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 8),
                // this is the start of example
                child: Wrap(
                  spacing: 16,
                  children: [
                    customNotifIcon(count: 1, notifColor: Colors.grey[600]!, labelColor: Colors.orangeAccent),
                    customNotifIcon(count: 2, notifColor: Colors.grey[600]!, labelColor: Colors.pinkAccent, position: 'left'),
                    customNotifIcon(count: 3, notifColor: Colors.green, labelColor: Colors.cyan),
                    customNotifIcon(count: 4, notifSize: 40, notifColor: Colors.blue),
                    customNotifIcon(count: 4, notifSize: 40, labelSize: 20, notifColor: Colors.blueGrey),
                    customNotifIcon(count: 4, notifSize: 40, labelSize: 20, position: 'left'),
                    customNotifIcon(count: 4, notifSize: 24, labelSize: 18),
                  ],
                ),
              ),
            ],
          ),
        )
    );
  }

  Widget customNotifIcon({int count=0, Color notifColor=Colors.grey, Color labelColor=Colors.pinkAccent, double notifSize=24, double labelSize=14, String position='right'}) {
    double? posLeft;
    double? posRight = 0;
    if(position == 'left'){
      posLeft = 0;
      posRight = null;
    }
    return Stack(
      children: <Widget>[
        Icon(Icons.notifications, color: notifColor, size: notifSize),
        Positioned(
          left: posLeft,
          right: posRight,
          child: Container(
            padding: EdgeInsets.all(1),
            decoration: BoxDecoration(
              color: labelColor,
              borderRadius: BorderRadius.circular(labelSize),
            ),
            constraints: BoxConstraints(
              minWidth: labelSize,
              minHeight: labelSize,
            ),
            child: Center(
              child: Text(
                count.toString(),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 8,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        )
      ],
    );
  }
}
