import 'package:doctor_app/config/constant.dart';
import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';

class AlignmentWrapPage extends StatefulWidget {
  @override
  _AlignmentWrapPageState createState() => _AlignmentWrapPageState();
}

class _AlignmentWrapPageState extends State<AlignmentWrapPage> {
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
                  title: 'Alignment Wrap',
                  desc: 'This is the example of wrap with alignment'
              ),
              Container(
                  margin: EdgeInsets.only(top: 10),
                  child: Text('Align left', style: TextStyle(color: SOFT_BLUE))
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 8),
                child: Wrap(
                  spacing: 8,
                  alignment: WrapAlignment.start,
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
                  margin: EdgeInsets.only(top: 20),
                  child: Text('Align center', style: TextStyle(color: SOFT_BLUE))
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 8),
                child: Wrap(
                  spacing: 8,
                  alignment: WrapAlignment.center,
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
                  margin: EdgeInsets.only(top: 20),
                  child: Text('Align right', style: TextStyle(color: SOFT_BLUE))
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 8),
                child: Wrap(
                  spacing: 8,
                  alignment: WrapAlignment.end,
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
                  margin: EdgeInsets.only(top: 20),
                  child: Text('Align center & give same space left right at all widget', style: TextStyle(color: SOFT_BLUE))
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 8),
                child: Wrap(
                  spacing: 8,
                  alignment: WrapAlignment.spaceAround,
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
                  margin: EdgeInsets.only(top: 20),
                  child: Text('Align center & give same space between the middle widget', style: TextStyle(color: SOFT_BLUE))
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 8),
                child: Wrap(
                  spacing: 8,
                  alignment: WrapAlignment.spaceBetween,
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
                  margin: EdgeInsets.only(top: 20),
                  child: Text('Align center & give same space in every widget', style: TextStyle(color: SOFT_BLUE))
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 8),
                child: Wrap(
                  spacing: 8,
                  alignment: WrapAlignment.spaceEvenly,
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
