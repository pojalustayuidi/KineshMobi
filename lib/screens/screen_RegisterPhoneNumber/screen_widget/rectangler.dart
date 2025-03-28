import 'dart:math';

import 'package:KineshmaApp/screens/screen_RegisterPhoneNumber/screen_widget/continuebutton.dart';
import 'package:KineshmaApp/screens/screen_RegisterPhoneNumber/screen_widget/phonenumberform.dart';
import 'package:KineshmaApp/screens/screen_RegisterPhoneNumber/screen_widget/textphone.dart';
import 'package:flutter/material.dart';

class Rectangle extends StatelessWidget {
  const Rectangle({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final padding = max(16.0, screenSize.width * 0.07);
    final bottomPadding = max(16.0, screenSize.height * 0.1);
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Center(
      child: Stack(
        children: [
          Align(
            child: Container(
                color: Color(0xFFDADADA),
                width: screenWidth * 0.90,
                height: screenHeight * 0.42),
            alignment: Alignment.topCenter,
          ),
          Align(
            child: TextUp(),
            alignment: Alignment.topCenter,
          ),
          Positioned(
            child: Text(
              'Введите номер телефона',
              style: TextStyle(fontFamily: 'Poppins-Regular',
                  fontSize: 14,
                  fontWeight: FontWeight.w500),
            ),
            top: screenSize.height * 0.09,
            left: padding,
            right: padding,
          ),
          Positioned(
            child: PhoneNumberForm(),
            top: screenSize.height * 0.13,
            left: padding,
          ),Positioned(child: ContinueButton(),
          left: padding,
          bottom: bottomPadding,
          right: padding,)
        ],
      ),
    );
  }
}
