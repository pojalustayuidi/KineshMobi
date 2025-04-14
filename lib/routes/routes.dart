import 'package:KineshmaApp/screens/navigation_menu_bnb.dart';
import 'package:KineshmaApp/screens/screen_account/screen_account.dart';
import 'package:KineshmaApp/screens/screen_favourites/screen_mysavedschule.dart';
import 'package:KineshmaApp/screens/screen_language/screen_language.dart';
import 'package:KineshmaApp/screens/screen_map/screen_map.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../screens/screen_settings/screen_settings.dart';
  class AppRoutes{
    static final Map<String, WidgetBuilder> routes = {
      // '/': (context) => ScreenRegister(),
      // '/Login' : (context) => ScreenLogin(),
      //'/InputVerificationCode': (context) => ScreenInputVerification(),
      // '/RegisterInfo': (context) => ScreenRegisterInfo(username: '', userId: '',),
      '/': (context) => MainNavigationWrapper(userName: '',),
      '/saved': (context) => ScreenSavedRasp(),
      '/map' : (context) => ScreenMap(),
      '/profile' : (context) => ScreenSettings(),
      '/account' : (context) => ScreenAccount(),
      '/language' : (context) => ScreenLanguage(),
    };
    }