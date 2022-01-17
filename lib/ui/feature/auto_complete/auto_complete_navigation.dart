import 'package:doctor_app/model/feature/product_model.dart';
import 'package:doctor_app/ui/feature/auto_complete/destination.dart';
import 'package:doctor_app/ui/reusable/cache_image_network.dart';
import 'package:doctor_app/ui/reusable/global_function.dart';
import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

class AutoCompleteNavigationPage extends StatefulWidget {
  @override
  _AutoCompleteNavigationPageState createState() => _AutoCompleteNavigationPageState();
}

class _AutoCompleteNavigationPageState extends State<AutoCompleteNavigationPage> {
  // initialize global widget
  final _globalWidget = GlobalWidget();
  final _globalFunction = GlobalFunction();

  List<ProductModel> _getSuggestions(String query) {
    List<ProductModel> matches = [];
    matches.addAll(productData);
    matches.retainWhere((data) => data.name.toLowerCase().contains(query.toLowerCase()));
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
    final double boxImageSize = (MediaQuery.of(context).size.width / 12);
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: _globalWidget.globalAppBar(),
        body: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(24, 24, 24, 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _globalWidget.createDetailWidget(
                  title: 'Auto Complete with Navigation',
                  desc: 'This is the example of auto complete with navigation. When you click on the suggestion, it will direct you to the destination page.'
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 8),
                child: TypeAheadField(
                  textFieldConfiguration: TextFieldConfiguration(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Search Product'),
                  ),
                  suggestionsCallback: (pattern) {
                    return _getSuggestions(pattern);
                  },
                  itemBuilder: (context, ProductModel suggestion) {
                    return ListTile(
                      leading: ClipRRect(
                          borderRadius:
                          BorderRadius.all(Radius.circular(4)),
                          child: buildCacheNetworkImage(width: boxImageSize, height: boxImageSize, url: suggestion.image)),
                      title: Text(suggestion.name),
                      subtitle: Text('\$ '+_globalFunction.removeDecimalZeroFormat(suggestion.price)),
                    );
                  },
                  onSuggestionSelected: (ProductModel suggestion) {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => DestinationPage(productData: suggestion)));
                  },
                ),
              ),
            ],
          ),
        )
    );
  }
}
