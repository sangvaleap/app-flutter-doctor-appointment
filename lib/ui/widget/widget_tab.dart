import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:doctor_app/ui/widget/absorb_pointer/absorb_pointer.dart';
import 'package:doctor_app/ui/widget/align/align_widget.dart';
import 'package:doctor_app/ui/widget/animated_align/animated_align.dart';
import 'package:doctor_app/ui/widget/animated_builder/animated_builder.dart';
import 'package:doctor_app/ui/widget/animated_container/animated_container_list.dart';
import 'package:doctor_app/ui/widget/animated_cross_fade/animated_cross_fade_list.dart';
import 'package:doctor_app/ui/widget/animated_default_textstyle/animated_default_textstyle.dart';
import 'package:doctor_app/ui/widget/animated_list/animated_list_widget_list.dart';
import 'package:doctor_app/ui/widget/animated_opacity/animated_opacity.dart';
import 'package:doctor_app/ui/widget/animated_physical_model/animated_physical_model.dart';
import 'package:doctor_app/ui/widget/animated_positioned/animated_positioned.dart';
import 'package:doctor_app/ui/widget/animated_size/animated_size.dart';
import 'package:doctor_app/ui/widget/animated_widget/animated_widget.dart';
import 'package:doctor_app/ui/widget/app_bar/app_bar_list.dart';
import 'package:doctor_app/ui/widget/aspect_ratio/aspect_ratio.dart';
import 'package:doctor_app/ui/widget/back_drop_filter/back_drop_filter_widget.dart';
import 'package:doctor_app/ui/widget/bottomsheet/bottomsheet_list.dart';
import 'package:doctor_app/ui/widget/card/card_widget_list.dart';
import 'package:doctor_app/ui/widget/chip/chip_widget.dart';
import 'package:doctor_app/ui/widget/cliprrecct/cliprrect_widget.dart';
import 'package:doctor_app/ui/widget/column/column_widget_list.dart';
import 'package:doctor_app/ui/widget/container/container_widget_list.dart';
import 'package:doctor_app/ui/widget/datatable/datatable_widget_list.dart';
import 'package:doctor_app/ui/widget/decorated_box_transition/decorated_box_transition.dart';
import 'package:doctor_app/ui/widget/dialog/dialog_list.dart';
import 'package:doctor_app/ui/widget/dismissible/dismissible_list.dart';
import 'package:doctor_app/ui/widget/divider/divider_widget_list.dart';
import 'package:doctor_app/ui/widget/drawer/drawer_list.dart';
import 'package:doctor_app/ui/widget/expanded/expanded_widget.dart';
import 'package:doctor_app/ui/widget/fab/fab_widget_list.dart';
import 'package:doctor_app/ui/widget/fade_transition/fade_transition.dart';
import 'package:doctor_app/ui/widget/flexible/flexible_widget_list.dart';
import 'package:doctor_app/ui/widget/form_component/form_component_widget_list.dart';
import 'package:doctor_app/ui/widget/gesture_detector/gesture_detector_widget.dart';
import 'package:doctor_app/ui/widget/gridview/gridview_widget_list.dart';
import 'package:doctor_app/ui/widget/hero/hero_widget_list.dart';
import 'package:doctor_app/ui/widget/icon/icon_widget_list.dart';
import 'package:doctor_app/ui/widget/ignore_pointer/ignore_pointer.dart';
import 'package:doctor_app/ui/widget/image/image_widget.dart';
import 'package:doctor_app/ui/widget/interactive_viewer/interactive_viewer.dart';
import 'package:doctor_app/ui/widget/listview/listview_widget_list.dart';
import 'package:doctor_app/ui/widget/media_query/media_query_widget.dart';
import 'package:doctor_app/ui/widget/opacity/opacity_widget_list.dart';
import 'package:doctor_app/ui/widget/padding/padding_widget.dart';
import 'package:doctor_app/ui/widget/popup_menu_button/popup_menu_button_list.dart';
import 'package:doctor_app/ui/widget/positioned/positioned_widget.dart';
import 'package:doctor_app/ui/widget/progress_indicator/progress_indicator_widget_list.dart';
import 'package:doctor_app/ui/widget/refresh_indicator/refresh_indicator_widget_list.dart';
import 'package:doctor_app/ui/widget/rotation_transition/rotation_transition.dart';
import 'package:doctor_app/ui/widget/row/row_widget_list.dart';
import 'package:doctor_app/ui/widget/safe_area/safe_area_widget_list.dart';
import 'package:doctor_app/ui/widget/scale_transition/scale_transition.dart';
import 'package:doctor_app/ui/widget/size_transition/size_transition.dart';
import 'package:doctor_app/ui/widget/slide_transition/slide_transition.dart';
import 'package:doctor_app/ui/widget/sliver/sliver_widget_list.dart';
import 'package:doctor_app/ui/widget/snackbar/snackbar_list.dart';
import 'package:doctor_app/ui/widget/stack/stack_widget.dart';
import 'package:doctor_app/ui/widget/tabbar/tabbar_widget_list.dart';
import 'package:doctor_app/ui/widget/table/table_widget_list.dart';
import 'package:doctor_app/ui/widget/text/text_widget_list.dart';
import 'package:doctor_app/ui/widget/transform/transform_widget_list.dart';
import 'package:doctor_app/ui/widget/wrap/wrap_widget_list.dart';
import 'package:flutter/material.dart';

