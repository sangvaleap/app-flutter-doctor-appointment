import 'package:doctor_app/ui/cupertino_widget/cupertino_action_sheet/cupertino_action_sheet.dart';
import 'package:doctor_app/ui/cupertino_widget/cupertino_activity_indicator/cupertino_activity_indicator.dart';
import 'package:doctor_app/ui/cupertino_widget/cupertino_alert_dialog/cupertino_alert_dialog.dart';
import 'package:doctor_app/ui/cupertino_widget/cupertino_button/cupertino_button.dart';
import 'package:doctor_app/ui/cupertino_widget/cupertino_context_menu/cupertino_context_menu_list.dart';
import 'package:doctor_app/ui/cupertino_widget/cupertino_date_picker/cupertino_date_picker_list.dart';
import 'package:doctor_app/ui/cupertino_widget/cupertino_date_time_picker/dart/cupertino_date_time_picker_list.dart';
import 'package:doctor_app/ui/cupertino_widget/cupertino_dialog_action/cupertino_dialog_action.dart';
import 'package:doctor_app/ui/cupertino_widget/cupertino_fullscreen_dialog_transition/cupertino_fullscreen_dialog_transition1.dart';
import 'package:doctor_app/ui/cupertino_widget/cupertino_navigation_bar/cupertino_navigation_bar_list.dart';
import 'package:doctor_app/ui/cupertino_widget/cupertino_page_routes/cupertino_page_routes1.dart';
import 'package:doctor_app/ui/cupertino_widget/cupertino_page_scaffold/cupertino_page_scaffold.dart';
import 'package:doctor_app/ui/cupertino_widget/cupertino_picker/cupertino_picker_list.dart';
import 'package:doctor_app/ui/cupertino_widget/cupertino_popup_surface/cupertino_popup_surface.dart';
import 'package:doctor_app/ui/cupertino_widget/cupertino_scrollbar/cupertino_scrollbar_list.dart';
import 'package:doctor_app/ui/cupertino_widget/cupertino_search_text_field/cupertino_search_text_field_list.dart';
import 'package:doctor_app/ui/cupertino_widget/cupertino_segmented_control/cupertino_segmented_control_list.dart';
import 'package:doctor_app/ui/cupertino_widget/cupertino_slider/cupertino_slider_list.dart';
import 'package:doctor_app/ui/cupertino_widget/cupertino_sliding_segmented_control/cupertino_sliding_segmented_control_list.dart';
import 'package:doctor_app/ui/cupertino_widget/cupertino_sliver_navigation_bar/cupertino_sliver_navigation_bar.dart';
import 'package:doctor_app/ui/cupertino_widget/cupertino_switch/cupertino_switch_list.dart';
import 'package:doctor_app/ui/cupertino_widget/cupertino_tab_bar/cupertino_tab_bar_list.dart';
import 'package:doctor_app/ui/cupertino_widget/cupertino_textfield/cupertino_textfield_list.dart';
import 'package:doctor_app/ui/cupertino_widget/cupertino_time_picker/cupertino_time_picker_list.dart';
import 'package:doctor_app/ui/cupertino_widget/cupertino_timer_picker/cupertino_timer_picker_list.dart';
import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CupertinoWidgetTabPage extends StatefulWidget {
  @override
  _CupertinoWidgetTabPageState createState() => _CupertinoWidgetTabPageState();
}

class _CupertinoWidgetTabPageState extends State<CupertinoWidgetTabPage> {
  // initialize global widget
  final _globalWidget = GlobalWidget();

