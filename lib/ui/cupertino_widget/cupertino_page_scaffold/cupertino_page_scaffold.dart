import 'package:flutter/cupertino.dart';

class CupertinoPageScaffoldPage extends StatefulWidget {
  @override
  _CupertinoPageScaffoldPageState createState() => _CupertinoPageScaffoldPageState();
}

class _CupertinoPageScaffoldPageState extends State<CupertinoPageScaffoldPage> {
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
          middle: Text('Scaffold Example'),
        ),
        child: SafeArea(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Text('This is the example of Cupertino Page Scaffold. This is the example of Cupertino Page Scaffold. This is the example of Cupertino Page Scaffold. This is the example of Cupertino Page Scaffold. This is the example of Cupertino Page Scaffold.'),
            )
        ),
      ),
    );
  }
}
