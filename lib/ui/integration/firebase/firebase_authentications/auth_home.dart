import 'package:doctor_app/ui/reusable/cache_image_network.dart';
import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class AuthHomePage extends StatefulWidget {
  @override
  _AuthHomePageState createState() => _AuthHomePageState();
}

class _AuthHomePageState extends State<AuthHomePage> {
  // initialize global widget
  final _globalWidget = GlobalWidget();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? _firebaseUser;
  String? _firebaseEmail, _firebaseName, _firebasePhoto;

  @override
  void initState() {
    SchedulerBinding.instance!.addPostFrameCallback((_) {
      _checkUserLogin();
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _checkUserLogin(){
    setState(() {
      _firebaseUser = _auth.currentUser;
      print('firebaseUser : ' + _firebaseUser.toString());
      if(_firebaseUser == null){
        Navigator.pop(context);
      } else {
        _firebaseEmail = (_firebaseUser!.email != '') ? _firebaseUser!.email : null;
        _firebaseName = (_firebaseUser!.displayName != '') ? _firebaseUser!.displayName : null;
        _firebasePhoto = (_firebaseUser!.photoURL != '') ? _firebaseUser!.photoURL : null;
      }
    });
  }

  Future<void> _signOut() async {
    await _auth.signOut();

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: _globalWidget.globalAppBar(),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Authentication Home Page'),
              SizedBox(height: 20),
              _firebasePhoto!=null?ClipOval(child: buildCacheNetworkImage(url: _firebasePhoto, width: 100)):SizedBox.shrink(),
              _firebasePhoto!=null?SizedBox(height: 20):SizedBox.shrink(),
              Text('Firebase UID : ' + ((_firebaseUser != null)?_firebaseUser!.uid:'')),
              SizedBox(height: 20),
              _firebaseEmail!=null?Text('Email : ' + _firebaseEmail.toString()):SizedBox.shrink(),
              _firebaseEmail!=null?SizedBox(height: 20):SizedBox.shrink(),
              _firebaseName!=null?Text('Name : ' + _firebaseName.toString()):SizedBox.shrink(),
              _firebaseName!=null?SizedBox(height: 20):SizedBox.shrink(),
              _globalWidget.createButton(
                  buttonName: 'Sign Out',
                  onPressed: (){
                    _signOut();
                  }
              ),
            ],
          ),
        )
    );
  }
}
