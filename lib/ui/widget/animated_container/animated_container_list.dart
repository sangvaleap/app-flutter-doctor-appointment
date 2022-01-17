import 'package:doctor_app/config/constant.dart';
import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:doctor_app/ui/widget/animated_container/animated_container1.dart';
import 'package:doctor_app/ui/widget/animated_container/animated_container2.dart';
import 'package:doctor_app/ui/widget/animated_container/animated_container3.dart';
import 'package:flutter/material.dart';

class AnimatedContainerListPage extends StatefulWidget {
  @override
  _AnimatedContainerListPageState createState() => _AnimatedContainerListPageState();
}

class _AnimatedContainerListPageState extends State<AnimatedContainerListPage> {
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
        body: ListView(
          padding: EdgeInsets.fromLTRB(24, 24, 24, 16),
          children: [
            Container(
              child: Text('Animated Container', style: TextStyle(
                  fontSize: 18, color: BLACK21, fontWeight: FontWeight.w500
              )),
            ),
            Container(
              margin: EdgeInsets.only(top: 24),
              child: Row(
                children: [
                  Flexible(
                      flex:5,
                      child: Container(
                        child: Text('Animated Container Widget used to animate a container.', style: TextStyle(
                            fontSize: 15, color: BLACK77,letterSpacing: 0.5
                        )),
                      )
                  ),
                  Flexible(
                      flex: 2,
                      child: Container(
                          alignment: Alignment.center,
                          child: Icon(Icons.animation, size: 50, color: SOFT_BLUE))
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 48),
              child: Text('List', style: TextStyle(
                  fontSize: 18, color: BLACK21, fontWeight: FontWeight.w500
              )),
            ),
            SizedBox(height: 18),
            _globalWidget.screenDetailList(context: context, title: 'Animated Container 1', page: AnimatedContainer1Page()),
            _globalWidget.screenDetailList(context: context, title: 'Animated Container 2', page: AnimatedContainer2Page()),
            _globalWidget.screenDetailList(context: context, title: 'Animated Container 3', page: AnimatedContainer3Page()),
          ],
        )
    );
  }
}
