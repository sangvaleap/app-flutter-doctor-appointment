import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class IgnorePointerPage extends StatefulWidget {
  @override
  _IgnorePointerPageState createState() => _IgnorePointerPageState();
}

class _IgnorePointerPageState extends State<IgnorePointerPage> {
  // initialize global widget
  final _globalWidget = GlobalWidget();

  bool _ignore = false;

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
            _globalWidget.createDetailWidget2(
                title: 'Ignore Pointer',
                desc: 'A widget that is invisible during hit testing.',
                icon: Icons.mouse
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 8),
              child: _globalWidget.createButton(
                  buttonName: 'Change Ignoring to '+(_ignore ? 'false' : 'true'),
                  onPressed: (){
                    setState(() {
                      _ignore = !_ignore;
                    });
                  }
              ),
            ),
            SizedBox(height: 8),
            Container(
              margin: EdgeInsets.symmetric(vertical: 8),
              child: Text('Ignoring : '+_ignore.toString()),
            ),
            SizedBox(height: 16),
            Container(
              margin: EdgeInsets.symmetric(vertical: 8),
              child: IgnorePointer(
                ignoring: _ignore,
                child: _globalWidget.createButton(
                    buttonName: 'Click Me ',
                    onPressed: (){
                      Fluttertoast.showToast(msg: 'Clicked', toastLength: Toast.LENGTH_SHORT);
                    }
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
