import 'dart:math';

import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';

class AnimatedList6Page extends StatefulWidget {
  @override
  _AnimatedList6PageState createState() => _AnimatedList6PageState();
}

class _AnimatedList6PageState extends State<AnimatedList6Page> {
  // initialize global widget
  final _globalWidget = GlobalWidget();

  final GlobalKey<AnimatedListState> _listKey = GlobalKey();

  Random _random = Random();
  List<String> _delayData = [];
  List<String> _data = [];

  Future<void> _loadItems() async {
    for (int i = 0; i<= _delayData.length-1; i++) {
      // 1) Wait for one second
      await Future.delayed(Duration(milliseconds: 100));
      // 2) Adding data to actual variable that holds the item.
      _data.add(_delayData[i]);
      // 3) Telling animated list to start animation
      _listKey.currentState!.insertItem(_data.length - 1);
    }
  }

  @override
  void initState() {
    _delayData.add('item '+_random.nextInt(255).toString());
    _delayData.add('item '+_random.nextInt(255).toString());
    _delayData.add('item '+_random.nextInt(255).toString());
    _loadItems();
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
        body: ListView(
          padding: EdgeInsets.all(16),
          physics: AlwaysScrollableScrollPhysics(),
          children: [
            Row(
              children: [
                _globalWidget.createButton(
                    buttonName: 'Add',
                    onPressed: (){
                      _insertSingleItem();
                    }
                ),
              ],
            ),
            AnimatedList(
              primary: false,
              shrinkWrap: true,
              // Key to call remove and insert item methods from anywhere
              key: _listKey,
              initialItemCount: _data.length,
              itemBuilder: (context, index, animation) {
                return _buildItem(_data[index], animation, index);
              },
            ),
          ],
        )
    );
  }

  Widget _buildItem(String item, Animation<double> animation, int index) {
    return SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(-1, 0),
        end: Offset(0, 0),
      ).animate(CurvedAnimation(
          parent: animation,
          curve: Curves.easeIn,
          reverseCurve: Curves.easeOut)),
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 8),
        child: Card(
          elevation: 5.0,
          child: ListTile(
            title: Text(
              item,
              style: TextStyle(fontSize: 20),
            ),
            trailing: GestureDetector(
              child: Icon(
                Icons.remove_circle,
                color: Colors.red,
              ),
              onTap: (){
                _removeSingleItems(index);
              },
            ),
          ),
        ),
      ),
    );
  }

  /// Method to add an item to an index in a list
  void _insertSingleItem(){
    int insertIndex;
    if(_data.length > 0){
      insertIndex = _data.length;
    } else {
      insertIndex = 0;
    }
    String item = 'Item '+(_random.nextInt(255).toString());
    _data.insert(insertIndex, item);
    _listKey.currentState!.insertItem(insertIndex);
  }

  /// Method to remove an item at an index from the list
  void _removeSingleItems(int removeAt) {
    int removeIndex = removeAt;
    String removedItem = _data.removeAt(removeIndex);
    // This builder is just so that the animation has something
    // to work with before it disappears from view since the original
    // has already been deleted.
    AnimatedListRemovedItemBuilder builder = (context, animation) {
      // A method to build the Card widget.
      return _buildItem(removedItem, animation, removeAt);
    };
    _listKey.currentState!.removeItem(removeIndex, builder);
  }
}
