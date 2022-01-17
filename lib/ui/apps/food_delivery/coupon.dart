import 'dart:async';

import 'package:doctor_app/config/apps/food_delivery/constant.dart';
import 'package:doctor_app/config/apps/food_delivery/global_style.dart';
import 'package:doctor_app/model/apps/food_delivery/coupon_model.dart';
import 'package:doctor_app/ui/apps/food_delivery/coupon_detail.dart';
import 'package:doctor_app/ui/reusable/cache_image_network.dart';
import 'package:doctor_app/ui/reusable/shimmer_loading.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CouponPage extends StatefulWidget {
  @override
  _CouponPageState createState() => _CouponPageState();
}

class _CouponPageState extends State<CouponPage> {
  // initialize shimmer loading
  final _shimmerLoading = ShimmerLoading();

  bool _loading = true;
  Timer? _timerDummy;

  List<CouponModel> _couponData = [];

  TextEditingController _etSearch = TextEditingController();

  @override
  void initState() {
    _getData();

    super.initState();
  }

  @override
  void dispose() {
    _timerDummy?.cancel();
    _etSearch.dispose();
    super.dispose();
  }

  void _getData(){
    // this timer function is just for demo, so after 1 second, the shimmer loading will disappear and show the content
    _timerDummy = Timer(Duration(seconds: 1), () {
      setState(() {
        _loading = false;
      });
    });

    _couponData = [
      CouponModel(
          id: 1,
          name: "HOLIDAY50",
          day: "2",
          term: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque tortor tortor, ultrices id scelerisque a, elementum id elit. Maecenas feugiat tellus sed augue malesuada, id tempus ex sodales. Nulla at cursus eros. Integer porttitor ac ipsum quis sollicitudin. Sed mollis sapien massa, et dignissim turpis vulputate et. Ut ac odio porta, blandit velit in, pharetra lacus. Integer aliquam dolor nec augue porttitor hendrerit. Vestibulum aliquam urna finibus, luctus felis nec, hendrerit augue. Fusce eget lacinia leo. Vivamus porttitor, lacus eget rutrum tempus, odio magna tincidunt elit, ut vulputate nibh velit eu lectus. Morbi felis mi, efficitur sed diam in, elementum ullamcorper leo. Ut bibendum lorem consectetur pellentesque gravida. Sed est orci, consectetur id nunc quis, volutpat consectetur nisi.\n\nDonec est neque, accumsan sit amet imperdiet porta, suscipit eu ex. Phasellus lobortis mollis pharetra. Donec maximus rhoncus elit, sed pellentesque justo pretium vel. Integer vitae facilisis lectus. Suspendisse potenti. Mauris iaculis placerat feugiat. Integer commodo dui sit amet finibus congue. Nulla egestas lacus vel elit aliquet, at pulvinar ex venenatis. Vivamus eget maximus libero, quis vulputate diam. Pellentesque vel justo vel lectus viverra aliquet ut eget metus.\n\nVivamus malesuada velit pretium laoreet pulvinar. Duis non dignissim sapien, vitae viverra purus. Curabitur a gravida mauris. Nullam turpis odio, ultricies sed ultricies non, sodales eget purus. Donec pulvinar bibendum metus vitae ornare. Phasellus eleifend orci eget blandit sollicitudin. Sed sed urna in magna dignissim eleifend.\n\nVestibulum vitae erat maximus, laoreet ex quis, laoreet nunc. Sed porttitor massa eget cursus rhoncus. Suspendisse et tellus et enim ullamcorper semper eget in nisl. Nam metus mauris, sollicitudin in venenatis at, pretium at nulla. Sed a accumsan dui. Quisque fermentum mollis erat, ac fringilla eros auctor eu. Donec placerat mi ut sem ullamcorper tempor. Pellentesque ut nulla sollicitudin, tempus arcu quis, vulputate dolor. Sed ultrices cursus nisl, nec tempor neque tempus at. Pellentesque nec dolor faucibus, porttitor quam sed, vehicula est. Vestibulum placerat placerat neque eu posuere. Pellentesque id mauris hendrerit, placerat lacus id, auctor eros. Praesent vestibulum mattis est, non facilisis urna accumsan et. Vestibulum scelerisque ornare sapien, nec blandit purus rhoncus mollis. Sed faucibus, augue consequat rhoncus rutrum, sapien mauris dictum quam, nec tempus orci urna vitae lorem. Curabitur sit amet nisl et lacus fringilla pulvinar."
      ),
      CouponModel(
          id: 2,
          name: "STAYATHOME60",
          day: "6",
          term: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque tortor tortor, ultrices id scelerisque a, elementum id elit. Maecenas feugiat tellus sed augue malesuada, id tempus ex sodales. Nulla at cursus eros. Integer porttitor ac ipsum quis sollicitudin. Sed mollis sapien massa, et dignissim turpis vulputate et. Ut ac odio porta, blandit velit in, pharetra lacus. Integer aliquam dolor nec augue porttitor hendrerit. Vestibulum aliquam urna finibus, luctus felis nec, hendrerit augue. Fusce eget lacinia leo. Vivamus porttitor, lacus eget rutrum tempus, odio magna tincidunt elit, ut vulputate nibh velit eu lectus. Morbi felis mi, efficitur sed diam in, elementum ullamcorper leo. Ut bibendum lorem consectetur pellentesque gravida. Sed est orci, consectetur id nunc quis, volutpat consectetur nisi.\n\nDonec est neque, accumsan sit amet imperdiet porta, suscipit eu ex. Phasellus lobortis mollis pharetra. Donec maximus rhoncus elit, sed pellentesque justo pretium vel. Integer vitae facilisis lectus. Suspendisse potenti. Mauris iaculis placerat feugiat. Integer commodo dui sit amet finibus congue. Nulla egestas lacus vel elit aliquet, at pulvinar ex venenatis. Vivamus eget maximus libero, quis vulputate diam. Pellentesque vel justo vel lectus viverra aliquet ut eget metus.\n\nVivamus malesuada velit pretium laoreet pulvinar. Duis non dignissim sapien, vitae viverra purus. Curabitur a gravida mauris. Nullam turpis odio, ultricies sed ultricies non, sodales eget purus. Donec pulvinar bibendum metus vitae ornare. Phasellus eleifend orci eget blandit sollicitudin. Sed sed urna in magna dignissim eleifend.\n\nVestibulum vitae erat maximus, laoreet ex quis, laoreet nunc. Sed porttitor massa eget cursus rhoncus. Suspendisse et tellus et enim ullamcorper semper eget in nisl. Nam metus mauris, sollicitudin in venenatis at, pretium at nulla. Sed a accumsan dui. Quisque fermentum mollis erat, ac fringilla eros auctor eu. Donec placerat mi ut sem ullamcorper tempor. Pellentesque ut nulla sollicitudin, tempus arcu quis, vulputate dolor. Sed ultrices cursus nisl, nec tempor neque tempus at. Pellentesque nec dolor faucibus, porttitor quam sed, vehicula est. Vestibulum placerat placerat neque eu posuere. Pellentesque id mauris hendrerit, placerat lacus id, auctor eros. Praesent vestibulum mattis est, non facilisis urna accumsan et. Vestibulum scelerisque ornare sapien, nec blandit purus rhoncus mollis. Sed faucibus, augue consequat rhoncus rutrum, sapien mauris dictum quam, nec tempus orci urna vitae lorem. Curabitur sit amet nisl et lacus fringilla pulvinar."
      ),
      CouponModel(
          id: 3,
          name: "DELICIOUS",
          day: "3",
          term: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque tortor tortor, ultrices id scelerisque a, elementum id elit. Maecenas feugiat tellus sed augue malesuada, id tempus ex sodales. Nulla at cursus eros. Integer porttitor ac ipsum quis sollicitudin. Sed mollis sapien massa, et dignissim turpis vulputate et. Ut ac odio porta, blandit velit in, pharetra lacus. Integer aliquam dolor nec augue porttitor hendrerit. Vestibulum aliquam urna finibus, luctus felis nec, hendrerit augue. Fusce eget lacinia leo. Vivamus porttitor, lacus eget rutrum tempus, odio magna tincidunt elit, ut vulputate nibh velit eu lectus. Morbi felis mi, efficitur sed diam in, elementum ullamcorper leo. Ut bibendum lorem consectetur pellentesque gravida. Sed est orci, consectetur id nunc quis, volutpat consectetur nisi.\n\nDonec est neque, accumsan sit amet imperdiet porta, suscipit eu ex. Phasellus lobortis mollis pharetra. Donec maximus rhoncus elit, sed pellentesque justo pretium vel. Integer vitae facilisis lectus. Suspendisse potenti. Mauris iaculis placerat feugiat. Integer commodo dui sit amet finibus congue. Nulla egestas lacus vel elit aliquet, at pulvinar ex venenatis. Vivamus eget maximus libero, quis vulputate diam. Pellentesque vel justo vel lectus viverra aliquet ut eget metus.\n\nVivamus malesuada velit pretium laoreet pulvinar. Duis non dignissim sapien, vitae viverra purus. Curabitur a gravida mauris. Nullam turpis odio, ultricies sed ultricies non, sodales eget purus. Donec pulvinar bibendum metus vitae ornare. Phasellus eleifend orci eget blandit sollicitudin. Sed sed urna in magna dignissim eleifend.\n\nVestibulum vitae erat maximus, laoreet ex quis, laoreet nunc. Sed porttitor massa eget cursus rhoncus. Suspendisse et tellus et enim ullamcorper semper eget in nisl. Nam metus mauris, sollicitudin in venenatis at, pretium at nulla. Sed a accumsan dui. Quisque fermentum mollis erat, ac fringilla eros auctor eu. Donec placerat mi ut sem ullamcorper tempor. Pellentesque ut nulla sollicitudin, tempus arcu quis, vulputate dolor. Sed ultrices cursus nisl, nec tempor neque tempus at. Pellentesque nec dolor faucibus, porttitor quam sed, vehicula est. Vestibulum placerat placerat neque eu posuere. Pellentesque id mauris hendrerit, placerat lacus id, auctor eros. Praesent vestibulum mattis est, non facilisis urna accumsan et. Vestibulum scelerisque ornare sapien, nec blandit purus rhoncus mollis. Sed faucibus, augue consequat rhoncus rutrum, sapien mauris dictum quam, nec tempus orci urna vitae lorem. Curabitur sit amet nisl et lacus fringilla pulvinar."
      ),
      CouponModel(
          id: 4,
          name: "WEEKEND45",
          day: "4",
          term: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque tortor tortor, ultrices id scelerisque a, elementum id elit. Maecenas feugiat tellus sed augue malesuada, id tempus ex sodales. Nulla at cursus eros. Integer porttitor ac ipsum quis sollicitudin. Sed mollis sapien massa, et dignissim turpis vulputate et. Ut ac odio porta, blandit velit in, pharetra lacus. Integer aliquam dolor nec augue porttitor hendrerit. Vestibulum aliquam urna finibus, luctus felis nec, hendrerit augue. Fusce eget lacinia leo. Vivamus porttitor, lacus eget rutrum tempus, odio magna tincidunt elit, ut vulputate nibh velit eu lectus. Morbi felis mi, efficitur sed diam in, elementum ullamcorper leo. Ut bibendum lorem consectetur pellentesque gravida. Sed est orci, consectetur id nunc quis, volutpat consectetur nisi.\n\nDonec est neque, accumsan sit amet imperdiet porta, suscipit eu ex. Phasellus lobortis mollis pharetra. Donec maximus rhoncus elit, sed pellentesque justo pretium vel. Integer vitae facilisis lectus. Suspendisse potenti. Mauris iaculis placerat feugiat. Integer commodo dui sit amet finibus congue. Nulla egestas lacus vel elit aliquet, at pulvinar ex venenatis. Vivamus eget maximus libero, quis vulputate diam. Pellentesque vel justo vel lectus viverra aliquet ut eget metus.\n\nVivamus malesuada velit pretium laoreet pulvinar. Duis non dignissim sapien, vitae viverra purus. Curabitur a gravida mauris. Nullam turpis odio, ultricies sed ultricies non, sodales eget purus. Donec pulvinar bibendum metus vitae ornare. Phasellus eleifend orci eget blandit sollicitudin. Sed sed urna in magna dignissim eleifend.\n\nVestibulum vitae erat maximus, laoreet ex quis, laoreet nunc. Sed porttitor massa eget cursus rhoncus. Suspendisse et tellus et enim ullamcorper semper eget in nisl. Nam metus mauris, sollicitudin in venenatis at, pretium at nulla. Sed a accumsan dui. Quisque fermentum mollis erat, ac fringilla eros auctor eu. Donec placerat mi ut sem ullamcorper tempor. Pellentesque ut nulla sollicitudin, tempus arcu quis, vulputate dolor. Sed ultrices cursus nisl, nec tempor neque tempus at. Pellentesque nec dolor faucibus, porttitor quam sed, vehicula est. Vestibulum placerat placerat neque eu posuere. Pellentesque id mauris hendrerit, placerat lacus id, auctor eros. Praesent vestibulum mattis est, non facilisis urna accumsan et. Vestibulum scelerisque ornare sapien, nec blandit purus rhoncus mollis. Sed faucibus, augue consequat rhoncus rutrum, sapien mauris dictum quam, nec tempus orci urna vitae lorem. Curabitur sit amet nisl et lacus fringilla pulvinar."
      ),
      CouponModel(
          id: 5,
          name: "WEEKDAY15",
          day: "4",
          term: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque tortor tortor, ultrices id scelerisque a, elementum id elit. Maecenas feugiat tellus sed augue malesuada, id tempus ex sodales. Nulla at cursus eros. Integer porttitor ac ipsum quis sollicitudin. Sed mollis sapien massa, et dignissim turpis vulputate et. Ut ac odio porta, blandit velit in, pharetra lacus. Integer aliquam dolor nec augue porttitor hendrerit. Vestibulum aliquam urna finibus, luctus felis nec, hendrerit augue. Fusce eget lacinia leo. Vivamus porttitor, lacus eget rutrum tempus, odio magna tincidunt elit, ut vulputate nibh velit eu lectus. Morbi felis mi, efficitur sed diam in, elementum ullamcorper leo. Ut bibendum lorem consectetur pellentesque gravida. Sed est orci, consectetur id nunc quis, volutpat consectetur nisi.\n\nDonec est neque, accumsan sit amet imperdiet porta, suscipit eu ex. Phasellus lobortis mollis pharetra. Donec maximus rhoncus elit, sed pellentesque justo pretium vel. Integer vitae facilisis lectus. Suspendisse potenti. Mauris iaculis placerat feugiat. Integer commodo dui sit amet finibus congue. Nulla egestas lacus vel elit aliquet, at pulvinar ex venenatis. Vivamus eget maximus libero, quis vulputate diam. Pellentesque vel justo vel lectus viverra aliquet ut eget metus.\n\nVivamus malesuada velit pretium laoreet pulvinar. Duis non dignissim sapien, vitae viverra purus. Curabitur a gravida mauris. Nullam turpis odio, ultricies sed ultricies non, sodales eget purus. Donec pulvinar bibendum metus vitae ornare. Phasellus eleifend orci eget blandit sollicitudin. Sed sed urna in magna dignissim eleifend.\n\nVestibulum vitae erat maximus, laoreet ex quis, laoreet nunc. Sed porttitor massa eget cursus rhoncus. Suspendisse et tellus et enim ullamcorper semper eget in nisl. Nam metus mauris, sollicitudin in venenatis at, pretium at nulla. Sed a accumsan dui. Quisque fermentum mollis erat, ac fringilla eros auctor eu. Donec placerat mi ut sem ullamcorper tempor. Pellentesque ut nulla sollicitudin, tempus arcu quis, vulputate dolor. Sed ultrices cursus nisl, nec tempor neque tempus at. Pellentesque nec dolor faucibus, porttitor quam sed, vehicula est. Vestibulum placerat placerat neque eu posuere. Pellentesque id mauris hendrerit, placerat lacus id, auctor eros. Praesent vestibulum mattis est, non facilisis urna accumsan et. Vestibulum scelerisque ornare sapien, nec blandit purus rhoncus mollis. Sed faucibus, augue consequat rhoncus rutrum, sapien mauris dictum quam, nec tempus orci urna vitae lorem. Curabitur sit amet nisl et lacus fringilla pulvinar."
      ),
      CouponModel(
          id: 6,
          name: "BURGERLOVERS",
          day: "3",
          term: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque tortor tortor, ultrices id scelerisque a, elementum id elit. Maecenas feugiat tellus sed augue malesuada, id tempus ex sodales. Nulla at cursus eros. Integer porttitor ac ipsum quis sollicitudin. Sed mollis sapien massa, et dignissim turpis vulputate et. Ut ac odio porta, blandit velit in, pharetra lacus. Integer aliquam dolor nec augue porttitor hendrerit. Vestibulum aliquam urna finibus, luctus felis nec, hendrerit augue. Fusce eget lacinia leo. Vivamus porttitor, lacus eget rutrum tempus, odio magna tincidunt elit, ut vulputate nibh velit eu lectus. Morbi felis mi, efficitur sed diam in, elementum ullamcorper leo. Ut bibendum lorem consectetur pellentesque gravida. Sed est orci, consectetur id nunc quis, volutpat consectetur nisi.\n\nDonec est neque, accumsan sit amet imperdiet porta, suscipit eu ex. Phasellus lobortis mollis pharetra. Donec maximus rhoncus elit, sed pellentesque justo pretium vel. Integer vitae facilisis lectus. Suspendisse potenti. Mauris iaculis placerat feugiat. Integer commodo dui sit amet finibus congue. Nulla egestas lacus vel elit aliquet, at pulvinar ex venenatis. Vivamus eget maximus libero, quis vulputate diam. Pellentesque vel justo vel lectus viverra aliquet ut eget metus.\n\nVivamus malesuada velit pretium laoreet pulvinar. Duis non dignissim sapien, vitae viverra purus. Curabitur a gravida mauris. Nullam turpis odio, ultricies sed ultricies non, sodales eget purus. Donec pulvinar bibendum metus vitae ornare. Phasellus eleifend orci eget blandit sollicitudin. Sed sed urna in magna dignissim eleifend.\n\nVestibulum vitae erat maximus, laoreet ex quis, laoreet nunc. Sed porttitor massa eget cursus rhoncus. Suspendisse et tellus et enim ullamcorper semper eget in nisl. Nam metus mauris, sollicitudin in venenatis at, pretium at nulla. Sed a accumsan dui. Quisque fermentum mollis erat, ac fringilla eros auctor eu. Donec placerat mi ut sem ullamcorper tempor. Pellentesque ut nulla sollicitudin, tempus arcu quis, vulputate dolor. Sed ultrices cursus nisl, nec tempor neque tempus at. Pellentesque nec dolor faucibus, porttitor quam sed, vehicula est. Vestibulum placerat placerat neque eu posuere. Pellentesque id mauris hendrerit, placerat lacus id, auctor eros. Praesent vestibulum mattis est, non facilisis urna accumsan et. Vestibulum scelerisque ornare sapien, nec blandit purus rhoncus mollis. Sed faucibus, augue consequat rhoncus rutrum, sapien mauris dictum quam, nec tempus orci urna vitae lorem. Curabitur sit amet nisl et lacus fringilla pulvinar."
      ),
      CouponModel(
          id: 7,
          name: "BREAKFAST",
          day: "2",
          term: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque tortor tortor, ultrices id scelerisque a, elementum id elit. Maecenas feugiat tellus sed augue malesuada, id tempus ex sodales. Nulla at cursus eros. Integer porttitor ac ipsum quis sollicitudin. Sed mollis sapien massa, et dignissim turpis vulputate et. Ut ac odio porta, blandit velit in, pharetra lacus. Integer aliquam dolor nec augue porttitor hendrerit. Vestibulum aliquam urna finibus, luctus felis nec, hendrerit augue. Fusce eget lacinia leo. Vivamus porttitor, lacus eget rutrum tempus, odio magna tincidunt elit, ut vulputate nibh velit eu lectus. Morbi felis mi, efficitur sed diam in, elementum ullamcorper leo. Ut bibendum lorem consectetur pellentesque gravida. Sed est orci, consectetur id nunc quis, volutpat consectetur nisi.\n\nDonec est neque, accumsan sit amet imperdiet porta, suscipit eu ex. Phasellus lobortis mollis pharetra. Donec maximus rhoncus elit, sed pellentesque justo pretium vel. Integer vitae facilisis lectus. Suspendisse potenti. Mauris iaculis placerat feugiat. Integer commodo dui sit amet finibus congue. Nulla egestas lacus vel elit aliquet, at pulvinar ex venenatis. Vivamus eget maximus libero, quis vulputate diam. Pellentesque vel justo vel lectus viverra aliquet ut eget metus.\n\nVivamus malesuada velit pretium laoreet pulvinar. Duis non dignissim sapien, vitae viverra purus. Curabitur a gravida mauris. Nullam turpis odio, ultricies sed ultricies non, sodales eget purus. Donec pulvinar bibendum metus vitae ornare. Phasellus eleifend orci eget blandit sollicitudin. Sed sed urna in magna dignissim eleifend.\n\nVestibulum vitae erat maximus, laoreet ex quis, laoreet nunc. Sed porttitor massa eget cursus rhoncus. Suspendisse et tellus et enim ullamcorper semper eget in nisl. Nam metus mauris, sollicitudin in venenatis at, pretium at nulla. Sed a accumsan dui. Quisque fermentum mollis erat, ac fringilla eros auctor eu. Donec placerat mi ut sem ullamcorper tempor. Pellentesque ut nulla sollicitudin, tempus arcu quis, vulputate dolor. Sed ultrices cursus nisl, nec tempor neque tempus at. Pellentesque nec dolor faucibus, porttitor quam sed, vehicula est. Vestibulum placerat placerat neque eu posuere. Pellentesque id mauris hendrerit, placerat lacus id, auctor eros. Praesent vestibulum mattis est, non facilisis urna accumsan et. Vestibulum scelerisque ornare sapien, nec blandit purus rhoncus mollis. Sed faucibus, augue consequat rhoncus rutrum, sapien mauris dictum quam, nec tempus orci urna vitae lorem. Curabitur sit amet nisl et lacus fringilla pulvinar."
      ),
      CouponModel(
          id: 8,
          name: "VISACARD",
          day: "3",
          term: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque tortor tortor, ultrices id scelerisque a, elementum id elit. Maecenas feugiat tellus sed augue malesuada, id tempus ex sodales. Nulla at cursus eros. Integer porttitor ac ipsum quis sollicitudin. Sed mollis sapien massa, et dignissim turpis vulputate et. Ut ac odio porta, blandit velit in, pharetra lacus. Integer aliquam dolor nec augue porttitor hendrerit. Vestibulum aliquam urna finibus, luctus felis nec, hendrerit augue. Fusce eget lacinia leo. Vivamus porttitor, lacus eget rutrum tempus, odio magna tincidunt elit, ut vulputate nibh velit eu lectus. Morbi felis mi, efficitur sed diam in, elementum ullamcorper leo. Ut bibendum lorem consectetur pellentesque gravida. Sed est orci, consectetur id nunc quis, volutpat consectetur nisi.\n\nDonec est neque, accumsan sit amet imperdiet porta, suscipit eu ex. Phasellus lobortis mollis pharetra. Donec maximus rhoncus elit, sed pellentesque justo pretium vel. Integer vitae facilisis lectus. Suspendisse potenti. Mauris iaculis placerat feugiat. Integer commodo dui sit amet finibus congue. Nulla egestas lacus vel elit aliquet, at pulvinar ex venenatis. Vivamus eget maximus libero, quis vulputate diam. Pellentesque vel justo vel lectus viverra aliquet ut eget metus.\n\nVivamus malesuada velit pretium laoreet pulvinar. Duis non dignissim sapien, vitae viverra purus. Curabitur a gravida mauris. Nullam turpis odio, ultricies sed ultricies non, sodales eget purus. Donec pulvinar bibendum metus vitae ornare. Phasellus eleifend orci eget blandit sollicitudin. Sed sed urna in magna dignissim eleifend.\n\nVestibulum vitae erat maximus, laoreet ex quis, laoreet nunc. Sed porttitor massa eget cursus rhoncus. Suspendisse et tellus et enim ullamcorper semper eget in nisl. Nam metus mauris, sollicitudin in venenatis at, pretium at nulla. Sed a accumsan dui. Quisque fermentum mollis erat, ac fringilla eros auctor eu. Donec placerat mi ut sem ullamcorper tempor. Pellentesque ut nulla sollicitudin, tempus arcu quis, vulputate dolor. Sed ultrices cursus nisl, nec tempor neque tempus at. Pellentesque nec dolor faucibus, porttitor quam sed, vehicula est. Vestibulum placerat placerat neque eu posuere. Pellentesque id mauris hendrerit, placerat lacus id, auctor eros. Praesent vestibulum mattis est, non facilisis urna accumsan et. Vestibulum scelerisque ornare sapien, nec blandit purus rhoncus mollis. Sed faucibus, augue consequat rhoncus rutrum, sapien mauris dictum quam, nec tempus orci urna vitae lorem. Curabitur sit amet nisl et lacus fringilla pulvinar."
      ),
      CouponModel(
          id: 9,
          name: "EVERYTUESDAY",
          day: "1",
          term: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque tortor tortor, ultrices id scelerisque a, elementum id elit. Maecenas feugiat tellus sed augue malesuada, id tempus ex sodales. Nulla at cursus eros. Integer porttitor ac ipsum quis sollicitudin. Sed mollis sapien massa, et dignissim turpis vulputate et. Ut ac odio porta, blandit velit in, pharetra lacus. Integer aliquam dolor nec augue porttitor hendrerit. Vestibulum aliquam urna finibus, luctus felis nec, hendrerit augue. Fusce eget lacinia leo. Vivamus porttitor, lacus eget rutrum tempus, odio magna tincidunt elit, ut vulputate nibh velit eu lectus. Morbi felis mi, efficitur sed diam in, elementum ullamcorper leo. Ut bibendum lorem consectetur pellentesque gravida. Sed est orci, consectetur id nunc quis, volutpat consectetur nisi.\n\nDonec est neque, accumsan sit amet imperdiet porta, suscipit eu ex. Phasellus lobortis mollis pharetra. Donec maximus rhoncus elit, sed pellentesque justo pretium vel. Integer vitae facilisis lectus. Suspendisse potenti. Mauris iaculis placerat feugiat. Integer commodo dui sit amet finibus congue. Nulla egestas lacus vel elit aliquet, at pulvinar ex venenatis. Vivamus eget maximus libero, quis vulputate diam. Pellentesque vel justo vel lectus viverra aliquet ut eget metus.\n\nVivamus malesuada velit pretium laoreet pulvinar. Duis non dignissim sapien, vitae viverra purus. Curabitur a gravida mauris. Nullam turpis odio, ultricies sed ultricies non, sodales eget purus. Donec pulvinar bibendum metus vitae ornare. Phasellus eleifend orci eget blandit sollicitudin. Sed sed urna in magna dignissim eleifend.\n\nVestibulum vitae erat maximus, laoreet ex quis, laoreet nunc. Sed porttitor massa eget cursus rhoncus. Suspendisse et tellus et enim ullamcorper semper eget in nisl. Nam metus mauris, sollicitudin in venenatis at, pretium at nulla. Sed a accumsan dui. Quisque fermentum mollis erat, ac fringilla eros auctor eu. Donec placerat mi ut sem ullamcorper tempor. Pellentesque ut nulla sollicitudin, tempus arcu quis, vulputate dolor. Sed ultrices cursus nisl, nec tempor neque tempus at. Pellentesque nec dolor faucibus, porttitor quam sed, vehicula est. Vestibulum placerat placerat neque eu posuere. Pellentesque id mauris hendrerit, placerat lacus id, auctor eros. Praesent vestibulum mattis est, non facilisis urna accumsan et. Vestibulum scelerisque ornare sapien, nec blandit purus rhoncus mollis. Sed faucibus, augue consequat rhoncus rutrum, sapien mauris dictum quam, nec tempus orci urna vitae lorem. Curabitur sit amet nisl et lacus fringilla pulvinar."
      ),
      CouponModel(
          id: 10,
          name: "CHICKENLOVERS",
          day: "4",
          term: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque tortor tortor, ultrices id scelerisque a, elementum id elit. Maecenas feugiat tellus sed augue malesuada, id tempus ex sodales. Nulla at cursus eros. Integer porttitor ac ipsum quis sollicitudin. Sed mollis sapien massa, et dignissim turpis vulputate et. Ut ac odio porta, blandit velit in, pharetra lacus. Integer aliquam dolor nec augue porttitor hendrerit. Vestibulum aliquam urna finibus, luctus felis nec, hendrerit augue. Fusce eget lacinia leo. Vivamus porttitor, lacus eget rutrum tempus, odio magna tincidunt elit, ut vulputate nibh velit eu lectus. Morbi felis mi, efficitur sed diam in, elementum ullamcorper leo. Ut bibendum lorem consectetur pellentesque gravida. Sed est orci, consectetur id nunc quis, volutpat consectetur nisi.\n\nDonec est neque, accumsan sit amet imperdiet porta, suscipit eu ex. Phasellus lobortis mollis pharetra. Donec maximus rhoncus elit, sed pellentesque justo pretium vel. Integer vitae facilisis lectus. Suspendisse potenti. Mauris iaculis placerat feugiat. Integer commodo dui sit amet finibus congue. Nulla egestas lacus vel elit aliquet, at pulvinar ex venenatis. Vivamus eget maximus libero, quis vulputate diam. Pellentesque vel justo vel lectus viverra aliquet ut eget metus.\n\nVivamus malesuada velit pretium laoreet pulvinar. Duis non dignissim sapien, vitae viverra purus. Curabitur a gravida mauris. Nullam turpis odio, ultricies sed ultricies non, sodales eget purus. Donec pulvinar bibendum metus vitae ornare. Phasellus eleifend orci eget blandit sollicitudin. Sed sed urna in magna dignissim eleifend.\n\nVestibulum vitae erat maximus, laoreet ex quis, laoreet nunc. Sed porttitor massa eget cursus rhoncus. Suspendisse et tellus et enim ullamcorper semper eget in nisl. Nam metus mauris, sollicitudin in venenatis at, pretium at nulla. Sed a accumsan dui. Quisque fermentum mollis erat, ac fringilla eros auctor eu. Donec placerat mi ut sem ullamcorper tempor. Pellentesque ut nulla sollicitudin, tempus arcu quis, vulputate dolor. Sed ultrices cursus nisl, nec tempor neque tempus at. Pellentesque nec dolor faucibus, porttitor quam sed, vehicula est. Vestibulum placerat placerat neque eu posuere. Pellentesque id mauris hendrerit, placerat lacus id, auctor eros. Praesent vestibulum mattis est, non facilisis urna accumsan et. Vestibulum scelerisque ornare sapien, nec blandit purus rhoncus mollis. Sed faucibus, augue consequat rhoncus rutrum, sapien mauris dictum quam, nec tempus orci urna vitae lorem. Curabitur sit amet nisl et lacus fringilla pulvinar."
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: GlobalStyle.appBarIconThemeColor,
        ),
        systemOverlayStyle: GlobalStyle.appBarSystemOverlayStyle,
        centerTitle: true,
        title: Text('Available Offers', style: GlobalStyle.appBarTitle),
        backgroundColor: GlobalStyle.appBarBackgroundColor,
        bottom: PreferredSize(
          child: Container(
            decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(
                    color: Colors.grey[100]!,
                    width: 1.0,
                  )
              ),
            ),
            padding: EdgeInsets.fromLTRB(16, 0, 16, 12),
            height: kToolbarHeight,
            child: TextField(
              controller: _etSearch,
              maxLines: 1,
              style: TextStyle(fontSize: 16, color: Colors.grey[500]),
              onChanged: (textValue) {
                setState(() {});
              },
              decoration: InputDecoration(
                fillColor: Colors.grey[100],
                filled: true,
                hintText: 'Enter Promo Code',
                hintStyle: TextStyle(fontSize: 16, color: Colors.grey[500]),
                prefixIcon: Icon(Icons.search, color: Colors.grey[500], size: 18),
                suffixIcon: (_etSearch.text == '')
                    ? null
                    : GestureDetector(
                    onTap: () {
                      setState(() {
                        _etSearch = TextEditingController(text: '');
                      });
                    },
                    child: Icon(Icons.close, color: Colors.grey[500], size: 18,)
                ),
                focusedBorder: UnderlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    borderSide: BorderSide(color: Colors.grey[200]!)),
                enabledBorder: UnderlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  borderSide: BorderSide(color: Colors.grey[200]!),
                ),
              ),
            ),
          ),
          preferredSize: Size.fromHeight(kToolbarHeight),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: refreshData,
        child: (_loading == true)
            ? _shimmerLoading.buildShimmerContent()
            : ListView.builder(
          itemCount: _couponData.length,
          padding: EdgeInsets.fromLTRB(16, 0, 16, 16),
          physics: AlwaysScrollableScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            return _buildCouponCard(_couponData[index]);
          },
        ),
      ),
    );
  }

  Widget _buildCouponCard(CouponModel couponData){
    return Card(
      margin: EdgeInsets.only(top: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
      elevation: 2,
      color: Colors.white,
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => CouponDetailPage(couponData: couponData)));
        },
        child: Container(
          padding: EdgeInsets.all(16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildCacheNetworkImage(height: 40, url: GLOBAL_URL+'/assets/images/apps/food_delivery/merchant_logo.png', plColor: Colors.transparent),
              SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.fromLTRB(8, 4, 8, 4),
                      decoration: BoxDecoration(
                          color: ASSENT_COLOR,
                          borderRadius: BorderRadius.circular(5)
                      ),
                      child: Text('Limited Offer', style: GlobalStyle.couponLimitedOffer),
                    ),
                    SizedBox(height: 12),
                    Text(couponData.name, style: GlobalStyle.couponName),
                    SizedBox(height: 12),
                    Row(
                      children: [
                        Row(
                          children: [
                            Icon(
                                Icons.access_time,
                                size: 14,
                                color: SOFT_GREY
                            ),
                            SizedBox(
                              width: 4,
                            ),
                            Text('Expiring in '+couponData.day+' days', style: GlobalStyle.couponExpiringDate),
                          ],
                        ),
                        Spacer(),
                        GestureDetector(
                          onTap: (){
                            Fluttertoast.showToast(msg: 'Coupon applied', toastLength: Toast.LENGTH_LONG);
                            Navigator.pop(context);
                          },
                          child: Text('Use Now', style: TextStyle(
                              fontSize: 14, color: SOFT_BLUE, fontWeight: FontWeight.bold
                          )),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future refreshData() async {
    setState(() {
      _couponData.clear();
      _loading = true;
      _getData();
    });
  }
}
