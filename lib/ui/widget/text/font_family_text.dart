/*
This is font family page

To used custom font family from assets, please write this on the pubspec.yaml
fonts:
    - family: Audiowide-Regular
      fonts:
        - asset: assets/google_fonts/Audiowide-Regular.ttf

If you used font from google font, please add below code in the main.dart
LicenseRegistry.addLicense(() async* {
  final license = await rootBundle.loadString('assets/google_fonts/OFL.txt');
  yield LicenseEntryWithLineBreaks(['assets/google_fonts'], license);
});
 */

import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FontFamilyTextPage extends StatefulWidget {
  @override
  _FontFamilyTextPageState createState() => _FontFamilyTextPageState();
}

class _FontFamilyTextPageState extends State<FontFamilyTextPage> {
  // initialize global widget
  final _globalWidget = GlobalWidget();

  @override
  void initState() {
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
        body: ListView(
          padding: EdgeInsets.fromLTRB(24, 24, 24, 16),
          children: [
            _globalWidget.createDetailWidget(
                title: 'Font Family Text',
                desc: 'This is the example of text with font family and use different method (local font, local google font, google font from package)'
            ),
            // render google fonts from local assets
            Container(
              margin: EdgeInsets.symmetric(vertical: 8),
              child: Text('lorem ipsum dolor sit amet', style: TextStyle(
                fontSize: 16,
                fontFamily: 'Audiowide',
              )),
            ),
            // render fonts from local assets
            Container(
              margin: EdgeInsets.symmetric(vertical: 8),
              child: Text('lorem ipsum dolor sit amet', style: TextStyle(
                fontSize: 16,
                fontFamily: 'Bariol',
              )),
            ),
            // render fonts from local assets
            Container(
              margin: EdgeInsets.symmetric(vertical: 8),
              child: Text('lorem ipsum dolor sit amet', style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'Bariol',
                  fontWeight: FontWeight.w100
              )),
            ),
            // render fonts from local assets
            Container(
              margin: EdgeInsets.symmetric(vertical: 8),
              child: Text('lorem ipsum dolor sit amet', style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'Bariol',
                  fontWeight: FontWeight.w100,
                  fontStyle: FontStyle.italic,
              )),
            ),
            // render fonts from local assets
            Container(
              margin: EdgeInsets.symmetric(vertical: 8),
              child: Text('lorem ipsum dolor sit amet', style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'Bariol',
                  fontWeight: FontWeight.w300
              )),
            ),
            // render fonts from local assets
            Container(
              margin: EdgeInsets.symmetric(vertical: 8),
              child: Text('lorem ipsum dolor sit amet', style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'Bariol',
                  fontWeight: FontWeight.w300,
                fontStyle: FontStyle.italic,
              )),
            ),
            // render fonts from local assets
            Container(
              margin: EdgeInsets.symmetric(vertical: 8),
              child: Text('lorem ipsum dolor sit amet', style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'Bariol',
                  fontWeight: FontWeight.w700
              )),
            ),
            // render from package google font
            Container(
              margin: EdgeInsets.symmetric(vertical: 8),
              child: Text('lorem ipsum dolor sit amet', style: GoogleFonts.lato(
                fontSize: 16,
              )),
            ),
          ],
        )
    );
  }
}
