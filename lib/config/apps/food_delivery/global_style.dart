/*
this is global style
This file is used to styling a whole application
 */

import 'package:doctor_app/config/apps/food_delivery/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class GlobalStyle {
  static const double cardHeightMultiplication = 1.70; // higher is more longer

  static const Color appBarIconThemeColor = Colors.black;
  static const SystemUiOverlayStyle appBarSystemOverlayStyle =
      SystemUiOverlayStyle.dark;
  static const Color appBarBackgroundColor = Colors.white;
  static const TextStyle appBarTitle =
      TextStyle(fontSize: 18, color: Colors.black);

  static const TextStyle horizontalTitle =
      TextStyle(fontSize: 18, fontWeight: FontWeight.bold);

  static const TextStyle viewAll = TextStyle(
      fontSize: 13, fontWeight: FontWeight.bold, color: PRIMARY_COLOR);

  static const TextStyle cardTitle =
      TextStyle(fontSize: 14, color: Colors.black, fontWeight: FontWeight.bold);

  static const TextStyle textPromo = TextStyle(
    fontSize: 12,
    color: BLACK77,
  );

  static const TextStyle textTag = TextStyle(
    fontSize: 13,
    color: SOFT_GREY,
  );

  static const TextStyle textRatingDistances = TextStyle(
    fontSize: 12,
    color: BLACK77,
  );

  static const TextStyle textRestaurantNameSmall = TextStyle(
    fontSize: 11,
    color: BLACK77,
  );

  static const TextStyle textRestaurantNameNormal = TextStyle(
    fontSize: 13,
    color: SOFT_GREY,
  );

  static const TextStyle textRestaurantNameBig =
      TextStyle(fontSize: 15, color: Colors.black, fontWeight: FontWeight.bold);

  static const TextStyle textPrice =
      TextStyle(fontSize: 16, color: ASSENT_COLOR, fontWeight: FontWeight.bold);

  static const TextStyle textPriceLineThrough = TextStyle(
    fontSize: 13,
    color: Colors.black,
    decoration: TextDecoration.lineThrough,
  );

  static const TextStyle couponName =
      TextStyle(fontSize: 15, fontWeight: FontWeight.bold);

  static const TextStyle couponLimitedOffer =
      TextStyle(fontSize: 11, color: Colors.white);

  static const TextStyle couponExpiringDate =
      TextStyle(fontSize: 13, color: SOFT_GREY);

  static const TextStyle userProfileTitle =
      TextStyle(fontSize: 15, color: BLACK77, fontWeight: FontWeight.normal);

  static const TextStyle userProfileValue =
      TextStyle(fontSize: 16, color: Colors.black);

  static const TextStyle userProfileEdit = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.bold,
    color: PRIMARY_COLOR,
  );

  static const TextStyle lastSearchTitle =
      TextStyle(fontSize: 15, fontWeight: FontWeight.bold);

  static const TextStyle deliveryInformationTitle =
      TextStyle(fontSize: 15, color: Colors.black, fontWeight: FontWeight.bold);

  static const TextStyle deliveryInformationAddress =
      TextStyle(fontSize: 13, color: BLACK55);

  static const TextStyle deliveryInformationNoteTitle =
      TextStyle(fontSize: 14, color: Colors.black, fontWeight: FontWeight.bold);

  static const TextStyle deliveryInformationNoteValue =
      TextStyle(fontSize: 14, color: SOFT_GREY);

  static const TextStyle orderSummary =
      TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold);

  static const TextStyle orderCount =
      TextStyle(fontSize: 14, fontWeight: FontWeight.bold);

  static const TextStyle orderFoodTitle =
      TextStyle(fontSize: 14, color: BLACK55);

  static const TextStyle orderPrice = TextStyle(fontSize: 14, color: BLACK55);

  static const TextStyle orderOptions = TextStyle(fontSize: 12, color: BLACK55);

  static const TextStyle orderNotes = TextStyle(fontSize: 12, color: SOFT_GREY);

  static const TextStyle orderAction = TextStyle(
      fontSize: 12, color: PRIMARY_COLOR, fontWeight: FontWeight.bold);

  static const TextStyle couponAction =
      TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: SOFT_BLUE);

  static const TextStyle orderTotalSubtitle =
      TextStyle(fontSize: 14, color: BLACK77);

  static const TextStyle orderTotalTitle =
      TextStyle(fontSize: 14, color: Colors.black, fontWeight: FontWeight.bold);

  static const TextStyle preferredMerchant = TextStyle(
      color: PRIMARY_COLOR, fontWeight: FontWeight.bold, fontSize: 12);

  static const TextStyle restaurantTitle =
      TextStyle(fontWeight: FontWeight.bold, fontSize: 24);

  static const TextStyle restaurantTag =
      TextStyle(color: SOFT_GREY, fontSize: 13);

  static const TextStyle menuTitle =
      TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: BLACK77);

  static const TextStyle restaurantFoodTitle = TextStyle(
    fontSize: 15,
    color: Colors.black,
  );

  static const TextStyle restaurantFoodPrice =
      TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold);

  static const TextStyle restaurantFoodDesc =
      TextStyle(fontSize: 12, color: SOFT_GREY);

  static const TextStyle detailFoodTitle =
      TextStyle(fontWeight: FontWeight.bold, fontSize: 18);

  static const TextStyle detailFoodPrice =
      TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold);

  static const TextStyle detailFoodDesc =
      TextStyle(fontSize: 13, color: SOFT_GREY);

  static const TextStyle detailFoodOptions =
      TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold);

  static const TextStyle detailFoodSubOptions =
      TextStyle(color: BLACK77, fontSize: 12);

  static const TextStyle addressDetailTitle =
      TextStyle(fontSize: 15, color: Colors.black, fontWeight: FontWeight.bold);

  static const TextStyle addressDetailValue =
      TextStyle(fontSize: 13, color: BLACK77);

  static const TextStyle oph =
      TextStyle(fontSize: 15, color: Colors.black, fontWeight: FontWeight.bold);

  static const TextStyle ophDay =
      TextStyle(fontSize: 13, color: BLACK77, fontWeight: FontWeight.w600);

  static const TextStyle ophValue = TextStyle(
    fontSize: 13,
    color: BLACK77,
  );
}
