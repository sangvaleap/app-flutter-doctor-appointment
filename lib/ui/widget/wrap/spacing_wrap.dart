import 'package:doctor_app/config/constant.dart';
import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';

class SpacingWrapPage extends StatefulWidget {
  @override
  _SpacingWrapPageState createState() => _SpacingWrapPageState();
}

class _SpacingWrapPageState extends State<SpacingWrapPage> {
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
                  title: 'Spacing Wrap',
                  desc: 'This is the example of wrap with spacing'
              ),
              Container(
                  margin: EdgeInsets.only(top: 10),
                  child: Text('Spacing horizontal', style: TextStyle(color: SOFT_BLUE))
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 8),
                child: Wrap(
                  spacing: 8,
                  children: [
                    Text('aaa'),
                    Text('bbb'),
                    Text('ccc'),
                    Text('ddd'),
                    Text('eee'),
                    Text('fff'),
                    Text('ggg'),
                    Text('hhh'),
                    Text('iii'),
                    Text('jjj'),
                    Text('kkk'),
                    Text('lll'),
                    Text('mmm'),
                    Text('nnn'),
                    Text('ooo'),
                    Text('ppp'),
                    Text('qqq'),
                    Text('rrr'),
                    Text('sss'),
                    Text('ttt'),
                    Text('uuu'),
                    Text('vvv'),
                    Text('www'),
                    Text('111'),
                    Text('222'),
                    Text('333'),
                  ],
                ),
              ),
              Container(
                  margin: EdgeInsets.only(top: 10),
                  child: Text('Spacing vertical', style: TextStyle(color: SOFT_BLUE))
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 8),
                child: Wrap(
                  runSpacing: 8,
                  children: [
                    Text('aaa'),
                    Text('bbb'),
                    Text('ccc'),
                    Text('ddd'),
                    Text('eee'),
                    Text('fff'),
                    Text('ggg'),
                    Text('hhh'),
                    Text('iii'),
                    Text('jjj'),
                    Text('kkk'),
                    Text('lll'),
                    Text('mmm'),
                    Text('nnn'),
                    Text('ooo'),
                    Text('ppp'),
                    Text('qqq'),
                    Text('rrr'),
                    Text('sss'),
                    Text('ttt'),
                    Text('uuu'),
                    Text('vvv'),
                    Text('www'),
                    Text('111'),
                    Text('222'),
                    Text('333'),
                  ],
                ),
              ),
            ],
          ),
        )
    );
  }
}
