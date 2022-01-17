/*
install plugin in pubspec.yaml
- image_picker => to pick image from storage or camera (https://pub.dev/packages/image_picker)
  add this to ios Info.plist
  <key>NSPhotoLibraryUsageDescription</key>
  <string>I need this permission to test upload photo</string>
  <key>NSCameraUsageDescription</key>
  <string>I need this permission to test upload photo</string>
  <key>NSMicrophoneUsageDescription</key>
  <string>I need this permission to test upload photo</string>

  When using package image_picker: ^0.8.0+4, we should add this permission at AndroidManifest
  android/app/src/debug/AndroidManifest.xml | android/app/src/main/AndroidManifest.xml | android/app/src/profile/AndroidManifest.xml
  <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>

- permission_handler => to handle permission such as storage, camera (https://pub.dev/packages/permission_handler)

we add some logic function so if the user press back or done with this pages, cache images will be deleted and not makes the storage full

Don't forget to add all images and sound used in this pages at the pubspec.yaml

*** IMPORTANT NOTES FOR IOS ***
Image Picker will crash if you pick image for a second times, this error only exist on iOS Simulator 14 globaly around the world but not error on the real device
If you want to use iOS Simulator, you need to downgrade and using iOS Simulator 13
Follow this step to downgrade :
1. Xcode > Preferences
2. Select the "Components" tab.
3. Download and select Simulator 13 after the download is finish
4. Press "Check and Install Now".
5. After that, use Simulator 13 instead of simulator 14
 */

import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:universal_io/io.dart' as IO;

import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:path/path.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:uuid/uuid.dart';

import 'package:doctor_app/config/constant.dart';

class FirebaseStoragePage extends StatefulWidget {
  @override
  _FirebaseStoragePageState createState() => _FirebaseStoragePageState();
}

class _FirebaseStoragePageState extends State<FirebaseStoragePage> {
  // initialize global widget
  final _globalWidget = GlobalWidget();

  final FirebaseStorage _storage = FirebaseStorage.instance;

  Color _color1 = Color(0xFF0181cc);
  Color _color2 = Color(0xff777777);

  File? _image;
  final _picker = ImagePicker();

  dynamic _selectedFile;
  String? _downloadURL;
  bool _isClicked = false;

  Uuid _uuid = Uuid();

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

  Future<void> _uploadToFirebaseStorage(dynamic _selectedFile) async {
    String tempName = basename(_selectedFile.toString());
    String fileName = '';

    if(kIsWeb){
      fileName = _uuid.v1()+'.jpg';
    } else {
      fileName = _uuid.v1()+extension(tempName);
    }

    Reference ref = _storage.ref().child(fileName);

    UploadTask task;
    if(kIsWeb){
      SettableMetadata metadata = SettableMetadata(
          contentType: 'image/jpeg',
          customMetadata: {'picked-file-path': _selectedFile.path});
      task = ref.putData(await _selectedFile.readAsBytes(), metadata);
    } else {
      task = ref.putFile(_selectedFile);
    }

    task.snapshotEvents.listen((TaskSnapshot snapshot) async {
      if (task.snapshot.state == TaskState.success) {
        _downloadURL = await snapshot.ref.getDownloadURL();
        setState(() {});
      }
    }, onError: (e) {
      Fluttertoast.showToast(msg: e.message.toString(), toastLength: Toast.LENGTH_LONG);
      _isClicked = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: _globalWidget.globalAppBar(),
        body: Stack(
          children: <Widget>[
            SingleChildScrollView(
              padding: EdgeInsets.all(20),
              child: Column(
                children: <Widget>[
                  Container(
                    child: RichText(
                      text: TextSpan(
                        // style is the default style for all rich text
                        // to change the specific text, you have to change it at textspan
                        style: TextStyle(
                          fontSize: 16, color: BLACK77, letterSpacing: 0.7,
                        ),
                        children: <TextSpan>[
                          TextSpan(text: 'Important Notes :\n', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red)),
                          TextSpan(text: 'You must do Firebase Authentication first to upload file.\n\n'),
                          TextSpan(text: 'Do Firebase Authentication at Integrations Section => Firebase => Firebase Authentications => Choose 1 of the method.'),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  _getImageWidget(context),
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
                              color: _color2,
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
                              color: _color2,
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
                  (_downloadURL==null)?_buttonSave():SizedBox.shrink(),
                  SizedBox(height: 20),
                  (_downloadURL!=null)?Text('Download URL :'):SizedBox.shrink(),
                  (_downloadURL!=null)
                      ? GestureDetector(
                          child: Text(_downloadURL!, style: TextStyle(decoration: TextDecoration.underline, color: Colors.blue)),
                          onTap: (){
                            _launchInBrowser(_downloadURL!);
                          },
                      )
                      : SizedBox.shrink(),
                  (_downloadURL!=null)?SizedBox(height: 20):SizedBox.shrink(),
                  (_downloadURL!=null)
                      ? TextButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.resolveWith<Color>(
                                  (Set<MaterialState> states) => _color1,
                            ),
                            overlayColor: MaterialStateProperty.all(Colors.transparent),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(3.0),
                                )
                            ),
                          ),
                          onPressed: () {
                            setState(() {
                              _image = _selectedFile = _downloadURL = null;
                              _isClicked = false;
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                            child: Text(
                              'Reset',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                              textAlign: TextAlign.center,
                            ),
                          )
                      )
                      : SizedBox.shrink(),
                ],
              ),
            ),
          ],
        )
    );
  }

  Future<void> _launchInBrowser(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: false,
        forceWebView: false,
        headers: <String, String>{'my_header_key': 'my_header_value'},
      );
    } else {
      throw 'Could not launch $url';
    }
  }

  Widget _getImageWidget(context) {
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

  Widget _buttonSave() {
    if (_selectedFile != null) {
      return Container(
        margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
        child: SizedBox(
          child: TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.resolveWith<Color>(
                      (Set<MaterialState> states) => _color1,
                ),
                overlayColor: MaterialStateProperty.all(Colors.transparent),
                shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(3.0),
                    )
                ),
              ),
              onPressed: () {
                if(_isClicked == false){
                  _isClicked = true;
                  if (_selectedFile != null) {
                    if((!kIsWeb)){
                      // if run on android or ios, should check the file exist or not
                      if(_selectedFile!.existsSync()){
                        _uploadToFirebaseStorage(_selectedFile!);
                      }
                    } else {
                      _uploadToFirebaseStorage(_selectedFile!);
                    }
                  } else {
                    Fluttertoast.showToast(
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                        msg: 'File not found',
                        fontSize: 13,
                        toastLength: Toast.LENGTH_SHORT);
                  }
                } else {
                  Fluttertoast.showToast(msg: 'Upload is in process', toastLength: Toast.LENGTH_LONG);
                }
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                child: Text(
                  'Save',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              )
          ),
        ),
      );
    } else {
      return Container();
    }
  }
}
