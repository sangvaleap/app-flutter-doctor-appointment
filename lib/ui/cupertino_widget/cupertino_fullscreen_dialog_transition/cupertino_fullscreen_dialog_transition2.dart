import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CupertinoFullscreenDialogTransition2Page extends StatefulWidget {
  @override
  _CupertinoFullscreenDialogTransition2PageState createState() => _CupertinoFullscreenDialogTransition2PageState();
}

class _CupertinoFullscreenDialogTransition2PageState extends State<CupertinoFullscreenDialogTransition2Page> with TickerProviderStateMixin {
  late AnimationController _primary, _secondary;
  late Animation<double> _animationPrimary, _animationSecondary;

  @override
  void initState() {
    //Primaty
    _primary = AnimationController(vsync: this, duration: Duration(seconds: 1));
    _animationPrimary = Tween<double>(begin: 0, end: 1)
        .animate(CurvedAnimation(parent: _primary, curve: Curves.easeOut));
    //Secondary
    _secondary =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    _animationSecondary = Tween<double>(begin: 0, end: 1)
        .animate(CurvedAnimation(parent: _secondary, curve: Curves.easeOut));
    _primary.forward();
    super.initState();
  }

  @override
  void dispose() {
    _primary.dispose();
    _secondary.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoFullscreenDialogTransition(
      primaryRouteAnimation: _animationPrimary,
      secondaryRouteAnimation: _animationSecondary,
      linearTransition: false,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.black, //change your color here
          ),
          elevation: 0,
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              _primary.reverse();
              Future.delayed(Duration(seconds: 1), () {
                Navigator.of(context).pop();
              });
            },
          ),
          systemOverlayStyle: SystemUiOverlayStyle.dark,
          centerTitle: true,
          title: Image.asset('assets/images/logo_horizontal.png', height: 24),
          bottom: PreferredSize(
              child: Container(
                color: Colors.grey[100],
                height: 1.0,
              ),
              preferredSize: Size.fromHeight(1.0)),
        ),
        body: WillPopScope(
          onWillPop: (){
            _primary.reverse();
            return Future.value(true);
          },
          child: Center(
            child: Container(
              child: Text('Page 2'),
            ),
          ),
        ),
      ),
    );
  }
}