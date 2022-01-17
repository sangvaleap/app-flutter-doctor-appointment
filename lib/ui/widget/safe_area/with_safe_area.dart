import 'package:flutter/material.dart';

class WithSafeAreaPage extends StatefulWidget {
  @override
  _WithSafeAreaPageState createState() => _WithSafeAreaPageState();
}

class _WithSafeAreaPageState extends State<WithSafeAreaPage> {
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
