import 'package:flutter/material.dart';

class TabbarWithIconPage extends StatefulWidget {
  @override
  _TabbarWithIconPageState createState() => _TabbarWithIconPageState();
}

class _TabbarWithIconPageState extends State<TabbarWithIconPage> {
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
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              "TabBar with Icon",
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            backgroundColor: Colors.pinkAccent,
            bottom: TabBar(
              tabs: [
                Tab(text: 'Tab 1', icon: Icon(Icons.home)),
                Tab(child: Text('Tab 2')),
                Tab(text: 'Tab 3', icon: Icon(Icons.android)),
              ],
            ),
          ),
          body: TabBarView(
            children: [
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
            ],
          )
      ),
    );
  }
}
