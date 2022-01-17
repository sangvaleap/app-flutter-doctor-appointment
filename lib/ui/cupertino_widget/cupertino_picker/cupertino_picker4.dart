import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CupertinoPicker4Page extends StatefulWidget {
  @override
  _CupertinoPicker4PageState createState() => _CupertinoPicker4PageState();
}

class _CupertinoPicker4PageState extends State<CupertinoPicker4Page> {
  // initialize global widget
  final _globalWidget = GlobalWidget();

  int _fruitIndex = 7;
  final List<String> _fruits = [
    'Acerola – West Indian Cherry',
    'Apple',
    'Apricots',
    'Avocado',
    'Banana',
    'Blackberries',
    'Blackcurrant',
    'Blueberries',
    'Breadfruit',
    'Cantaloupe',
    'Carambola',
    'Cherimoya',
    'Cherries',
    'Clementine',
    'Coconut Meat',
    'Cranberries',
    'Custard-Apple',
    'Date Fruit',
    'Durian',
    'Elderberries',
    'Feijoa',
    'Figs',
    'Gooseberries',
    'Grapefruit',
    'Grapes',
    'Guava',
    'Honeydew Melon',
    'Jackfruit',
    'Java-Plum',
    'Jujube Fruit',
    'Kiwifruit',
    'Kumquat',
    'Lemon',
    'Lime',
    'Longan',
    'Loquat',
    'Lychee',
    'Mandarin',
    'Mango',
    'Mangosteen',
    'Mulberries',
    'Nectarine',
    'Olives',
    'Orange',
    'Papaya',
    'Passion Fruit',
    'Peaches',
    'Pear',
    'Persimmon – Japanese',
    'Pitaya (Dragonfruit)',
    'Pineapple',
    'Pitanga',
    'Plantain',
    'Plums',
    'Pomegranate',
    'Prickly Pear',
    'Prunes',
    'Pummelo',
    'Quince',
    'Raspberries',
    'Rhubarb',
    'Rose-Apple',
    'Sapodilla',
    'Sapote, Mamey',
    'Soursop',
    'Strawberries',
    'Sugar-Apple',
    'Tamarind',
    'Tangerine',
    'Watermelon'
  ];

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
            Container(
              child: _globalWidget.createDetailWidget(
                  title: 'Cupertino Picker 4 - with Dialog',
                  desc: 'This is the example of Cupertino Picker with dialog'
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 8),
              child: _globalWidget.createButton(
                  buttonName: 'Show Cupertino Picker',
                  onPressed: (){
                    showCupertinoModalPopup<void>(
                      context: context,
                      builder: (BuildContext context){
                        return StatefulBuilder(builder: (BuildContext context, StateSetter mystate) {
                          return CupertinoActionSheet(
                            actions: [
                              SizedBox(
                                height: 300,
                                child: CupertinoPicker(
                                  scrollController: FixedExtentScrollController(initialItem: _fruitIndex),
                                  itemExtent: 64,
                                  looping: true,
                                  selectionOverlay: CupertinoPickerDefaultSelectionOverlay(
                                    background: Colors.pink.withOpacity(0.12),
                                  ),
                                  onSelectedItemChanged: (index){
                                    mystate(() {
                                      _fruitIndex = index;
                                    });
                                  },
                                  children: List.generate(_fruits.length, (index) {
                                    final isSelected = _fruitIndex == index;
                                    final color = isSelected ? Colors.pink : Colors.black;

                                    return Center(
                                      child: Text(_fruits[index], style: TextStyle(
                                          fontSize: 24, color: color
                                      )),
                                    );
                                  }),
                                ),
                              )
                            ],
                            cancelButton: CupertinoActionSheetAction(
                              child: Text('Done'),
                              onPressed: (){
                                Fluttertoast.showToast(msg: _fruits[_fruitIndex], toastLength: Toast.LENGTH_SHORT);
                                Navigator.pop(context);
                              },
                            ),
                          );
                        });
                      },
                    );
                  }
              ),
            ),
          ],
        ),
      ),
    );
  }
}
