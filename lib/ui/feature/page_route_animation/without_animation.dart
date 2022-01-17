import 'package:doctor_app/ui/feature/page_route_animation/destination.dart';
import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';

class WithoutAnimationPage extends StatefulWidget {
  @override
  _WithoutAnimationPageState createState() => _WithoutAnimationPageState();
}

class _WithoutAnimationPageState extends State<WithoutAnimationPage> {
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
                  title: 'Page Route Without Animation',
                  desc: 'This is the example using page route without animation'
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 8),
                // this is the start of example
                child: _globalWidget.createButton(
                    buttonName: 'Go to destination page',
                    onPressed: (){
                      Navigator.of(context).push(PageRouteBuilder(pageBuilder: (_,__,___)=> DestinationPage()));
                    }
                ),
              ),
            ],
          ),
        )
    );
  }
}
