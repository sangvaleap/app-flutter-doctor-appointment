/*
install plugin in pubspec.yaml
flutter_localizations:
    sdk: flutter

create initial_language.dart for first default language
create app_localizations.dart

define all text language at assets/lang/

Don't forget to add all country images used in this pages at the pubspec.yaml
Don't forget to add all json language used in this pages at the pubspec.yaml
 */

import 'package:doctor_app/cubit/language/language_cubit.dart';
import 'package:doctor_app/ui/feature/multi_language/app_localizations.dart';
import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MultiLanguagePage extends StatefulWidget {
  @override
  _MultiLanguagePageState createState() => _MultiLanguagePageState();
}

class _MultiLanguagePageState extends State<MultiLanguagePage> {
  // initialize global widget
  final _globalWidget = GlobalWidget();

  Color _color1 = Color(0xff777777);
  Color _color2 = Color(0xff01aed6);

  String defaultLang = 'en';

  List<String> _localeList = ['en', 'id', 'ar', 'zh', 'hi', 'th'];
  List<String> _countryList = ['US', 'ID', 'DZ', 'HK', 'IN', 'TH'];
  List<String> _languageList = [
    'English',
    'Indonesia',
    'Arabic',
    'Chinese',
    'Hindi',
    'Thai'
  ];

  late LanguageCubit _languageCubit;

  @override
  void initState() {
    _languageCubit = BlocProvider.of<LanguageCubit>(context);
    _getLocale().then((String? val) {
      setState(() {
        defaultLang = val!;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<String?> _getLocale() async {
    final SharedPreferences _pref = await SharedPreferences.getInstance();
    String? lCode = _pref.getString('lCode');
    return lCode;
  }

  void changeLocale(Locale locale) async {
    final SharedPreferences _pref = await SharedPreferences.getInstance();
    await _pref.setString('lCode', locale.languageCode);
    await _pref.setString('cCode', locale.countryCode!);
    _languageCubit.changeLanguage(locale);
    defaultLang = locale.languageCode;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: _globalWidget.globalAppBar(),
        body: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          padding: EdgeInsets.fromLTRB(24, 24, 24, 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _globalWidget.createDetailWidget(
                  title: 'Multi Language',
                  desc: 'This is the example of multi language'
              ),
              Container(
                padding: EdgeInsets.all(16),
                child: Text(AppLocalizations.of(context)!.translate('text_description')!, style: TextStyle(
                  fontSize: 18
                ))
              ),
              ListView(
                shrinkWrap: true,
                primary: false,
                padding: EdgeInsets.fromLTRB(16, 0, 16, 16),
                children: List.generate(_localeList.length, (index) {
                  return Card(
                    margin: EdgeInsets.only(top: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    elevation: 2,
                    color: Colors.white,
                    child: GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: () {
                        _showPopupChangeLanguage(index);
                      },
                      child: Container(
                        padding: EdgeInsets.all(16),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                                width: MediaQuery.of(context).size.width / 6,
                                child: Image.asset('assets/images/lang/' + _localeList[index] + '.png')),
                            Expanded(
                              child: Container(
                                  padding: EdgeInsets.all(16),
                                  child: Text(_languageList[index], style: TextStyle(fontSize: 14))),
                            ),
                            (defaultLang == _localeList[index])
                                ? Container(child: _globalWidget.createDefaultLabel(context))
                                : Wrap(),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ],
          ),
        )
    );
  }

  void _showPopupChangeLanguage(index) {
    // set up the buttons
    Widget cancelButton = TextButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: Text('No', style: TextStyle(color: _color2))
    );
    Widget continueButton = TextButton(
        onPressed: () {
          Navigator.pop(context);
          changeLocale(Locale(_localeList[index], _countryList[index]));
        },
        child: Text('Yes', style: TextStyle(color: _color2))
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      title: Text('Change Language', style: TextStyle(fontSize: 18),),
      content: Text('Are you sure want to change language ?', style: TextStyle(fontSize: 13, color: _color1)),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
