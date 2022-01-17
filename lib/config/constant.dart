/*
this is constant pages
 */

import 'package:flutter/material.dart';

const String APP_NAME = 'DevKit';

// color for apps
const Color PRIMARY_COLOR = Color(0xFF0181cc);
const Color ASSENT_COLOR = Color(0xFFe75f3f);

const Color BLACK21 = Color(0xFF212121);
const Color BLACK55 = Color(0xFF555555);
const Color BLACK77 = Color(0xFF777777);
const Color SOFT_GREY = Color(0xFFaaaaaa);
const Color SOFT_BLUE = Color(0xff01aed6);

const int STATUS_OK = 200;
const int STATUS_BAD_REQUEST = 400;
const int STATUS_NOT_AUTHORIZED = 403;
const int STATUS_NOT_FOUND = 404;
const int STATUS_INTERNAL_ERROR = 500;

const String ERROR_OCCURED = 'Error occured, please try again later';

const int LIMIT_PAGE = 8;

const String GLOBAL_URL = 'https://devkit.ijteknologi.com';
//const String GLOBAL_URL = 'http://192.168.0.4/devkit';

const String SERVER_URL = 'https://devkit.ijteknologi.com/api';
//const String SERVER_URL = 'http://192.168.0.4/devkit/api';

const String LOGIN_API = SERVER_URL + "/authentication/login";
const String PRODUCT_API = SERVER_URL + "/example/getProduct";