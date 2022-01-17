import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AutoCompleteFormPage extends StatefulWidget {
  @override
  _AutoCompleteFormPageState createState() => _AutoCompleteFormPageState();
}

class _AutoCompleteFormPageState extends State<AutoCompleteFormPage> {
  // initialize global widget
  final _globalWidget = GlobalWidget();

  TextEditingController _typeAheadController = TextEditingController();

  List<String> _fruits = [
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

  List<String> _getSuggestions(String query) {
    List<String> matches = <String>[];
    matches.addAll(_fruits);

    matches.retainWhere((s) => s.toLowerCase().contains(query.toLowerCase()));
    return matches;
  }

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
                  title: 'Auto Complete with Form',
                  desc: 'This is the example of auto complete on the form. When you click on the suggestion, it will fill the text field.'
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 8),
                child: TypeAheadFormField(
                  textFieldConfiguration: TextFieldConfiguration(
                    decoration: InputDecoration(labelText: 'Search Fruit'),
                    controller: this._typeAheadController,
                  ),
                  suggestionsCallback: (pattern) {
                    return _getSuggestions(pattern);
                  },
                  itemBuilder: (context, String suggestion) {
                    return ListTile(
                      title: Text(suggestion),
                    );
                  },
                  transitionBuilder: (context, suggestionsBox, controller) {
                    return suggestionsBox;
                  },
                  onSuggestionSelected: (String suggestion) {
                    _typeAheadController.text = suggestion;
                  }
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 8),
                child: _globalWidget.createButton(
                    buttonName: 'Submit',
                    onPressed: (){
                      Fluttertoast.showToast(msg: 'Text : '+_typeAheadController.text, toastLength: Toast.LENGTH_LONG);
                    }
                ),
              ),
            ],
          ),
        )
    );
  }
}