  int number = 1;

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
    return Tab(
      child: ListView(
        padding: EdgeInsets.fromLTRB(24, 16, 24, 16),
        children: [
          _globalWidget.screenTabList(
              context: context,
              id: number++,
              icon: Icons.open_in_browser,
              title: 'Cupertino Action Sheet',
              desc: 'An iOS-style modal bottom action sheet',
              page: CupertinoActionSheetPage()
          ),
          _globalWidget.screenTabList(
              context: context,
              id: number++,
              icon: Icons.refresh,
              title: 'Cupertino Activity Indicator',
              desc: 'An iOS-style activity indicator',
              page: CupertinoActivityIndicatorPage()
          ),
          _globalWidget.screenTabList(
              context: context,
              id: number++,
              icon: Icons.event,
              title: 'Cupertino Alert Dialog',
              desc: 'An iOS-style alert dialog',
              page: CupertinoAlertDialogPage()
          ),
          _globalWidget.screenTabList(
              context: context,
              id: number++,
              icon: Icons.smart_button,
              title: 'Cupertino Button',
              desc: 'An iOS-style button',
              page: CupertinoButtonPage()
          ),
          _globalWidget.screenTabList(
              context: context,
              id: number++,
              icon: Icons.menu,
              title: 'Cupertino Context Menu',
              desc: 'An iOS-style full-screen modal route',
              page: CupertinoContextMenuListPage()
          ),
          _globalWidget.screenTabList(
              context: context,
              id: number++,
              icon: Icons.date_range,
              title: 'Cupertino Date Picker',
              desc: 'An iOS-style date picker',
              page: CupertinoDatePickerListPage()
          ),
          _globalWidget.screenTabList(
              context: context,
              id: number++,
              icon: Icons.date_range,
              title: 'Cupertino Date & Time Picker',
              desc: 'An iOS-style date & time picker',
              page: CupertinoDateTimePickerListPage()
          ),
          _globalWidget.screenTabList(
              context: context,
              id: number++,
              icon: Icons.filter_list_outlined,
              title: 'Cupertino Picker',
              desc: 'An iOS-style picker control',
              page: CupertinoPickerListPage()
          ),
          _globalWidget.screenTabList(
              context: context,
              id: number++,
              icon: Icons.access_time,
              title: 'Cupertino Time Picker',
              desc: 'An iOS-style time picker',
              page: CupertinoTimePickerListPage()
          ),
          _globalWidget.screenTabList(
              context: context,
              id: number++,
              icon: Icons.access_time,
              title: 'Cupertino Timer Picker',
              desc: 'An iOS-style countdown timer picker',
              page: CupertinoTimerPickerListPage()
          ),
          _globalWidget.screenTabList(
              context: context,
              id: number++,
              icon: Icons.call_to_action,
              title: 'Cupertino Dialog Action',
              desc: 'A button typically used in a CupertinoAlertDialog',
              page: CupertinoDialogActionPage()
          ),
          _globalWidget.screenTabList(
              context: context,
              id: number++,
              icon: Icons.event,
              title: 'Cupertino Fullscreen Dialog Transition',
              desc: 'An iOS-style transition used for summoning fullscreen dialogs',
              page: CupertinoFullscreenDialogTransition1Page()
          ),
          _globalWidget.screenTabList(
              context: context,
              id: number++,
              icon: Icons.menu,
              title: 'Cupertino Navigation Bar',
              desc: 'An iOS-style top navigation bar',
              page: CupertinoNavigationBarListPage()
          ),
          _globalWidget.screenTabList(
              context: context,
              id: number++,
              icon: Icons.keyboard_tab,
              title: 'Cupertino Page Routes',
              desc: 'An iOS-style page routes',
              page: CupertinoPageRoutes1Page()
          ),
          _globalWidget.screenTabList(
              context: context,
              id: number++,
              icon: Icons.pages,
              title: 'Cupertino Page Scaffold',
              desc: 'Basic iOS style page layout structure',
              page: CupertinoPageScaffoldPage()
          ),
          _globalWidget.screenTabList(
              context: context,
              id: number++,
              icon: Icons.call_to_action,
              title: 'Cupertino Popup Surface',
              desc: 'Rounded rectangle surface that looks like an iOS popup surface',
              page: CupertinoPopupSurfacePage()
          ),
          _globalWidget.screenTabList(
              context: context,
              id: number++,
              icon: Icons.south,
              title: 'Cupertino Scrollbar',
              desc: 'An iOS-style scrollbar that indicates which portion of a scrollable widget is currently visible',
              page: CupertinoScrollbarListPage()
          ),
          _globalWidget.screenTabList(
              context: context,
              id: number++,
              icon: Icons.search,
              title: 'Cupertino Search Text Field',
              desc: 'An iOS-style search field',
              page: CupertinoSearchTextFieldListPage()
          ),
          _globalWidget.screenTabList(
              context: context,
              id: number++,
              icon: Icons.view_column,
              title: 'Cupertino Segmented Control',
              desc: 'An iOS-style segmented control',
              page: CupertinoSegmentedControlListPage()
          ),
          _globalWidget.screenTabList(
              context: context,
              id: number++,
              icon: Icons.view_column,
              title: 'Cupertino Sliding Segmented Control',
              desc: 'An iOS-13-style segmented control',
              page: CupertinoSlidingSegmentedControlListPage()
          ),
          _globalWidget.screenTabList(
              context: context,
              id: number++,
              icon: CupertinoIcons.slider_horizontal_3,
              title: 'Cupertino Slider',
              desc: 'Used to select from a range of values',
              page: CupertinoSliderListPage()
          ),
          _globalWidget.screenTabList(
              context: context,
              id: number++,
              icon: Icons.view_list,
              title: 'Cupertino Sliver Navigation Bar',
              desc: 'An iOS-styled navigation bar with iOS-11-style large titles using slivers',
              page: CupertinoSliverNavigationBarPage()
          ),
          _globalWidget.screenTabList(
              context: context,
              id: number++,
              icon: Icons.toggle_off,
              title: 'Cupertino Switch',
              desc: 'An iOS-style switch',
              page: CupertinoSwitchListPage()
          ),
          _globalWidget.screenTabList(
              context: context,
              id: number++,
              icon: Icons.call_to_action,
              title: 'Cupertino Tab Bar, Tab Scaffold & TabView',
              desc: 'An iOS-style bottom tab bar, tab scaffold and tab view',
              page: CupertinoTabBarListPage()
          ),
          _globalWidget.screenTabList(
              context: context,
              id: number++,
              icon: Icons.text_fields,
              title: 'Cupertino Text Field',
              desc: 'An iOS-style text field',
              page: CupertinoTextFieldListPage()
          ),
        ],
      ),
    );
  }
}
