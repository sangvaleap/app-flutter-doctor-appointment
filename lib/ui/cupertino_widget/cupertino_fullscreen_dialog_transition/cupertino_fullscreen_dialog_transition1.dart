import 'package:doctor_app/ui/reusable/global_widget.dart';
import 'package:flutter/material.dart';

import 'cupertino_fullscreen_dialog_transition2.dart';

class CupertinoFullscreenDialogTransition1Page extends StatefulWidget {
  @override
  _CupertinoFullscreenDialogTransition1PageState createState() => _CupertinoFullscreenDialogTransition1PageState();
}

class _CupertinoFullscreenDialogTransition1PageState extends State<CupertinoFullscreenDialogTransition1Page> {
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
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(24, 24, 24, 16),
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _globalWidget.createDetailWidget2(
                  title: 'Cupertino Fullscreen Dialog Transition',
                  desc: 'An iOS-style transition used for summoning fullscreen dialogs.',
                  icon: Icons.event
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 8),
                child: _globalWidget.createButton(
                    buttonName: 'Go To Next Page',
                    onPressed: (){
                      Navigator.of(context).push(
                        PageRouteBuilder(
                          opaque: false,
                          pageBuilder: (context, _, __) {
                            return CupertinoFullscreenDialogTransition2Page();
                          },
                        ),
                      );
                    }
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
