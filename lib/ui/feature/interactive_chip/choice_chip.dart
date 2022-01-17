import 'package:doctor_app/model/feature/color_model.dart';
import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';

class ChoiceChipPage extends StatefulWidget {
  @override
  _ChoiceChipPageState createState() => _ChoiceChipPageState();
}

class _ChoiceChipPageState extends State<ChoiceChipPage> {
  // initialize global widget
  final _globalWidget = GlobalWidget();

  List<ColorModel> _colorList = [
    ColorModel(1, 'Red'),
    ColorModel(2, 'Green'),
    ColorModel(3, 'Blue'),
    ColorModel(4, 'Cyan'),
    ColorModel(5, 'Yellow'),
    ColorModel(6, 'Magenta'),
  ];
  
  var _selectedIndex = 0;

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
                  title: 'Choice Chip',
                  desc: 'This is the example of choice chip'
              ),
              Container(
                  margin: EdgeInsets.only(top: 10),
                  child: Text('Choice Color')
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 8),
                // this is the start of example
                child: Wrap(
                  children: List.generate(_colorList.length, (index) {
                    return ChoiceChip(
                      label: Text(_colorList[index].color, style: TextStyle(
                        color: Colors.white
                      )),
                      elevation: 0,
                      pressElevation: 0,
                      selectedColor: Colors.pinkAccent,
                      backgroundColor: Colors.pink[100],
                      selected: (_selectedIndex==0)?(_colorList[index].id==1?true:false):_selectedIndex == _colorList[index].id,
                      onSelected: (bool selected) {
                        setState(() {
                          _selectedIndex = _colorList[index].id;
                        });
                      }
                    );
                  }),
                  spacing: 8,
                ),
              ),
            ],
          ),
        )
    );
  }
}