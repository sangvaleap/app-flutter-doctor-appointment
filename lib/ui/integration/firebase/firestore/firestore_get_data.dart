/*
Don't Forget to do authentication first with firebase authentication so you can read, add, edit or delete the data
If you don't want to do authentication first, you can set the rules at firebase console here https://console.firebase.google.com/u/2/project/envato-project-f7a81/firestore/rules
*/

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class FirestoreGetDataPage extends StatefulWidget {
  @override
  _FirestoreGetDataPageState createState() => _FirestoreGetDataPageState();
}

class _FirestoreGetDataPageState extends State<FirestoreGetDataPage> {
  // initialize global widget and global function
  final _globalWidget = GlobalWidget();

  Color _underlineColor = Color(0xFFCCCCCC);
  Color _mainColor = Colors.blue;
  Color _color1 = Color(0xFF515151);
  Color _color2 = Color(0xff777777);

  bool _isClicked = false;

  TextEditingController _etId = TextEditingController();
  String? _productId, _productName, _productPrice;

  CollectionReference _productCollections = FirebaseFirestore.instance.collection('products');

  Future<void> _getProduct(String id) async {
    if(id.isEmpty){
      Fluttertoast.showToast(msg: 'ID cannot be empty', toastLength: Toast.LENGTH_LONG);
    } else {
      await _productCollections.doc(id).get().then((DocumentSnapshot data){
        if(data.exists){
          setState(() {
            _productId = id;
            _productName = data['product_name'];
            _productPrice = data['product_price'].toString();
            _isClicked = true;
          });
        } else {
          Fluttertoast.showToast(msg: 'Data not found', toastLength: Toast.LENGTH_LONG);
        }
      }).catchError((e){
        Fluttertoast.showToast(msg: e.message.toString(), toastLength: Toast.LENGTH_LONG);
      });
    }
  }

  @override
  void initState() {
    _etId.text = 'd0bd7110-a341-11eb-8694-3b63312287ee';
    super.initState();
  }

  @override
  void dispose() {
    _etId.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: _globalWidget.globalAppBar(),
        body: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(24, 24, 24, 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: _globalWidget.createDetailWidget(
                    title: 'Get Data by ID',
                    desc: 'This is the example of Get Data from Firestore by ID.\n'
                        'Use this ID for example : d0bd7110-a341-11eb-8694-3b63312287ee'
                ),
              ),
              TextFormField(
                controller: _etId,
                keyboardType: TextInputType.text,
                style: TextStyle(color: _color1),
                decoration: InputDecoration(
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: _mainColor, width: 2.0)),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: _underlineColor),
                  ),
                  labelText: 'ID',
                  labelStyle: TextStyle(color: _color2),
                ),
              ),
              SizedBox(height: 40),
              _isClicked==false ? _globalWidget.createButton(
                  buttonName: 'Get Data',
                  onPressed: (){
                    _getProduct(_etId.text);
                  }
              ) : SizedBox.shrink(),
              (_productName)!=null
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 20),
                        Text('Product ID : '),
                        Text((_productId!=null)?_productId!:'null'),
                        SizedBox(height: 15),
                        Text('Product Name : '),
                        Text((_productName!=null)?_productName!:'null'),
                        SizedBox(height: 15),
                        Text('Product Price : '),
                        Text((_productPrice!=null)?_productPrice!:'null'),
                      ],
                    )
                  : SizedBox.shrink()
            ],
          ),
        )
    );
  }
}
