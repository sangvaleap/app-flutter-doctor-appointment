import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CupertinoPicker1Page extends StatefulWidget {
  @override
  _CupertinoPicker1PageState createState() => _CupertinoPicker1PageState();
}

class _CupertinoPicker1PageState extends State<CupertinoPicker1Page> {
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
                  title: 'Cupertino Picker 1 - Standart',
                  desc: 'This is the example of standart Cupertino Picker'
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 8),
              child: SizedBox(
                height: 300,
                child: CupertinoPicker(
                  scrollController: FixedExtentScrollController(initialItem: _fruitIndex),
                  itemExtent: 64,
                  onSelectedItemChanged: (index){
                    setState(() {
                      _fruitIndex = index;
                    });
                  },
                  children: List.generate(_fruits.length, (index) {
                    return Center(
                      child: Text(_fruits[index]),
                    );
                  }),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
