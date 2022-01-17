/*
Don't Forget to do authentication first with firebase authentication so you can read, add, edit or delete the data
If you don't want to do authentication first, you can set the rules at firebase console here https://console.firebase.google.com/u/2/project/envato-project-f7a81/firestore/rules
*/

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

class FirestoreEditDataWithSetPage extends StatefulWidget {
  @override
  _FirestoreEditDataWithSetPageState createState() => _FirestoreEditDataWithSetPageState();
}

class _FirestoreEditDataWithSetPageState extends State<FirestoreEditDataWithSetPage> {
  // initialize global widget and global function
  final _globalWidget = GlobalWidget();

  Color _underlineColor = Color(0xFFCCCCCC);
  Color _mainColor = Colors.blue;
  Color _color1 = Color(0xFF515151);
  Color _color2 = Color(0xff777777);

  bool _isClicked = false;

  String _productId = 'd0bd7110-a341-11eb-8694-3b63312287ee';
  TextEditingController _etProductName = TextEditingController();
  TextEditingController _etPrice = TextEditingController();

  CollectionReference _productCollections = FirebaseFirestore.instance.collection('products');

  Future<void> _getProduct(String id) async {
    if(id.isEmpty){
      Fluttertoast.showToast(msg: 'ID cannot be empty', toastLength: Toast.LENGTH_LONG);
    } else {
      await _productCollections.doc(id).get().then((DocumentSnapshot data){
        if(data.exists){
          _etProductName.text = data['product_name'];
          _etPrice.text = data['product_price'].toString();
        } else {
          Fluttertoast.showToast(msg: 'Data not found', toastLength: Toast.LENGTH_LONG);
        }
      }).catchError((e){
        Fluttertoast.showToast(msg: e.message.toString(), toastLength: Toast.LENGTH_LONG);
      });
    }
  }

  Future<void> _editProduct(String id, {required String productName, required String productPrice}) async {
    await _productCollections.doc(id).set({
      'product_name' : productName,
      'product_price' : (productPrice=='')?0:int.parse(productPrice)
    }).then((value){
      Fluttertoast.showToast(msg: 'Product Edited Successfully', toastLength: Toast.LENGTH_LONG);
      Navigator.pop(context);
    }).catchError((e){
      Fluttertoast.showToast(msg: e.message.toString(), toastLength: Toast.LENGTH_LONG);
    });
  }

  @override
  void initState() {
    _getProduct(_productId);
    super.initState();
  }

  @override
  void dispose() {
    _etProductName.dispose();
    _etPrice.dispose();
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
                    title: 'Edit Data',
                    desc: 'With set query, you can manipulate the entire document field. To replace the entire field with new field, use merge : false'
                ),
              ),
              Text('product ID : '+_productId),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: _etProductName,
                keyboardType: TextInputType.text,
                style: TextStyle(color: _color1),
                decoration: InputDecoration(
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: _mainColor, width: 2.0)),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: _underlineColor),
                  ),
                  labelText: 'Product Name',
                  labelStyle: TextStyle(color: _color2),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: _etPrice,
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                style: TextStyle(color: _color1),
                decoration: InputDecoration(
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: _mainColor, width: 2.0)),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: _underlineColor),
                  ),
                  labelText: 'Price',
                  labelStyle: TextStyle(color: _color2),
                ),
              ),
              SizedBox(height: 40),
              _globalWidget.createButton(
                  buttonName: 'Edit Product',
                  onPressed: (){
                    if(_isClicked == false){
                      _isClicked = true;
                      _editProduct(_productId, productName: _etProductName.text, productPrice: _etPrice.text);
                    } else {
                      Fluttertoast.showToast(msg: 'Edit data is in process', toastLength: Toast.LENGTH_LONG);
                    }
                  }
              ),
            ],
          ),
        )
    );
  }
}
