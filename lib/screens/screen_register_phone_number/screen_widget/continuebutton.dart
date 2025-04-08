import 'package:flutter/material.dart';

class ContinueButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isLoading;

  const ContinueButton({super.key,
    required this.text,
    required this.onPressed,
    required this.isLoading});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery
        .of(context)
        .size
        .width;
    double screenHeight = MediaQuery
        .of(context)
        .size
        .height;
    return Center(
      child: SizedBox(
        width: screenWidth * 0.85,
        height: screenHeight * 0.055,
        child: ElevatedButton(
          onPressed: isLoading ? null : onPressed,
          style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFF344E41),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16))),
          child: isLoading
          ? const SizedBox(width: 10,height: 10, child:
          CircularProgressIndicator(),)
            : Text(text, style: TextStyle(color: Colors.white),)
    ),),);
  }
}
