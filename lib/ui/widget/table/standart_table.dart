import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';

class StandartTablePage extends StatefulWidget {
  @override
  _StandartTablePageState createState() => _StandartTablePageState();
}

class _StandartTablePageState extends State<StandartTablePage> {
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
                  title: 'Standart Table',
                  desc: 'This is the example of table without any style'
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 8),
                child: Table(
                  children: [
                    TableRow(
                        children: [
                          TableCell(child: Center(child: Text('1'))),
                          TableCell(child: Center(child: Text('2'))),
                          TableCell(child: Center(child: Text('3'))),
                        ]
                    ),
                    TableRow(
                        children: [
                          TableCell(child: Center(child: Text('4'))),
                          TableCell(child: Center(child: Text('5'))),
                          TableCell(child: Center(child: Text('6'))),
                        ]
                    ),
                    TableRow(
                        children: [
                          TableCell(child: Center(child: Text('7'))),
                          TableCell(child: Center(child: Text('8'))),
                          TableCell(child: Center(child: Text('9'))),
                        ]
                    )
                  ],
                )
              ),
            ],
          ),
        )
    );
  }
}
