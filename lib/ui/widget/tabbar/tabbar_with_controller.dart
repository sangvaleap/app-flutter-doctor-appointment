import 'package:flutter/material.dart';

class TabbarWithControllerPage extends StatefulWidget {
  @override
  _TabbarWithControllerPageState createState() => _TabbarWithControllerPageState();
}

class _TabbarWithControllerPageState extends State<TabbarWithControllerPage> with SingleTickerProviderStateMixin {
  int _tabIndex = 0;
  late TabController _tabController;

  List<Tab> _tabBarList = [
    Tab(text: 'Tab 1'),
    Tab(child: Text('Tab 2')),
    Tab(text: 'Tab 3'),
  ];

  List<Widget> _tabContentList = <Widget>[
    Container(
      child: Center(
        child: Text('Content 1'),
      ),
    ),
    Container(
      child: Center(
        child: Text('Content 2'),
      ),
    ),
    Container(
      child: Center(
        child: Text('Content 3'),
      ),
    ),
  ];

  @override
  void initState() {
    _tabController = TabController(vsync: this, length: _tabBarList.length, initialIndex: _tabIndex);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "TabBar with Controller",
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          bottom: TabBar(
            controller: _tabController,
            onTap: (position){
              setState(() {
                _tabIndex = position;
              });
              print('idx : '+_tabIndex.toString());
            },
            tabs: _tabBarList,
          ),
          backgroundColor: Colors.pinkAccent,
        ),
        body: DefaultTabController(
          length: _tabBarList.length,
          child: TabBarView(
            controller: _tabController,
            children: _tabContentList.map((Widget content) {
              return content;
            }).toList(),
          ),
        )
    );
  }
}
