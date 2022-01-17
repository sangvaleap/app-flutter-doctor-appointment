import 'package:doctor_app/cubit/theme/theme_cubit.dart';
import 'package:doctor_app/ui/feature/app_theme/change_theme.dart';
import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppTheme3Page extends StatefulWidget {
  @override
  _AppTheme3PageState createState() => _AppTheme3PageState();
}

class _AppTheme3PageState extends State<AppTheme3Page> {
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
        appBar: _globalWidget.globalAppBar(),
        // App Theme is start from Material App
        body: BlocBuilder<ThemeCubit, ThemeState>(
          builder: (context, state) {
            return MaterialApp(
              title: 'App Theme',
              debugShowCheckedModeBanner: false,
              theme: ThemeData.light(),
              darkTheme: ThemeData.dark(),
              themeMode: (state is ChangeThemeSuccess) ? (state.isDarkMode)?ThemeMode.dark:ThemeMode.light : ThemeMode.light,
              home: Scaffold(
                body: SingleChildScrollView(
                  padding: EdgeInsets.fromLTRB(24, 24, 24, 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Text(
                            'App Theme (Change Theme from another screen using Cubit)',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w500
                            )),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 8),
                        child: Container(
                          child: Text(
                              'This is the example of change theme from another screen',
                              style: TextStyle(
                                  fontSize: 15, letterSpacing: 0.5
                              )),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 24, bottom: 8),
                        child: Text('Example', style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500
                        )),
                      ),
                      _globalWidget.createButton(
                          buttonName: 'Change Theme From this Screen',
                          onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => ChangeThemePage()));
                          }
                      ),
                      SizedBox(height: 16),
                      Card(
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Text('This is card'),
                        ),
                      ),
                      SizedBox(height: 16),
                      Icon(Icons.settings, size: 40)
                    ],
                  ),
                ),
              ),
            );
          }
        )
    );
  }
}
