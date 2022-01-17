import 'package:doctor_app/config/static.dart';
import 'package:doctor_app/cubit/theme/theme_cubit.dart';
import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChangeThemePage extends StatefulWidget {
  @override
  _ChangeThemePageState createState() => _ChangeThemePageState();
}

class _ChangeThemePageState extends State<ChangeThemePage> {
  // initialize global widget
  final _globalWidget = GlobalWidget();

  late ThemeCubit _themeCubit;

  @override
  void initState() {
    _themeCubit = BlocProvider.of<ThemeCubit>(context);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: (StaticVarMethod.isDarkMode==true)?ThemeData.dark():ThemeData.light(),
      child: Scaffold(
          appBar: _globalWidget.globalAppBar(),
          body: Container(
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('Light Theme'),
                  Switch(
                    value: StaticVarMethod.isDarkMode,
                    onChanged: (val){
                      setState(() {
                        StaticVarMethod.isDarkMode = val;
                      });
                      _themeCubit.changeTheme(val);
                    },
                  ),
                  Text('Dark Theme'),
                ],
              ),
            ),
          )
      ),
    );
  }
}
