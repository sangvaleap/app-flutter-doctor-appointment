import 'package:flutter/material.dart';

class SettingSidePage extends StatefulWidget {
  @override
  _SettingSidePageState createState() => _SettingSidePageState();
}

class _SettingSidePageState extends State<SettingSidePage> {
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
        body: SafeArea(
          left: false,
          top: true,
          right: false,
          bottom: false,
          child: Container(
            color: Colors.pinkAccent,
            child: Text(
                'a b c d e f g h i j k l m n o p q r s t u v w x y z'
                    'a b c d e f g h i j k l m n o p q r s t u v w x y z'
                    'a b c d e f g h i j k l m n o p q r s t u v w x y z'
                    'a b c d e f g h i j k l m n o p q r s t u v w x y z'
                    'a b c d e f g h i j k l m n o p q r s t u v w x y z'
                    'a b c d e f g h i j k l m n o p q r s t u v w x y z'
                    'a b c d e f g h i j k l m n o p q r s t u v w x y z'
                    'a b c d e f g h i j k l m n o p q r s t u v w x y z'
                    'a b c d e f g h i j k l m n o p q r s t u v w x y z'
                    'a b c d e f g h i j k l m n o p q r s t u v w x y z'
            ),
          ),
        )
    );
  }
}
