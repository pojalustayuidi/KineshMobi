import 'package:KineshmaApp/screens/navigation_menu_bnb.dart';
import 'package:KineshmaApp/screens/screen_RegisterProfile/screen_register.dart';
import 'package:KineshmaApp/screens/screen_map/screen_map.dart';
import 'package:KineshmaApp/screens/screen_mysavedschule/screen_mysavedschule.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../screens/screen_RegisterPhoneNumber/screen_phoneregister.dart';
import '../screens/screen_settings/screen_account.dart';
  class AppRoutes{
    static final Map<String, WidgetBuilder> routes = {
      '/': (context) => ScreenRegister(),
      //'/InputVerificationCode': (context) => ScreenInputVerification(),
      '/RegisterInfo': (context) => ScreenRegisterInfo(),
      '/home': (context) => MainNavigationWrapper(),
      '/saved': (context) => ScreenSavedRasp(),
      '/map' : (context) => ScreenMap(),
      '/profile' : (context) => ScreenSettings(),
    };
    }