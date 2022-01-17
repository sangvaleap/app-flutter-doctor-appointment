import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';

class StandartDatatablePage extends StatefulWidget {
  @override
  _StandartDatatablePageState createState() => _StandartDatatablePageState();
}

class _StandartDatatablePageState extends State<StandartDatatablePage> {
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
                  title: 'Standart DataTable',
                  desc: 'This is the example of DataTable without any style'
              ),
              Container(
                  margin: EdgeInsets.symmetric(vertical: 8),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: DataTable(
                      columns: <DataColumn>[
                        DataColumn(label: Text('title 1')),
                        DataColumn(label: Text('title 2')),
                        DataColumn(label: Text('title 3')),
                        DataColumn(label: Text('title 4')),
                      ],
                      rows: <DataRow>[
                        DataRow(
                          cells: <DataCell>[
                            DataCell(Text('Data 1 Title 1')),
                            DataCell(Text('Data 1 Title 2')),
                            DataCell(Text('Data 1 Title 3')),
                            DataCell(Text('Data 1 Title 4')),
                          ],
                        ),
                        DataRow(
                          cells: <DataCell>[
                            DataCell(Text('Data 2 Title 1')),
                            DataCell(Text('Data 2 Title 2')),
                            DataCell(Text('Data 2 Title 3')),
                            DataCell(Text('Data 2 Title 4')),
                          ],
                        ),
                        DataRow(
                          cells: <DataCell>[
                            DataCell(Text('Data 3 Title 1')),
                            DataCell(Text('Data 3 Title 2')),
                            DataCell(Text('Data 3 Title 3')),
                            DataCell(Text('Data 3 Title 4')),
                          ],
                        ),
                        DataRow(
                          cells: <DataCell>[
                            DataCell(Text('Data 4 Title 1')),
                            DataCell(Text('Data 4 Title 2')),
                            DataCell(Text('Data 4 Title 3')),
                            DataCell(Text('Data 4 Title 4')),
                          ],
                        ),
                      ],
                    ),
                  )
              ),
            ],
          ),
        )
    );
  }
}
