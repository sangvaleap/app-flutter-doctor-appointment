/*
https://pub.dev/packages/path_provider
*/
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:universal_io/io.dart' as IO;
import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';

class StorageLocationInformationPage extends StatefulWidget {
  @override
  _StorageLocationInformationPageState createState() => _StorageLocationInformationPageState();
}

class _StorageLocationInformationPageState extends State<StorageLocationInformationPage> {
  // initialize global widget
  final _globalWidget = GlobalWidget();

  Future<Directory?>? _tempDirectory;
  Future<Directory?>? _appSupportDirectory;
  Future<Directory?>? _appLibraryDirectory;
  Future<Directory?>? _appDocumentsDirectory;
  Future<Directory?>? _externalDocumentsDirectory;
  Future<List<Directory>?>? _externalStorageDirectories;
  Future<List<Directory>?>? _externalCacheDirectories;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _requestTempDirectory() {
    setState(() {
      _tempDirectory = getTemporaryDirectory();
    });
  }

  void _requestAppDocumentsDirectory() {
    setState(() {
      _appDocumentsDirectory = getApplicationDocumentsDirectory();
    });
  }

  void _requestAppSupportDirectory() {
    setState(() {
      _appSupportDirectory = getApplicationSupportDirectory();
    });
  }

  void _requestAppLibraryDirectory() {
    setState(() {
      _appLibraryDirectory = getLibraryDirectory();
    });
  }

  void _requestExternalStorageDirectory() {
    setState(() {
      _externalDocumentsDirectory = getExternalStorageDirectory();
    });
  }

  void _requestExternalStorageDirectories(StorageDirectory type) {
    setState(() {
      _externalStorageDirectories = getExternalStorageDirectories(type: type);
    });
  }

  void _requestExternalCacheDirectories() {
    setState(() {
      _externalCacheDirectories = getExternalCacheDirectories();
    });
  }

  Widget _buildDirectory(BuildContext context, AsyncSnapshot<Directory?> snapshot) {
    String text = '';
    if (snapshot.connectionState == ConnectionState.done) {
      if (snapshot.hasError) {
        text = 'Error: ${snapshot.error}';
      } else if (snapshot.hasData) {
        text = 'path: ${snapshot.data!.path}';
      } else {
        text = 'path unavailable';
      }
    }
    return Container(
      margin: EdgeInsets.only(bottom: 8),
      child: Text(text),
    );
  }

  Widget _buildDirectories(BuildContext context, AsyncSnapshot<List<Directory>?> snapshot) {
    String text = '';
    if (snapshot.connectionState == ConnectionState.done) {
      if (snapshot.hasError) {
        text = 'Error: ${snapshot.error}';
      } else if (snapshot.hasData) {
        final String combined =
        snapshot.data!.map((Directory d) => d.path).join(', ');
        text = 'paths: $combined';
      } else {
        text = 'path unavailable';
      }
    }
    return Container(
      margin: EdgeInsets.only(bottom: 8),
      child: Text(text),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: _globalWidget.globalAppBar(),
        body: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(24, 24, 24, 16),
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _globalWidget.createDetailWidget(
                    title: 'Storage Location Information',
                    desc: 'This is the example of Storage Location Information'
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 8),
                  child: _globalWidget.createButton(
                      buttonName: 'Get Temporary Directory',
                      onPressed: (){
                        _requestTempDirectory();
                      }
                  ),
                ),
                FutureBuilder<Directory?>(future: _tempDirectory, builder: _buildDirectory),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 8),
                  child: _globalWidget.createButton(
                      buttonName: 'Get Application Documents Directory',
                      onPressed: (){
                        _requestAppDocumentsDirectory();
                      }
                  ),
                ),
                FutureBuilder<Directory?>(future: _appDocumentsDirectory, builder: _buildDirectory),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 8),
                  child: _globalWidget.createButton(
                      buttonName: 'Get Application Support Directory',
                      onPressed: (){
                        _requestAppSupportDirectory();
                      }
                  ),
                ),
                FutureBuilder<Directory?>(future: _appSupportDirectory, builder: _buildDirectory),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 8),
                  child: _globalWidget.createButton(
                      buttonName: 'Get Application Library Directory',
                      onPressed: (){
                        _requestAppLibraryDirectory();
                      }
                  ),
                ),
                FutureBuilder<Directory?>(future: _appLibraryDirectory, builder: _buildDirectory),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 8),
                  child: _globalWidget.createButton(
                      buttonName: IO.Platform.isIOS
                          ? 'External documents directory are unavailable on iOS'
                          : 'Get External Documents Directory',
                      onPressed: (){
                        if(!IO.Platform.isIOS){
                          _requestExternalStorageDirectory();
                        }
                      }
                  ),
                ),
                FutureBuilder<Directory?>(future: _externalDocumentsDirectory, builder: _buildDirectory),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 8),
                  child: _globalWidget.createButton(
                      buttonName: IO.Platform.isIOS
                          ? 'External storage directories are unavailable on iOS'
                          : 'Get External Storage Directories',
                      onPressed: (){
                        if(!IO.Platform.isIOS){
                          _requestExternalStorageDirectories(
                            StorageDirectory.music,
                          );
                        }
                      }
                  ),
                ),
                FutureBuilder<List<Directory>?>(future: _externalStorageDirectories, builder: _buildDirectories),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 8),
                  child: _globalWidget.createButton(
                      buttonName: IO.Platform.isIOS
                          ? 'External cache directories are unavailable on iOS'
                          : 'Get External Cache Directories',
                      onPressed: (){
                        if(!IO.Platform.isIOS){
                          _requestExternalCacheDirectories();
                        }
                      }
                  ),
                ),
                FutureBuilder<List<Directory>?>(future: _externalCacheDirectories, builder: _buildDirectories),
              ],
            ),
          ),
        )
    );
  }
}
