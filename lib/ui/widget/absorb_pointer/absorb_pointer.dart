import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';

class AbsorbPointerPage extends StatefulWidget {
  @override
  _AbsorbPointerPageState createState() => _AbsorbPointerPageState();
}

class _AbsorbPointerPageState extends State<AbsorbPointerPage> {
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
            _globalWidget.createDetailWidget2(
                title: 'Absorb Pointer',
                desc: 'A widget that absorbs pointers during hit testing.',
                icon: Icons.mouse
            ),
            SizedBox(height: 16),
            Container(
              margin: EdgeInsets.symmetric(vertical: 8),
              child: Stack(
                alignment: AlignmentDirectional.center,
                children: <Widget>[
                  SizedBox(
                    width: 200.0,
                    height: 100.0,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: null,
                    ),
                  ),
                  SizedBox(
                    width: 100.0,
                    height: 200.0,
                    child: AbsorbPointer(
                      absorbing: true,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.pinkAccent,
                        ),
                        onPressed: () {},
                        child: null,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
