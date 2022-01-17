import 'package:doctor_app/ui/integration/firebase/firebase_authentications/auth_home.dart';
import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AuthEmailPasswordPage extends StatefulWidget {
  @override
  _AuthEmailPasswordPageState createState() => _AuthEmailPasswordPageState();
}

class _AuthEmailPasswordPageState extends State<AuthEmailPasswordPage> {
  // initialize global widget
  final _globalWidget = GlobalWidget();

  Color _underlineColor = Color(0xFFCCCCCC);
  Color _mainColor = Color(0xFF07ac12);
  Color _color1 = Color(0xFF515151);
  Color _color2 = Color(0xff777777);

  bool _obscureText = true;
  IconData _iconVisible = Icons.visibility_off;

  TextEditingController _etEmail = TextEditingController();
  TextEditingController _etPassword = TextEditingController();

  void _toggleObscureText() {
    setState(() {
      _obscureText = !_obscureText;
      if (_obscureText == true) {
        _iconVisible = Icons.visibility_off;
      } else {
        _iconVisible = Icons.visibility;
      }
    });
  }

  final FirebaseAuth _auth = FirebaseAuth.instance;

  void _checkUserLogin(){
    User? user = _auth.currentUser;
    if(user != null){
      Navigator.pop(context);
      Navigator.push(context, MaterialPageRoute(builder: (context) => AuthHomePage()));
    }
  }

  Future<void> _signUp({required String email, required String password}) async{
    try{
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User? firebaseUser = userCredential.user;
      if(firebaseUser != null){
        Navigator.pop(context);
        Navigator.push(context, MaterialPageRoute(builder: (context) => AuthHomePage()));
      } else {
        Fluttertoast.showToast(msg: 'Failed to Login : Firebase User return null', toastLength: Toast.LENGTH_LONG);
      }
    } on FirebaseAuthException catch(e){
      Fluttertoast.showToast(msg: e.message.toString(), toastLength: Toast.LENGTH_LONG);
    } catch (e){
      print(e.toString());
      Fluttertoast.showToast(msg: e.toString(), toastLength: Toast.LENGTH_LONG);
    }
  }

  Future<void> _signIn({required String email, required String password}) async{
    try{
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(email: email, password: password);
      User? firebaseUser = userCredential.user;
      if(firebaseUser != null){
        Navigator.pop(context);
        Navigator.push(context, MaterialPageRoute(builder: (context) => AuthHomePage()));
      } else {
        Fluttertoast.showToast(msg: 'Failed to Login : Firebase User return null', toastLength: Toast.LENGTH_LONG);
      }
    } on FirebaseAuthException catch(e){
      Fluttertoast.showToast(msg: e.message.toString(), toastLength: Toast.LENGTH_LONG);
    } catch(e){
      Fluttertoast.showToast(msg: e.toString(), toastLength: Toast.LENGTH_LONG);
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
    _etEmail.dispose();
    _etPassword.dispose();
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
              Text('Sign In / Sign Up with Email / Password'),
              SizedBox(height: 20),
              Container(
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    controller: _etEmail,
                    style: TextStyle(color: _color1),
                    decoration: InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: _mainColor, width: 2.0)),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: _underlineColor),
                      ),
                      labelText: 'Email',
                      labelStyle: TextStyle(color: _color2),
                    ),
                  )
              ),
              Container(
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                  child: TextField(
                    obscureText: _obscureText,
                    controller: _etPassword,
                    style: TextStyle(color: _color1),
                    decoration: InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: _mainColor, width: 2.0)),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: _underlineColor),
                      ),
                      labelText: 'Password',
                      labelStyle: TextStyle(color: _color2),
                      suffixIcon: IconButton(
                          icon: Icon(_iconVisible, color: Colors.grey[400], size: 20),
                          onPressed: () {
                            _toggleObscureText();
                          }),
                    ),
                  )
              ),
              _globalWidget.createButton(
                  buttonName: 'Sign Up',
                  onPressed: (){
                    _signUp(email: _etEmail.text, password: _etPassword.text);
                  }
              ),
              SizedBox(height: 8),
              _globalWidget.createButton(
                  buttonName: 'Sign In',
                  onPressed: (){
                    _signIn(email: _etEmail.text, password: _etPassword.text);
                  }
              ),
            ],
          ),
        )
    );
  }
}
