// lib/utils/screen_utils.dart

import 'dart:math';

import 'package:flutter/material.dart';

  class ScreenSize {
    static double width(BuildContext context) => MediaQuery.of(context).size.width;
    static double height(BuildContext context) => MediaQuery.of(context).size.height;
    static EdgeInsets padding(BuildContext context) {
      double adaptivePadding = max(16.0, width(context) * 0.05);
      return EdgeInsets.symmetric(horizontal: adaptivePadding);
    }
  }