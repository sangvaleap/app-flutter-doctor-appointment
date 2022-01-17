import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';

class FilterChipPage extends StatefulWidget {
  @override
  _FilterChipPageState createState() => _FilterChipPageState();
}

class _FilterChipPageState extends State<FilterChipPage> {
  // initialize global widget
  final _globalWidget = GlobalWidget();

  bool _isSelected1 = false;
  bool _isSelected2 = false;
  bool _isSelected3 = false;

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
                  title: 'Filter Chip',
                  desc: 'This is the example of filter chip'
              ),
              Container(
                  margin: EdgeInsets.only(top: 10),
                  child: Text('Filter')
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 8),
                // this is the start of example
                child: Wrap(
                  children: [
                    FilterChip(
                      label: Text('Official Store'),
                      labelStyle: TextStyle(color: Colors.white),
                      selected: _isSelected1,
                      onSelected: (bool selected) {
                        setState(() {
                          _isSelected1 = !_isSelected1;
                        });
                      },
                      elevation: 0,
                      pressElevation: 0,
                      backgroundColor: Colors.pink[200],
                      selectedColor: Colors.pinkAccent,
                      checkmarkColor: Colors.white,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    FilterChip(
                      label: Text('Free Delivery'),
                      labelStyle: TextStyle(color: Colors.white),
                      selected: _isSelected2,
                      onSelected: (bool selected) {
                        setState(() {
                          _isSelected2 = !_isSelected2;
                        });
                      },
                      elevation: 0,
                      pressElevation: 0,
                      backgroundColor: Colors.pink[200],
                      selectedColor: Colors.pinkAccent,
                      checkmarkColor: Colors.white,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    FilterChip(
                      label: Text('Discount'),
                      labelStyle: TextStyle(color: Colors.white),
                      selected: _isSelected3,
                      onSelected: (bool selected) {
                        setState(() {
                          _isSelected3 = !_isSelected3;
                        });
                      },
                      elevation: 0,
                      pressElevation: 0,
                      backgroundColor: Colors.pink[200],
                      selectedColor: Colors.pinkAccent,
                      checkmarkColor: Colors.white,
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
    );
  }
}
