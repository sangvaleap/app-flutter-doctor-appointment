import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';

class AnimatedList1Page extends StatefulWidget {
  @override
  _AnimatedList1PageState createState() => _AnimatedList1PageState();
}

class _AnimatedList1PageState extends State<AnimatedList1Page> {
  // initialize global widget
  final _globalWidget = GlobalWidget();

  final GlobalKey<AnimatedListState> _listKey = GlobalKey();

  List<String> _data = ['item 1', 'item 2', 'item 3', 'item 4', 'item 5'];

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
        body: AnimatedList(
          // Key to call remove and insert item methods from anywhere
          key: _listKey,
          initialItemCount: _data.length,
          itemBuilder: (context, index, animation) {
            return _buildItem(_data[index], animation, index);
          },
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          backgroundColor: Colors.blue,
          onPressed: (){
            _insertSingleItem();
          },
        )
    );
  }

  Widget _buildItem(String item, Animation<double> animation, int index) {
    return SizeTransition(
      sizeFactor: animation,
      child: Container(
        margin: EdgeInsets.fromLTRB(16, 8, 16, 8),
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
    String item = 'Item '+(insertIndex+1).toString();
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
