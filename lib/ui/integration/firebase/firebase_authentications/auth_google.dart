import 'package:doctor_app/ui/integration/firebase/firebase_authentications/auth_home.dart';
import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthGooglePage extends StatefulWidget {
  @override
  _AuthGooglePageState createState() => _AuthGooglePageState();
}

class _AuthGooglePageState extends State<AuthGooglePage> {
  // initialize global widget
  final _globalWidget = GlobalWidget();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  void _checkUserLogin(){
    User? user = _auth.currentUser;
    if(user != null){
      Navigator.pop(context);
      Navigator.push(context, MaterialPageRoute(builder: (context) => AuthHomePage()));
    }
  }

  Future<void> _signInGoogle() async{
    GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
    if(googleUser != null){
      GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      try{
        UserCredential userCredential = await _auth.signInWithCredential(credential);
        User? firebaseUser = userCredential.user;
        if(firebaseUser != null){
          Navigator.pop(context);
          Navigator.push(context, MaterialPageRoute(builder: (context) => AuthHomePage()));
        } else {
          Fluttertoast.showToast(msg: 'Failed to Login : Firebase User return null', toastLength: Toast.LENGTH_LONG);
        }
      } on FirebaseAuthException catch(e){
        Fluttertoast.showToast(msg: e.message.toString(), toastLength: Toast.LENGTH_LONG);
      } catch(e) {
        Fluttertoast.showToast(msg: e.toString(), toastLength: Toast.LENGTH_LONG);
      }
    }
  }

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: _globalWidget.globalAppBar(),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Google Sign In'),
              SizedBox(height: 20),
              _globalWidget.createButton(
                  buttonName: 'Sign In',
                  onPressed: (){
                    _signInGoogle();
                  }
              ),
            ],
          ),
        )
    );
  }
}
