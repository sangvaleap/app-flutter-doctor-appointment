import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';

class TableWidthPage extends StatefulWidget {
  @override
  _TableWidthPageState createState() => _TableWidthPageState();
}

class _TableWidthPageState extends State<TableWidthPage> {
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
                  title: 'Table Width',
                  desc: 'This is the example to change width of the table'
              ),
              Container(
                  margin: EdgeInsets.symmetric(vertical: 8),
                  child: Table(
                    border: TableBorder.all(),
                    columnWidths: {0: FractionColumnWidth(.4), 1: FractionColumnWidth(.2), 2: FractionColumnWidth(.4)},
                    children: [
                      TableRow(
                          children: [
                            TableCell(child: mediumHeight('1')),
                            TableCell(child: highHeight('2')),
                            TableCell(
                              verticalAlignment: TableCellVerticalAlignment.middle,
                              child: Center(child: Text('3'))
                            ),
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

  Widget mediumHeight(String text){
    return Container(
      height: 100,
      color: Colors.pinkAccent,
      child: Center(child: Text(text)),
    );
  }

  Widget highHeight(String text){
    return Container(
      height: 200,
      color: Colors.orangeAccent,
      child: Center(child: Text(text)),
    );
  }
}
