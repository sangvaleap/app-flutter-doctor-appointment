import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';

class HorizontalAlignmentColumnPage extends StatefulWidget {
  @override
  _HorizontalAlignmentColumnPageState createState() => _HorizontalAlignmentColumnPageState();
}

class _HorizontalAlignmentColumnPageState extends State<HorizontalAlignmentColumnPage> {
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
                title: 'Horizontal Alignment Column',
                desc: 'This is the example of horizontal alignment in Column Widget'
            ),
            Container(
                margin: EdgeInsets.only(top: 10),
                child: Text('Align left')
            ),
            Container(
              height: 200,
              margin: EdgeInsets.symmetric(vertical: 8),
              child: Container(
                color: _outerBoxColor,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      color: _leftBoxColor,
                      width: 100,
                      height: 40,
                      child: Text('Top Side', style: TextStyle(color: _textColor)),
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
                      child: Text('Bottom Side', style: TextStyle(color: _textColor)),
                    ),
                  ],
                ),
              ),
            ),
            Container(
                margin: EdgeInsets.only(top: 20),
                child: Text('Align center')
            ),
            Container(
              height: 200,
              margin: EdgeInsets.symmetric(vertical: 8),
              child: Container(
                color: _outerBoxColor,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      color: _leftBoxColor,
                      width: 100,
                      height: 40,
                      child: Text('Top Side', style: TextStyle(color: _textColor)),
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
                      child: Text('Bottom Side', style: TextStyle(color: _textColor)),
                    ),
                  ],
                ),
              ),
            ),
            Container(
                margin: EdgeInsets.only(top: 20),
                child: Text('Align right')
            ),
            Container(
              height: 200,
              margin: EdgeInsets.symmetric(vertical: 8),
              child: Container(
                color: _outerBoxColor,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      color: _leftBoxColor,
                      width: 100,
                      height: 40,
                      child: Text('Top Side', style: TextStyle(color: _textColor)),
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
                      child: Text('Bottom Side', style: TextStyle(color: _textColor)),
                    ),
                  ],
                ),
              ),
            ),
            Container(
                margin: EdgeInsets.only(top: 20),
                child: Text('Align left & fill all')
            ),
            Container(
              height: 200,
              margin: EdgeInsets.symmetric(vertical: 8),
              child: Container(
                color: _outerBoxColor,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      color: _leftBoxColor,
                      width: 100,
                      height: 40,
                      child: Text('Top Side', style: TextStyle(color: _textColor)),
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
                      child: Text('Bottom Side', style: TextStyle(color: _textColor)),
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
