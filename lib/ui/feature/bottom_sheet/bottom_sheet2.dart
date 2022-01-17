import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class BottomSheet2Page extends StatefulWidget {
  @override
  _BottomSheet2PageState createState() => _BottomSheet2PageState();
}

class _BottomSheet2PageState extends State<BottomSheet2Page> {
  // initialize global widget
  final _globalWidget = GlobalWidget();

  Color _color1 = Color(0xFF515151);
  Color _color2 = Color(0xff01aed6);

  // create sort filter data
  late List<String> _sortList;
  late int _sortIndex = 0;

  // create courier filter data
  late List<String> _courierList;
  late List<bool> _courierSelectedList;

  // create courier filter data
  late List<String> _conditionList;
  late List<bool> _conditionSelectedList;

  @override
  void initState() {
    setState(() {
      _sortList = [
        'Relevant Product',
        'Review',
        'Newest Product',
        'Highest Price',
        'Lowest Price'
      ];

      _courierList = [
        'DHL',
        'FedEx',
        'Grab Instant',
      ];

      _courierSelectedList = [
        false,
        false,
        false,
      ];

      _conditionList = [
        'New',
        'Second',
        'Refurbished',
      ];

      _conditionSelectedList = [
        false,
        false,
        false,
      ];
    });

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
                  title: 'Bottom Sheet for Filter',
                  desc: 'This is the example of bottom sheet for filter'
              ),
            ),
            Container(
                margin: EdgeInsets.symmetric(vertical: 8),
                child: _globalWidget.createButton(
                    buttonName: 'Open BottomSheet',
                    onPressed: (){
                      showModalBottomSheet<void>(
                        context: context,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(24), topRight: Radius.circular(24)),
                        ),
                        builder: (BuildContext context) {
                          return _showPopup();
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

  Widget _showPopup(){
    // must use StateSetter to update data between main screen and popup.
    // if use default setState, the data will not update
    return StatefulBuilder(builder: (BuildContext context, StateSetter mystate) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              margin: EdgeInsets.only(top: 12, bottom: 12),
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                  color: Colors.grey[500],
                  borderRadius: BorderRadius.circular(10)
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Text('Filter', style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold
            )),
          ),
          Flexible(
            child: ListView(
              padding: EdgeInsets.all(16),
              children: <Widget>[
                Text('Sort', style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold
                )),
                Wrap(
                  spacing: 8,
                  children: List.generate(_sortList.length,(index){
                    return _radioSort(_sortList[index],index, mystate);
                  }),
                ),
                SizedBox(
                  height: 24,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Courier', style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold
                    )),
                    GestureDetector(
                      onTap: (){
                        Fluttertoast.showToast(msg: 'Click view all courier', toastLength: Toast.LENGTH_SHORT);
                      },
                      child: Text('view all', style: TextStyle(
                          color: _color2
                      )),
                    )
                  ],
                ),
                Wrap(
                  spacing: 8,
                  children: List.generate(_courierList.length,(index){
                    return _filter(_courierSelectedList, _courierList[index],index, mystate);
                  }),
                ),
                SizedBox(
                  height: 24,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Conditions', style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold
                    )),
                    GestureDetector(
                      onTap: (){
                        Fluttertoast.showToast(msg: 'Click view all conditions', toastLength: Toast.LENGTH_SHORT);
                      },
                      child: Text('view all', style: TextStyle(
                          color: _color2
                      )),
                    )
                  ],
                ),
                Wrap(
                  spacing: 8,
                  children: List.generate(_conditionList.length,(index){
                    return _filter(_conditionSelectedList, _conditionList[index],index, mystate);
                  }),
                ),
              ],
            ),
          ),
        ],
      );
    });
  }

  Widget _radioSort(String value, int index, mystate){
    return ChoiceChip(
        label: Text(value, style: TextStyle(
            color: _sortIndex == index ? Colors.white : _color1
        )),
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 1,
            color: _sortIndex == index ? _color2 : Colors.grey[300]!
          ),
          borderRadius: BorderRadius.circular(10)
        ),
        elevation: 0,
        pressElevation: 0,
        selectedColor: _color2,
        backgroundColor: Colors.white,
        selected: (_sortIndex==0)?(index==0?true:false):_sortIndex == index,
        onSelected: (bool selected) {
          mystate(() {
            _sortIndex = index;
          });
        }
    );
  }

  Widget _filter(var selectedData, String value, int index, mystate){
    return FilterChip(
      label: Text(value),
      labelStyle: TextStyle(color: selectedData[index] == true ? Colors.white : _color1),
      shape: RoundedRectangleBorder(
          side: BorderSide(
              width: 1,
              color: selectedData[index] == true ? _color2 : Colors.grey[300]!
          ),
          borderRadius: BorderRadius.circular(10)
      ),
      selected: selectedData[index],
      onSelected: (bool selected) {
        mystate(() {
          selectedData[index] = selected;
        });
      },
      elevation: 0,
      pressElevation: 0,
      backgroundColor: Colors.white,
      selectedColor: _color2,
      checkmarkColor: Colors.white,
    );
  }
}
