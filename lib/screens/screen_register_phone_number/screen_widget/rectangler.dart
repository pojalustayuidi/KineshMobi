import 'dart:math';

import 'package:KineshmaApp/screens/screen_register_phone_number/screen_widget/email_form_field.dart';
import 'package:flutter/material.dart';

import 'continuebutton.dart';
import 'textphone.dart';

class Rectangle extends StatelessWidget {
  final TextEditingController controller;

  const Rectangle({
    super.key,
    required this.controller,
  });

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
            alignment: Alignment.topCenter,
            child: Container(
                color: Color(0xFFDADADA),
                width: screenWidth * 0.90,
                height: screenHeight * 0.42),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: TextUp(),
          ),
          Positioned(
            top: screenSize.height * 0.09,
            left: padding,
            right: padding,
            child: Text(
              'Введите ваш Email',
              style: TextStyle(
                  fontFamily: 'Poppins-Regular',
                  fontSize: 14,
                  fontWeight: FontWeight.w500),
            ),
          ),
          Positioned(
            top: screenSize.height * 0.13,
            left: padding,
            child: EmailForm(
            ),
          ),
          Positioned(
            left: padding,
            bottom: bottomPadding,
            right: padding,
            child: ContinueButton(
              phoneNumber: controller.value.text,
            ),
          )
        ],
      ),
    );
  }
}
