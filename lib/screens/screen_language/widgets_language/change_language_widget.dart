import 'package:KineshmaApp/screens/screen_language/widgets_language/radio_button_language.dart';
import 'package:flutter/material.dart';

class ChangeLanguageWidget extends StatelessWidget {
  final String text;
  const ChangeLanguageWidget({super.key,required this.text});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(text, style: TextStyle(fontWeight: FontWeight.w500,)), ],
    );
  }
}
