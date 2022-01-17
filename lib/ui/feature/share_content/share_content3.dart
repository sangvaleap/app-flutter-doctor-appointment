/*
https://pub.dev/packages/share_plus
*/
import 'dart:io';

import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:universal_io/io.dart' as IO;
import 'package:share_plus/share_plus.dart';

class ShareContent3Page extends StatefulWidget {
  @override
  _ShareContent3PageState createState() => _ShareContent3PageState();
}

class _ShareContent3PageState extends State<ShareContent3Page> {
  // initialize global widget
  final _globalWidget = GlobalWidget();

  Color _color1 = Color(0xff777777);

  File? _image;
  final _picker = ImagePicker();

  dynamic _selectedFile;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    if(!kIsWeb){
      if (_selectedFile != null && _selectedFile!.existsSync()) {
        _selectedFile!.deleteSync();
      }
    }
    _selectedFile = null;
    super.dispose();
  }

  Future requestPermission(Permission permission) async {
    final result = await permission.request();
    return result;
  }

  void _askPermissionCamera() {
    requestPermission(Permission.camera).then(_onStatusRequestedCamera);
  }

  void _askPermissionStorage() {
    requestPermission(Permission.storage).then(_onStatusRequested);
  }

  void _askPermissionPhotos() {
    requestPermission(Permission.photos).then(_onStatusRequested);
  }

  void _onStatusRequested(status) {
    if (status != PermissionStatus.granted) {
      if (IO.Platform.isIOS) {
        openAppSettings();
      } else {
        if(status == PermissionStatus.permanentlyDenied){
          openAppSettings();
        }
      }
    } else {
      _getImage(ImageSource.gallery);
    }
  }

  void _onStatusRequestedCamera(status) {
    if (status != PermissionStatus.granted) {
      if (IO.Platform.isIOS) {
        openAppSettings();
      } else {
        if(status == PermissionStatus.permanentlyDenied){
          openAppSettings();
        }
      }
    } else {
      _getImage(ImageSource.camera);
    }
  }

  void _getImage(ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source, maxWidth: 640, imageQuality: 100);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      }
    });

    if(_image != null){
      this.setState((){
        if(!kIsWeb){
          if(_selectedFile!=null && _selectedFile!.existsSync()){
            _selectedFile!.deleteSync();
          }
        }
        if(kIsWeb){
          _selectedFile = pickedFile;
        } else {
          _selectedFile = _image;
        }

        _image = null;
      });
    }
  }

  Widget _getImageWidget() {
    if (_selectedFile != null) {
      return (kIsWeb)
          ? Image.network(
        _selectedFile!.path,
        width: (kIsWeb) ? 640 : MediaQuery.of(context).size.width-16,
        fit: BoxFit.fill,
      ) : Image.file(
        _selectedFile!,
        width: (kIsWeb) ? 640 : MediaQuery.of(context).size.width-16,
        fit: BoxFit.fill,
      );
    } else {
      return Image.asset(
        'assets/images/placeholder.jpg',
        width: (kIsWeb) ? 250 : MediaQuery.of(context).size.width-16,
        fit: BoxFit.fill,
      );
    }
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
                  title: 'Share Content 3 (Image Only)',
                  desc: 'This is the example of share image only'
              ),
            ),
            Stack(
              children: <Widget>[
                SingleChildScrollView(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    children: <Widget>[
                      _getImageWidget(),
                      SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          (!kIsWeb)
                              ? GestureDetector(
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Icon(
                                  Icons.camera_alt,
                                  color: _color1,
                                  size: 40,
                                ),
                                SizedBox(width: 10),
                                Text('Camera'),
                              ],
                            ),
                            onTap: () {
                              _askPermissionCamera();
                            },
                          ) : SizedBox.shrink(),
                          Container(
                            width: (!kIsWeb) ? 20 : 0,
                          ),
                          GestureDetector(
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Icon(
                                  Icons.photo,
                                  color: _color1,
                                  size: 40,
                                ),
                                SizedBox(width: 10),
                                Text('Gallery'),
                              ],
                            ),
                            onTap: () {
                              if(kIsWeb){
                                _getImage(ImageSource.gallery);
                              } else {
                                if (IO.Platform.isIOS) {
                                  _askPermissionPhotos();
                                } else {
                                  _askPermissionStorage();
                                }
                              }
                            },
                          ),
                        ],
                      ),
                      _selectedFile != null
                          ? Container(
                            margin: EdgeInsets.only(top: 20),
                            child: _globalWidget.createButton(
                                buttonName: 'Share',
                                onPressed: (){
                                  if(kIsWeb){
                                    Fluttertoast.showToast(msg: 'share files has not been implemented on Web', toastLength: Toast.LENGTH_SHORT);
                                  } else {
                                    Share.shareFiles([_selectedFile.path]);
                                  }
                                }
                            ),
                          ) : SizedBox.shrink()
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
