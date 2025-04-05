import 'package:flutter/material.dart';

class Figma {
  static const double figmaDesignWidth = 390; // Ширина макета в Figma
  static const double figmaDesignHeight = 844; // Высота макета в Figma

  static double width(double pixels, BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return (pixels / figmaDesignWidth) * screenWidth;
  }

  static double height(double pixels, BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return (pixels / figmaDesignHeight) * screenHeight;
  }

  static double responsiveWidth(
      double pixels,
      BuildContext context, {
        double? min,
        double? max,
      }) {
    double result = width(pixels, context);
    if (min != null && result < min) return min;
    if (max != null && result > max) return max;
    return result;
  }
}