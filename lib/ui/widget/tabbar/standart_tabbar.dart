import 'package:flutter/material.dart';

class StandartTabbarPage extends StatefulWidget {
  @override
  _StandartTabbarPageState createState() => _StandartTabbarPageState();
}

class _StandartTabbarPageState extends State<StandartTabbarPage> {
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
              "Standart TabBar",
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            bottom: TabBar(
              tabs: [
                Tab(text: 'Tab 1'),
                Tab(child: Text('Tab 2')),
                Tab(text: 'Tab 3'),
              ],
            ),
            backgroundColor: Colors.pinkAccent,
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
