import 'dart:math';

import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';

class AnimatedList2Page extends StatefulWidget {
  @override
  _AnimatedList2PageState createState() => _AnimatedList2PageState();
}

class _AnimatedList2PageState extends State<AnimatedList2Page> {
  // initialize global widget
  final _globalWidget = GlobalWidget();

  final GlobalKey<AnimatedListState> _listKey = GlobalKey();

  Random _random = Random();
  List<String> _data = [];

  @override
  void initState() {
    _data.add('item '+_random.nextInt(255).toString());
    _data.add('item '+_random.nextInt(255).toString());
    _data.add('item '+_random.nextInt(255).toString());
    _data.add('item '+_random.nextInt(255).toString());
    _data.add('item '+_random.nextInt(255).toString());
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
            Wrap(
              spacing: 16,
              children: [
                _globalWidget.createButton(
                    buttonName: 'Add to the first',
                    onPressed: (){
                      _insertSingleItem('first');
                    }
                ),
                _globalWidget.createButton(
                    buttonName: 'Add to the last',
                    onPressed: (){
                      _insertSingleItem('last');
                    }
                ),
                _globalWidget.createButton(
                    buttonName: 'Add to the middle',
                    onPressed: (){
                      _insertSingleItem('middle');
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
    return SizeTransition(
      sizeFactor: animation,
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
  void _insertSingleItem(String position){
    int insertIndex;
    if(position == 'first'){
      insertIndex = 0;
    } else if(position == 'middle'){
      insertIndex = (_data.length/2).ceil();
    } else {
      insertIndex = _data.length;
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
