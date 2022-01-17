import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';

class HorizontalWithSpaceRowPage extends StatefulWidget {
  @override
  _HorizontalWithSpaceRowPageState createState() => _HorizontalWithSpaceRowPageState();
}

class _HorizontalWithSpaceRowPageState extends State<HorizontalWithSpaceRowPage> {
  // initialize global widget
  final _globalWidget = GlobalWidget();

  Color _outerBoxColor = Colors.grey[400]!;
  Color _leftBoxColor = Colors.indigoAccent;
  Color _middleBoxColor = Colors.orange;
  Color _rightBoxColor = Colors.pinkAccent;
  Color _textColor = Colors.white;

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
            _globalWidget.createDetailWidget(
                title: 'Horizontal with Space Alignment Row',
                desc: 'This is the example of horizontal with space in Row Widget'
            ),
            Container(
                margin: EdgeInsets.only(top: 10),
                child: Text('Align center & give same space left right at all container')
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 8),
              child: Container(
                height: 100,
                color: _outerBoxColor,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      color: _leftBoxColor,
                      width: 100,
                      height: 40,
                      child: Text('Left Side', style: TextStyle(color: _textColor)),
                    ),
                    Container(
                      color: _middleBoxColor,
                      width: 100,
                      height: 40,
                      child: Text('Middle Side', style: TextStyle(color: _textColor)),
                    ),
                    Container(
                      color: _rightBoxColor,
                      width: 100,
                      height: 40,
                      child: Text('Right Side', style: TextStyle(color: _textColor)),
                    ),
                  ],
                ),
              ),
            ),
            Container(
                margin: EdgeInsets.only(top: 20),
                child: Text('Align center & give same space between the middle container')
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 8),
              child: Container(
                height: 100,
                color: _outerBoxColor,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      color: _leftBoxColor,
                      width: 100,
                      height: 40,
                      child: Text('Left Side', style: TextStyle(color: _textColor)),
                    ),
                    Container(
                      color: _middleBoxColor,
                      width: 100,
                      height: 40,
                      child: Text('Middle Side', style: TextStyle(color: _textColor)),
                    ),
                    Container(
                      color: _rightBoxColor,
                      width: 100,
                      height: 40,
                      child: Text('Right Side', style: TextStyle(color: _textColor)),
                    ),
                  ],
                ),
              ),
            ),
            Container(
                margin: EdgeInsets.only(top: 20),
                child: Text('Align center & give same space in every container')
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 8),
              child: Container(
                height: 100,
                color: _outerBoxColor,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      color: _leftBoxColor,
                      width: 100,
                      height: 40,
                      child: Text('Left Side', style: TextStyle(color: _textColor)),
                    ),
                    Container(
                      color: _middleBoxColor,
                      width: 100,
                      height: 40,
                      child: Text('Middle Side', style: TextStyle(color: _textColor)),
                    ),
                    Container(
                      color: _rightBoxColor,
                      width: 100,
                      height: 40,
                      child: Text('Right Side', style: TextStyle(color: _textColor)),
                    ),
                  ],
                ),
              ),
            ),
          ],
        )
    );
  }
}
