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
import 'package:universal_io/io.dart' as IO;

import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:photofilters/photofilters.dart';
import 'package:path/path.dart' as Path;
import 'package:image/image.dart' as imageLib;

class PickPhotoPage extends StatefulWidget {
  @override
  _PickPhotoPageState createState() => _PickPhotoPageState();
}

class _PickPhotoPageState extends State<PickPhotoPage> {
  // initialize global widget
  final _globalWidget = GlobalWidget();

  Color _color1 = Color(0xFF0181cc);
  Color _color2 = Color(0xff777777);

  File? _image;
  final _picker = ImagePicker();

  File? _selectedFile;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    if (_selectedFile != null && _selectedFile!.existsSync()) {
      _selectedFile!.deleteSync();
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
        if(_selectedFile!=null && _selectedFile!.existsSync()){
          _selectedFile!.deleteSync();
        }
        _selectedFile = _image;

        _image = null;
      });
    }
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
                  _getImageWidget(),
                  SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      GestureDetector(
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
                      ),
                      Container(
                        width: 20,
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
                          if (IO.Platform.isIOS) {
                            _askPermissionPhotos();
                          } else {
                            _askPermissionStorage();
                          }
                        },
                      ),
                    ],
                  ),
                  _buttonFilter()
                ],
              ),
            ),
          ],
        )
    );
  }

  Widget _getImageWidget() {
    if (_selectedFile != null) {
      return Image.file(
        _selectedFile!,
        width: MediaQuery.of(context).size.width-16,
        fit: BoxFit.fill,
      );
    } else {
      return Image.asset(
        'assets/images/placeholder.jpg',
        width: MediaQuery.of(context).size.width-16,
        fit: BoxFit.fill,
      );
    }
  }

  Future doFilter(context) async {
    if (_selectedFile != null && _selectedFile!.existsSync()) {
      String fileName = Path.basename(_selectedFile!.path);
      var image = imageLib.decodeImage(await _selectedFile!.readAsBytes());
      image = imageLib.copyResize(image!, width: 600);
      // go to filter
      var imagefile = await Navigator.push(
        context,
        new MaterialPageRoute(
          builder: (context) => new PhotoFilterSelector(
            title: Text("Photo Filter Example"),
            image: image!,
            filters: presetFiltersList,
            filename: fileName,
            loader: Center(child: CircularProgressIndicator()),
            fit: BoxFit.contain,
          ),
        ),
      );

      if (imagefile != null && imagefile.containsKey('image_filtered')) {
        setState(() {
          _selectedFile = imagefile['image_filtered'];
        });
      }
    } else {
      Fluttertoast.showToast(
          backgroundColor: Colors.red,
          textColor: Colors.white,
          msg: 'File not found',
          fontSize: 13,
          toastLength: Toast.LENGTH_SHORT);
    }
  }

  Widget _buttonFilter() {
    if (_selectedFile != null) {
      return Container(
        margin: EdgeInsets.fromLTRB(0, 50, 0, 0),
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
              onPressed: () async {
                doFilter(context);
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                child: Text(
                  'Go to filter',
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
