import 'package:doctor_app/config/apps/ecommerce/constant.dart';
import 'package:doctor_app/config/apps/ecommerce/global_style.dart';
import 'package:doctor_app/ui/apps/ecommerce/reusable_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class TermsConditionsPage extends StatefulWidget {
  @override
  _TermsConditionsPageState createState() => _TermsConditionsPageState();
}

class _TermsConditionsPageState extends State<TermsConditionsPage> {
  // initialize reusable widget
  final _reusableWidget = ReusableWidget();

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
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: GlobalStyle.appBarIconThemeColor,
          ),
          elevation: GlobalStyle.appBarElevation,
          title: Text(
            'Terms and Conditions',
            style: GlobalStyle.appBarTitle,
          ),
          backgroundColor: GlobalStyle.appBarBackgroundColor,
          systemOverlayStyle: GlobalStyle.appBarSystemOverlayStyle,
          bottom: _reusableWidget.bottomAppBar(),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(8),
          child: MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
            child: Html(
              data: """
              <p><img src="$GLOBAL_URL/assets/images/apps/ecommerce/account/terms_conditions.png"></p>
              <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque tortor tortor, ultrices id scelerisque a, elementum id elit. Maecenas feugiat tellus sed augue malesuada, id tempus ex sodales. Nulla at cursus eros. Integer porttitor ac ipsum quis sollicitudin. Sed mollis sapien massa, et dignissim turpis vulputate et. Ut ac odio porta, blandit velit in, pharetra lacus. Integer aliquam dolor nec augue porttitor hendrerit. Vestibulum aliquam urna finibus, luctus felis nec, hendrerit augue. Fusce eget lacinia leo. Vivamus porttitor, lacus eget rutrum tempus, odio magna tincidunt elit, ut vulputate nibh velit eu lectus. Morbi felis mi, efficitur sed diam in, elementum ullamcorper leo. Ut bibendum lorem consectetur pellentesque gravida. Sed est orci, consectetur id nunc quis, volutpat consectetur nisi.</p>
              <p>Donec est neque, accumsan sit amet imperdiet porta, suscipit eu ex. Phasellus lobortis mollis pharetra. Donec maximus rhoncus elit, sed pellentesque justo pretium vel. Integer vitae facilisis lectus. Suspendisse potenti. Mauris iaculis placerat feugiat. Integer commodo dui sit amet finibus congue. Nulla egestas lacus vel elit aliquet, at pulvinar ex venenatis. Vivamus eget maximus libero, quis vulputate diam. Pellentesque vel justo vel lectus viverra aliquet ut eget metus.</p>
              <p>Vivamus malesuada velit pretium laoreet pulvinar. Duis non dignissim sapien, vitae viverra purus. Curabitur a gravida mauris. Nullam turpis odio, ultricies sed ultricies non, sodales eget purus. Donec pulvinar bibendum metus vitae ornare. Phasellus eleifend orci eget blandit sollicitudin. Sed sed urna in magna dignissim eleifend.</p>
              <p>Vestibulum vitae erat maximus, laoreet ex quis, laoreet nunc. Sed porttitor massa eget cursus rhoncus. Suspendisse et tellus et enim ullamcorper semper eget in nisl. Nam metus mauris, sollicitudin in venenatis at, pretium at nulla. Sed a accumsan dui. Quisque fermentum mollis erat, ac fringilla eros auctor eu. Donec placerat mi ut sem ullamcorper tempor. Pellentesque ut nulla sollicitudin, tempus arcu quis, vulputate dolor. Sed ultrices cursus nisl, nec tempor neque tempus at. Pellentesque nec dolor faucibus, porttitor quam sed, vehicula est. Vestibulum placerat placerat neque eu posuere. Pellentesque id mauris hendrerit, placerat lacus id, auctor eros. Praesent vestibulum mattis est, non facilisis urna accumsan et. Vestibulum scelerisque ornare sapien, nec blandit purus rhoncus mollis. Sed faucibus, augue consequat rhoncus rutrum, sapien mauris dictum quam, nec tempus orci urna vitae lorem. Curabitur sit amet nisl et lacus fringilla pulvinar.</p>
              <p>Phasellus pellentesque et magna in aliquam. Etiam vehicula dui vitae lectus ultrices iaculis. Nullam volutpat magna vel volutpat laoreet. Donec accumsan mi augue, nec elementum libero imperdiet eget. Duis in enim facilisis, lobortis tellus id, tincidunt urna. Donec ipsum neque, pharetra id imperdiet eget, varius bibendum sapien. Suspendisse tincidunt justo a purus molestie, sed elementum urna scelerisque. Suspendisse eget erat ultrices, suscipit nunc ut, iaculis lacus. Donec finibus, nisi vitae porta sodales, diam sapien scelerisque tortor, vel aliquet urna ex non urna. Etiam dictum eros ut justo ultrices tincidunt. Nulla et neque velit. Phasellus malesuada, lectus et sodales iaculis, sapien nibh ultrices tellus, ut ultrices magna tellus eget tellus. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras non diam ac quam aliquet facilisis sit amet at lectus. Nulla vestibulum libero arcu, eu malesuada ipsum congue feugiat.</p>
              """,
              style: {
                "p": Style.fromTextStyle(
                  TextStyle(fontSize: 16),
                ),
              },
            ),
          ),
        )
    );
  }
}
