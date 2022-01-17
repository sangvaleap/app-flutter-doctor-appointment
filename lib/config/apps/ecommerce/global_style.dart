/*
this is global style
This file is used to styling a whole application
 */

import 'package:doctor_app/config/apps/ecommerce/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class GlobalStyle {
  // appBar
  static const Color appBarIconThemeColor = Colors.black;
  static const double appBarElevation = 0;
  static const SystemUiOverlayStyle appBarSystemOverlayStyle =
      SystemUiOverlayStyle.dark;
  static const Color appBarBackgroundColor = Colors.white;
  static const TextStyle appBarTitle =
      TextStyle(fontSize: 18, color: Colors.black);
  /*
  this is used for height at product card using gridDelegate
  if you change font size or using custom font such as google font, sometimes there is an error said
  "Bottom overflowed by xx pixel" depends on the font height (Every font has a different height)
  so you need to change below
  */
  static const double gridDelegateRatio = 0.625; // lower is more longer
  static const double gridDelegateFlashsaleRatio =
      0.597; // lower is more longer
  static const double horizontalProductHeightMultiplication =
      1.90; // higher is more longer

  // styling product card
  static const TextStyle productName = TextStyle(fontSize: 12, color: CHARCOAL);

  static const TextStyle productPrice =
      TextStyle(fontSize: 13, fontWeight: FontWeight.bold);

  static const TextStyle productPriceDiscounted = TextStyle(
    fontSize: 12,
    color: SOFT_GREY,
    decoration: TextDecoration.lineThrough,
  );

  static const TextStyle productSale =
      TextStyle(fontSize: 11, color: SOFT_GREY);

  static const TextStyle productLocation =
      TextStyle(fontSize: 11, color: SOFT_GREY);

  static const TextStyle productTotalReview =
      TextStyle(fontSize: 11, color: SOFT_GREY);

  // search filter
  static const TextStyle filterTitle =
      TextStyle(fontSize: 16, fontWeight: FontWeight.bold);

  // detail product
  static const TextStyle detailProductPrice =
      TextStyle(fontSize: 20, fontWeight: FontWeight.bold);

  static const TextStyle sectionTitle =
      TextStyle(fontSize: 16, fontWeight: FontWeight.bold);

  static const TextStyle viewAll = TextStyle(
      fontSize: 13, fontWeight: FontWeight.bold, color: PRIMARY_COLOR);

  static const TextStyle paymentTotalPrice =
      TextStyle(fontSize: 14, fontWeight: FontWeight.bold);

  // delivery
  static const TextStyle deliveryPrice = TextStyle(fontSize: 15);

  static const TextStyle deliveryTotalPrice =
      TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: ASSENT_COLOR);

  static const TextStyle chooseCourier =
      TextStyle(fontSize: 16, fontWeight: FontWeight.bold);

  static const TextStyle courierTitle =
      TextStyle(fontSize: 15, fontWeight: FontWeight.bold);

  static const TextStyle courierType = TextStyle(fontSize: 15, color: CHARCOAL);

  // shopping cart
  static const TextStyle shoppingCartTotalPrice =
      TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: ASSENT_COLOR);

  static const TextStyle shoppingCartOtherProduct = TextStyle(
    fontSize: 12,
  );

  // account information
  static const TextStyle accountInformationLabel =
      TextStyle(fontSize: 15, color: BLACK_GREY, fontWeight: FontWeight.normal);

  static const TextStyle accountInformationValue =
      TextStyle(fontSize: 16, color: Colors.black);

  static const TextStyle accountInformationEdit = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.bold,
    color: PRIMARY_COLOR,
  );

  // address
  static const TextStyle addressTitle =
      TextStyle(fontSize: 16, fontWeight: FontWeight.bold);

  static const TextStyle addressContent = TextStyle(fontSize: 12);

  static const TextStyle addressAction =
      TextStyle(fontSize: 14, color: PRIMARY_COLOR);

  // verification
  static const TextStyle chooseVerificationTitle =
      TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: CHARCOAL);

  static const TextStyle chooseVerificationMessage =
      TextStyle(fontSize: 13, color: BLACK_GREY);

  static const TextStyle methodTitle =
      TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: CHARCOAL);

  static const TextStyle methodMessage =
      TextStyle(fontSize: 13, color: BLACK_GREY);

  static const TextStyle notReceiveCode =
      TextStyle(fontSize: 13, color: SOFT_GREY);

  static const TextStyle resendVerification =
      TextStyle(fontSize: 13, color: PRIMARY_COLOR);

  static const Icon iconBack =
      Icon(Icons.arrow_back, size: 16, color: PRIMARY_COLOR);

  static const TextStyle back =
      TextStyle(color: PRIMARY_COLOR, fontWeight: FontWeight.w700);

  // authentication
  static const TextStyle authTitle = TextStyle(
      fontSize: 14, fontWeight: FontWeight.bold, color: PRIMARY_COLOR);

  static const TextStyle authNotes = TextStyle(fontSize: 13, color: SOFT_GREY);

  static const TextStyle authSignWith =
      TextStyle(fontSize: 13, color: SOFT_GREY);

  static const TextStyle authBottom1 =
      TextStyle(fontSize: 13, color: SOFT_GREY);

  static const TextStyle authBottom2 =
      TextStyle(fontSize: 13, color: PRIMARY_COLOR);

  static const TextStyle resetPasswordNotes =
      TextStyle(fontSize: 14, color: SOFT_GREY);

  // coupon
  static const TextStyle couponLimitedOffer =
      TextStyle(fontSize: 11, color: Colors.white);

  static const TextStyle couponName =
      TextStyle(fontSize: 15, fontWeight: FontWeight.bold);

  static const TextStyle couponExpired =
      TextStyle(fontSize: 13, color: SOFT_GREY);

  static const Icon iconTime =
      Icon(Icons.access_time, size: 14, color: SOFT_GREY);
}
