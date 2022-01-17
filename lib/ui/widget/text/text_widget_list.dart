import 'package:doctor_app/config/constant.dart';
import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:doctor_app/ui/widget/text/alignment_text.dart';
import 'package:doctor_app/ui/widget/text/bold_text.dart';
import 'package:doctor_app/ui/widget/text/coloring_text.dart';
import 'package:doctor_app/ui/widget/text/decoration_text.dart';
import 'package:doctor_app/ui/widget/text/font_family_text.dart';
import 'package:doctor_app/ui/widget/text/italic_text.dart';
import 'package:doctor_app/ui/widget/text/letter_spacing_text.dart';
import 'package:doctor_app/ui/widget/text/maxlines_overflow_text.dart';
import 'package:doctor_app/ui/widget/text/rich_text.dart';
import 'package:doctor_app/ui/widget/text/selectable_text.dart';
import 'package:doctor_app/ui/widget/text/shadow_text.dart';
import 'package:doctor_app/ui/widget/text/size_text.dart';
import 'package:doctor_app/ui/widget/text/word_spacing_text.dart';
import 'package:doctor_app/ui/widget/text/standart_text.dart';
import 'package:flutter/material.dart';

class TextWidgetListPage extends StatefulWidget {
  @override
  _TextWidgetListPageState createState() => _TextWidgetListPageState();
}

class _TextWidgetListPageState extends State<TextWidgetListPage> {
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
            Container(
              child: Text('Text Widget', style: TextStyle(
                  fontSize: 18, color: BLACK21, fontWeight: FontWeight.w500
              )),
            ),
            Container(
              margin: EdgeInsets.only(top: 24),
              child: Row(
                children: [
                  Flexible(
                      flex:5,
                      child: Container(
                        child: Text('Text Widget is one of the main widget in Flutter.', style: TextStyle(
                            fontSize: 15, color: BLACK77,letterSpacing: 0.5
                        )),
                      )
                  ),
                  Flexible(
                      flex: 2,
                      child: Container(
                          alignment: Alignment.center,
                          child: Icon(Icons.text_format, size: 50, color: SOFT_BLUE))
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 48),
              child: Text('List', style: TextStyle(
                  fontSize: 18, color: BLACK21, fontWeight: FontWeight.w500
              )),
            ),
            SizedBox(height: 18),
            _globalWidget.screenDetailList(context: context, title: 'Standart Text', page: StandartTextPage()),
            _globalWidget.screenDetailList(context: context, title: 'Size Text', page: SizeTextPage()),
            _globalWidget.screenDetailList(context: context, title: 'Bold Text', page: BoldTextPage()),
            _globalWidget.screenDetailList(context: context, title: 'Italic Text', page: ItalicTextPage()),
            _globalWidget.screenDetailList(context: context, title: 'Decoration Text', page: DecorationTextPage()),
            _globalWidget.screenDetailList(context: context, title: 'Alignment Text', page: AlignmentTextPage()),
            _globalWidget.screenDetailList(context: context, title: 'Font Family Text', page: FontFamilyTextPage()),
            _globalWidget.screenDetailList(context: context, title: 'Maxlines & Overflow Text', page: MaxlinesOverflowTextPage()),
            _globalWidget.screenDetailList(context: context, title: 'Letter Spacing Text', page: LetterSpacingTextPage()),
            _globalWidget.screenDetailList(context: context, title: 'Word Spacing Text', page: WordSpacingTextPage()),
            _globalWidget.screenDetailList(context: context, title: 'Coloring Text', page: ColoringTextPage()),
            _globalWidget.screenDetailList(context: context, title: 'Shadow Text', page: ShadowTextPage()),
            _globalWidget.screenDetailList(context: context, title: 'Rich Text', page: RichTextPage()),
            _globalWidget.screenDetailList(context: context, title: 'Selectable Text and Selectable Rich Text', page: SelectableTextPage()),
          ],
        )
    );
  }
}
