/*
https://pub.dev/packages/badges
*/
import 'package:backdrop/backdrop.dart';
import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';

class Backdrop3Page extends StatefulWidget {
  @override
  _Backdrop3PageState createState() => _Backdrop3PageState();
}

// initialize global widget
final _globalWidget = GlobalWidget();

class _Backdrop3PageState extends State<Backdrop3Page> {
  int _currentIndex = 0;
  final List<Widget> _pages = [_Widget1(), _Widget2(), _Widget3()];

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
    return BackdropScaffold(
      appBar: BackdropAppBar(
        title: Text("Backdrop With Navigation"),
        actions: <Widget>[
          BackdropToggleButton(
            icon: AnimatedIcons.list_view,
          )
        ],
      ),
      stickyFrontLayer: true,
      frontLayer: _pages[_currentIndex],
      backLayer: BackdropNavigationBackLayer(
        items: [
          ListTile(title: Text("Widget 1", style: TextStyle(
            color: Colors.white
          ))),
          ListTile(title: Text("Widget 2", style: TextStyle(
              color: Colors.white
          ))),
          ListTile(title: Text("Widget 3", style: TextStyle(
              color: Colors.white
          ))),
        ],
        onTap: (int position) => {setState(() => _currentIndex = position)},
      ),
    );
  }
}

class _Widget1 extends StatelessWidget {
  _Widget1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(child: Text("Widget 1")),
        SizedBox(height: 12),
        Center(
          child: _globalWidget.createButton(
              backgroundColor: Colors.blue,
              textColor: Colors.white,
              buttonName: 'Back',
              onPressed: (){
                Navigator.pop(context);
              }
          ),
        )
      ],
    );
  }
}

class _Widget2 extends StatelessWidget {
  _Widget2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(child: Text("Widget 2")),
        SizedBox(height: 12),
        Center(
          child: _globalWidget.createButton(
              backgroundColor: Colors.blue,
              textColor: Colors.white,
              buttonName: 'Back',
              onPressed: (){
                Navigator.pop(context);
              }
          ),
        )
      ],
    );
  }
}

class _Widget3 extends StatelessWidget {
  _Widget3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(child: Text("Widget 3")),
        SizedBox(height: 12),
        Center(
          child: _globalWidget.createButton(
              backgroundColor: Colors.blue,
              textColor: Colors.white,
              buttonName: 'Back',
              onPressed: (){
                Navigator.pop(context);
              }
          ),
        )
      ],
    );
  }
}