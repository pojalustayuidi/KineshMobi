import 'package:KineshmaApp/adaptive_design/adaptivedesign_widget.dart';
import 'package:flutter/material.dart';


class ButtonSec extends StatelessWidget {
  final VoidCallback onPressed;
  const ButtonSec({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: ScreenSize.width(context) * 0.65,
        height: ScreenSize.height(context) * 0.058,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFF344E41),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16))),
          child: Text(
            'Продолжить',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}