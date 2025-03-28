import 'package:KineshmaApp/screens/screen_RegisterProfile/screen_register.dart';
import 'package:KineshmaApp/screens/screen_account/screen_account.dart';
import 'package:KineshmaApp/screens/screen_map/screen_map.dart';
import 'package:KineshmaApp/screens/screen_mysavedschule/screen_mysavedschule.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../screens/screen_Home/screen_home.dart';
import '../screens/screen_InputVerificationCode/screen_inputverivicationcode.dart';
import '../screens/screen_RegisterPhoneNumber/screen_phoneregister.dart';
  class AppRoutes{
    static final Map<String, WidgetBuilder> routes = {
      '/': (context) => ScreenRegister(),
      '/InputVerificationCode': (context) => ScreenInputVerification(),
      '/RegisterInfo': (context) => ScreenRegisterInfo(),
      '/home': (context) => ScreenHomeUI(),
      '/saved': (context) => ScreenSavedRasp(),
      '/map' : (context) => ScreenMap(),
      '/profile' : (context) => ScreenSettings(),
    };
    }