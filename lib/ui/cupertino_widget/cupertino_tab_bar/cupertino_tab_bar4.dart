import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:doctor_app/ui/reusable/ios_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CupertinoTabBar4Page extends StatefulWidget {
  @override
  _CupertinoTabBar4PageState createState() => _CupertinoTabBar4PageState();
}

class _CupertinoTabBar4PageState extends State<CupertinoTabBar4Page> {
  final _globalWidget = GlobalWidget();

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
                return SafeArea(
                  child: CupertinoTabView(
                    builder: (context) {
                      return Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                                margin: EdgeInsets.symmetric(vertical: 8),
                                child: Text('If you go to the next page, the tabbar still be shown', textAlign: TextAlign.center)
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(vertical: 8),
                              child: _globalWidget.createButton(
                                  buttonName: 'Go To New Page 1',
                                  onPressed: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => IosPage()));
                                  }
                              ),
                            ),
                          ],
                        ),
                      );
                    }
                  ),
                );
              case 1:
                return SafeArea(
                  child: CupertinoTabView(
                    builder: (context) {
                      return Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                                margin: EdgeInsets.symmetric(vertical: 8),
                                child: Text('If you go to the next page, the tabbar still be shown', textAlign: TextAlign.center)
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(vertical: 8),
                              child: _globalWidget.createButton(
                                  buttonName: 'Go To New Page 2',
                                  onPressed: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => IosPage()));
                                  }
                              ),
                            ),
                          ],
                        ),
                      );
                    }
                  ),
                );
              case 2:
                return SafeArea(
                  child: CupertinoTabView(
                    builder: (context) {
                      return Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                                margin: EdgeInsets.symmetric(vertical: 8),
                                child: Text('If you go to the next page, the tabbar still be shown', textAlign: TextAlign.center)
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(vertical: 8),
                              child: _globalWidget.createButton(
                                  buttonName: 'Go To New Page 3',
                                  onPressed: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => IosPage()));
                                  }
                              ),
                            ),
                          ],
                        ),
                      );
                    }
                  ),
                );
              case 3:
                return SafeArea(
                  child: CupertinoTabView(
                    builder: (context) {
                      return Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                                margin: EdgeInsets.symmetric(vertical: 8),
                                child: Text('If you go to the next page, the tabbar still be shown', textAlign: TextAlign.center)
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(vertical: 8),
                              child: _globalWidget.createButton(
                                  buttonName: 'Go To New Page 4',
                                  onPressed: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => IosPage()));
                                  }
                              ),
                            ),
                          ],
                        ),
                      );
                    }
                  ),
                );
              default:
                return SafeArea(
                  child: CupertinoTabView(
                    builder: (context) {
                      return Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                                margin: EdgeInsets.symmetric(vertical: 8),
                                child: Text('If you go to the next page, the tabbar still be shown', textAlign: TextAlign.center)
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(vertical: 8),
                              child: _globalWidget.createButton(
                                  buttonName: 'Go To New Page 1',
                                  onPressed: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => IosPage()));
                                  }
                              ),
                            ),
                          ],
                        ),
                      );
                    }
                  ),
                );
            }
          },
        ),
      ),
    );
  }
}
