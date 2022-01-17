import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CupertinoTabBar1Page extends StatefulWidget {
  @override
  _CupertinoTabBar1PageState createState() => _CupertinoTabBar1PageState();
}

class _CupertinoTabBar1PageState extends State<CupertinoTabBar1Page> {
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
    return CupertinoApp(
      debugShowCheckedModeBanner: false,
      home: CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          leading: GestureDetector(
            child: Icon(CupertinoIcons.back),
            onTap: (){
              Navigator.pop(context);
            },
          ),
          middle: Text('Cupertino Tab Bar'),
        ),
        child: CupertinoTabScaffold(
          tabBar: CupertinoTabBar(
            items: [
              BottomNavigationBarItem(
                label: 'Nav 1',
                icon: Icon(CupertinoIcons.home),
              ),
              BottomNavigationBarItem(
                label: 'Nav 2',
                icon: Icon(Icons.favorite),
              ),
              BottomNavigationBarItem(
                label: 'Nav 3',
                icon: Icon(Icons.notifications_rounded),
              ),
              BottomNavigationBarItem(
                label: 'Nav 4',
                icon: Icon(Icons.person_outline),
              ),
            ],
          ),
          tabBuilder: (context, index){
            switch(index){
              case 0:
                return Container(
                  child: Center(
                    child: Text('Page 1'),
                  ),
                );
              case 1:
                return Container(
                  child: Center(
                    child: Text('Page 2'),
                  ),
                );
              case 2:
                return Container(
                  child: Center(
                    child: Text('Page 3'),
                  ),
                );
              case 3:
                return Container(
                  child: Center(
                    child: Text('Page 4'),
                  ),
                );
              default:
                return Container(
                  child: Center(
                    child: Text('Page 1'),
                  ),
                );
            }
          },
        ),
      ),
    );
  }
}