class WidgetTabPage extends StatefulWidget {
  @override
  _WidgetTabPageState createState() => _WidgetTabPageState();
}

class _WidgetTabPageState extends State<WidgetTabPage> {
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
              icon: Icons.mouse,
              title: 'Absorb Pointer',
              desc: 'A widget that absorbs pointers during hit testing',
              page: AbsorbPointerPage()
          ),
          _globalWidget.screenTabList(
              context: context,
              id: number++,
              icon: Icons.format_align_center,
              title: 'Align Widget',
              desc: 'Used to do some alignment',
              page: AlignWidgetPage()
          ),
          _globalWidget.screenTabList(
              context: context,
              id: number++,
              icon: Icons.animation,
              title: 'Animated Align',
              desc: 'Animated version of Align',
              page: AnimatedAlignPage()
          ),
          _globalWidget.screenTabList(
              context: context,
              id: number++,
              icon: Icons.animation,
              title: 'Animated Builder',
              desc: 'A general-purpose widget for building animations',
              page: AnimatedBuilderPage()
          ),
          _globalWidget.screenTabList(
              context: context,
              id: number++,
              icon: Icons.animation,
              title: 'Animated Container',
              desc: 'Used to animate a container',
              page: AnimatedContainerListPage()
          ),
          _globalWidget.screenTabList(
              context: context,
              id: number++,
              icon: Icons.animation,
              title: 'Animated Cross Fade',
              desc: 'A widget that cross-fades between two given children and animates itself between their sizes',
              page: AnimatedCrossFadeListPage()
          ),
          _globalWidget.screenTabList(
              context: context,
              id: number++,
              icon: Icons.animation,
              title: 'Animated Default TextStyle',
              desc: 'Animated version of DefaultTextStyle',
              page: AnimatedDefaultTextstylePage()
          ),
          _globalWidget.screenTabList(
              context: context,
              id: number++,
              icon: Icons.list,
              title: 'Animated List',
              desc: 'A scrolling container that animates items when they are inserted or removed',
              page: AnimatedListWidgetListPage()
          ),
          _globalWidget.screenTabList(
              context: context,
              id: number++,
              icon: Icons.animation,
              title: 'Animated Opacity',
              desc: 'Animated version of Opacity',
              page: AnimatedOpacityPage()
          ),
          _globalWidget.screenTabList(
              context: context,
              id: number++,
              icon: Icons.animation,
              title: 'Animated Physical Model',
              desc: 'Animated version of PhysicalModel',
              page: AnimatedPhysicalModelPage()
          ),
          _globalWidget.screenTabList(
              context: context,
              id: number++,
              icon: Icons.animation,
              title: 'Animated Positioned',
              desc: 'Animated version of Positioned',
              page: AnimatedPositionedPage()
          ),
          _globalWidget.screenTabList(
              context: context,
              id: number++,
              icon: Icons.animation,
              title: 'Animated Size',
              desc: 'Animated widget that automatically transitions its size over a given duration whenever the given child\'s size changes',
              page: AnimatedSizePage()
          ),
          _globalWidget.screenTabList(
              context: context,
              id: number++,
              icon: Icons.animation,
              title: 'Animated Widget',
              desc: 'A widget that rebuilds when the given Listenable changes value',
              page: AnimatedWidgetPage()
          ),
          _globalWidget.screenTabList(
              context: context,
              id: number++,
              icon: Icons.menu,
              title: 'App Bar',
              desc: 'A Material Design app bar',
              page: AppBarListPage()
          ),
          _globalWidget.screenTabList(
              context: context,
              id: number++,
              icon: Icons.aspect_ratio,
              title: 'Aspect Ratio',
              desc: 'A widget that attempts to size the child to a specific aspect ratio',
              page: AspectRatioPage()
          ),
          _globalWidget.screenTabList(
              context: context,
              id: number++,
              icon: Icons.blur_on,
              title: 'Back Drop Filter Widget',
              desc: 'Used to do blur object',
              page: BackDropFilterWidgetPage()
          ),
          _globalWidget.screenTabList(
              context: context,
              id: number++,
              icon: Icons.open_in_browser,
              title: 'BottomSheet',
              desc: 'Used to show some layout from the bottom',
              page: BottomsheetListPage()
          ),
          _globalWidget.screenTabList(
              context: context,
              id: number++,
              icon: Icons.collections,
              title: 'Card Widget',
              desc: 'One of the main widget in Flutter',
              page: CardWidgetListPage()
          ),
          _globalWidget.screenTabList(
              context: context,
              id: number++,
              icon: Icons.label,
              title: 'Chip Widget',
              desc: 'Used for labeling, tags, choises, etc',
              page: ChipWidgetPage()
          ),
          _globalWidget.screenTabList(
              context: context,
              id: number++,
              icon: Icons.filter_center_focus,
              title: 'ClipRRect Widget',
              desc: 'A widget that clips its child using a rounded rectangle',
              page: ClipRRectWidgetPage()
          ),
          _globalWidget.screenTabList(
              context: context,
              id: number++,
              icon: Icons.table_rows,
              title: 'Column Widget',
              desc: 'Used to stacking your data from top to bottom',
              page: ColumnWidgetListPage()
          ),
          _globalWidget.screenTabList(
              context: context,
              id: number++,
              icon: Icons.highlight_alt,
              title: 'Container Widget',
              desc: 'One of the main widget in Flutter',
              page: ContainerWidgetListPage()
          ),
          _globalWidget.screenTabList(
              context: context,
              id: number++,
              icon: Icons.border_all,
              title: 'DataTable Widget',
              desc: 'A widget that uses the datatable layout algorithm for its children',
              page: DatatableWidgetListPage()
          ),
          _globalWidget.screenTabList(
              context: context,
              id: number++,
              icon: Icons.animation,
              title: 'Decorated Box Transition',
              desc: 'Animated version of a DecoratedBox that animates the different properties of its Decoration',
              page: DecoratedBoxTransitionPage()
          ),
          _globalWidget.screenTabList(
              context: context,
              id: number++,
              icon: Icons.event,
              title: 'Dialog',
              desc: 'Used to show popup',
              page: DialogListPage()
          ),
          _globalWidget.screenTabList(
              context: context,
              id: number++,
              icon: Icons.list,
              title: 'Dismissible',
              desc: 'A widget that can be dismissed by dragging in the indicated direction',
              page: DismissibleListPage()
          ),
          _globalWidget.screenTabList(
              context: context,
              id: number++,
              icon: Icons.horizontal_rule,
              title: 'Divider Widget',
              desc: 'Used to create divider line horizontaly or verticaly',
              page: DividerWidgetListPage()
          ),
          _globalWidget.screenTabList(
              context: context,
              id: number++,
              icon: Icons.menu,
              title: 'Drawer',
              desc: 'Usually used for menu',
              page: DrawerListPage()
          ),
          _globalWidget.screenTabList(
              context: context,
              id: number++,
              icon: Icons.sync_alt,
              title: 'Expanded Widget',
              desc: 'Used to fit the rest of screen',
              page: ExpandedWidgetPage()
          ),
          _globalWidget.screenTabList(
              context: context,
              id: number++,
              icon: Icons.animation,
              title: 'Fade Transition',
              desc: 'Animates the opacity of a widget',
              page: FadeTransitionPage()
          ),
          _globalWidget.screenTabList(
              context: context,
              id: number++,
              icon: Icons.add_circle,
              title: 'Floating Action Button Widget',
              desc: 'A circular icon button that hovers over content',
              page: FabWidgetListPage()
          ),
          _globalWidget.screenTabList(
              context: context,
              id: number++,
              icon: Icons.view_array,
              title: 'Flexible Widget',
              desc: 'Used to divider with flex value',
              page: FlexibleWidgetListPage()
          ),
          _globalWidget.screenTabList(
              context: context,
              id: number++,
              icon: Icons.list_alt,
              title: 'Form Component',
              desc: 'Usually used to manipulated data',
              page: FormComponentWidgetListPage()
          ),
          _globalWidget.screenTabList(
              context: context,
              id: number++,
              icon: Icons.touch_app,
              title: 'Gesture Detector Widget',
              desc: 'Used to handle touch on object',
              page: GestureDetectorWidgetPage()
          ),
          _globalWidget.screenTabList(
              context: context,
              id: number++,
              icon: Icons.grid_on,
              title: 'Grid View Widget',
              desc: 'Used to create layout with grid',
              page: GridviewWidgetListPage()
          ),
          _globalWidget.screenTabList(
              context: context,
              id: number++,
              icon: Icons.sports_volleyball,
              title: 'Hero Widget',
              desc: 'Used to create animation when you move to another page',
              page: HeroWidgetListPage()
          ),
          _globalWidget.screenTabList(
              context: context,
              id: number++,
              icon: Icons.android_outlined,
              title: 'Icon Widget',
              desc: 'Used to draw icon',
              page: IconWidgetListPage()
          ),
          _globalWidget.screenTabList(
              context: context,
              id: number++,
              icon: Icons.mouse,
              title: 'Ignore Pointer',
              desc: 'A widget that is invisible during hit testing',
              page: IgnorePointerPage()
          ),
          _globalWidget.screenTabList(
              context: context,
              id: number++,
              icon: Icons.image,
              title: 'Image Widget',
              desc: 'Used to show image',
              page: ImageWidgetPage()
          ),
          _globalWidget.screenTabList(
              context: context,
              id: number++,
              icon: Icons.zoom_out_map,
              title: 'Interactive Viewer',
              desc: 'A widget that enables pan and zoom interactions with its child',
              page: InteractiveViewerPage()
          ),
          _globalWidget.screenTabList(
              context: context,
              id: number++,
              icon: Icons.list,
              title: 'List View Widget',
              desc: 'Used to listing your data',
              page: ListviewWidgetListPage()
          ),
          _globalWidget.screenTabList(
              context: context,
              id: number++,
              icon: Icons.add_to_home_screen_outlined,
              title: 'Media Query Widget',
              desc: 'Used to get device information screen',
              page: MediaQueryWidgetPage()
          ),
          _globalWidget.screenTabList(
              context: context,
              id: number++,
              icon: Icons.opacity,
              title: 'Opacity Widget',
              desc: 'Used to create opacity of the object',
              page: OpacityWidgetListPage()
          ),
          _globalWidget.screenTabList(
              context: context,
              id: number++,
              icon: Icons.padding,
              title: 'Padding Widget',
              desc: 'Used to give padding to widget that doesn\'t have padding',
              page: PaddingWidgetPage()
          ),
          _globalWidget.screenTabList(
              context: context,
              id: number++,
              icon: Icons.menu,
              title: 'Popup Menu Button',
              desc: 'Displays a menu when pressed and calls onSelected when the menu is dismissed because an item was selected',
              page: PopupMenuButtonListPage()
          ),
          _globalWidget.screenTabList(
              context: context,
              id: number++,
              icon: Icons.photo_size_select_small,
              title: 'Positioned Widget',
              desc: 'Only used when it wrapped with Stack Widget',
              page: PositionedWidgetPage()
          ),
          _globalWidget.screenTabList(
              context: context,
              id: number++,
              icon: Icons.refresh,
              title: 'Progress Indicator Widget',
              desc: 'Shown to user when there is waiting data',
              page: ProgressIndicatorWidgetListPage()
          ),
          _globalWidget.screenTabList(
              context: context,
              id: number++,
              icon: Icons.refresh,
              title: 'Refresh Indicator Widget',
              desc: 'Used to refresh data',
              page: RefreshIndicatorWidgetListPage()
          ),
          _globalWidget.screenTabList(
              context: context,
              id: number++,
              icon: Icons.animation,
              title: 'Rotation Transition',
              desc: 'Animates the rotation of a widget',
              page: RotationTransitionPage()
          ),
          _globalWidget.screenTabList(
              context: context,
              id: number++,
              icon: Icons.view_column,
              title: 'Row Widget',
              desc: 'Used to stacking your data from left to right',
              page: RowWidgetListPage()
          ),
          _globalWidget.screenTabList(
              context: context,
              id: number++,
              icon: Icons.settings_overscan,
              title: 'Safe Area Widget',
              desc: 'A widget that insets its child by sufficient padding to avoid intrusions by the operating system',
              page: SafeAreaWidgetListPage()
          ),
          _globalWidget.screenTabList(
              context: context,
              id: number++,
              icon: Icons.animation,
              title: 'Scale Transition',
              desc: 'Animates the scale of a transformed widget',
              page: ScaleTransitionPage()
          ),
          _globalWidget.screenTabList(
              context: context,
              id: number++,
              icon: Icons.animation,
              title: 'Size Transition',
              desc: 'Animates its own size and clips and aligns its child',
              page: SizeTransitionPage()
          ),
          _globalWidget.screenTabList(
              context: context,
              id: number++,
              icon: Icons.animation,
              title: 'Slide Transition',
              desc: 'Animates the position of a widget relative to its normal position',
              page: SlideTransitionPage()
          ),
          _globalWidget.screenTabList(
              context: context,
              id: number++,
              icon: Icons.view_list,
              title: 'Sliver',
              desc: 'A sliver that places multiple box children in a linear array along the main axis',
              page: SliverWidgetListPage()
          ),
          _globalWidget.screenTabList(
              context: context,
              id: number++,
              icon: Icons.video_label,
              title: 'Snackbar',
              desc: 'Used to show text',
              page: SnackbarListPage()
          ),
          _globalWidget.screenTabList(
              context: context,
              id: number++,
              icon: Icons.layers,
              title: 'Stack Widget',
              desc: 'Used to stacking widget',
              page: StackWidgetPage()
          ),
          _globalWidget.screenTabList(
              context: context,
              id: number++,
              icon: Icons.table_chart,
              title: 'Tab Bar Widget',
              desc: 'Used to create tab view',
              page: TabbarWidgetListPage()
          ),
          _globalWidget.screenTabList(
              context: context,
              id: number++,
              icon: Icons.border_all,
              title: 'Table Widget',
              desc: 'A widget that uses the table layout algorithm for its children',
              page: TableWidgetListPage()
          ),
          _globalWidget.screenTabList(
              context: context,
              id: number++,
              icon: Icons.text_format,
              title: 'Text Widget',
              desc: 'One of the main widget in Flutter',
              page: TextWidgetListPage()
          ),
          _globalWidget.screenTabList(
              context: context,
              id: number++,
              icon: Icons.transform,
              title: 'Transform Widget',
              desc: 'Used to transform widget in Flutter',
              page: TransformWidgetListPage()
          ),
          _globalWidget.screenTabList(
              context: context,
              id: number++,
              icon: Icons.wrap_text,
              title: 'Wrap Widget',
              desc: 'Used to list data from left to right',
              page: WrapWidgetListPage()
          ),
        ],
      ),
    );
  }
}
