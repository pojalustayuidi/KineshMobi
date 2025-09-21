
import 'package:flutter/material.dart';
class IconsLogo extends StatelessWidget {
  const IconsLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Image.asset(fit: BoxFit.contain,
        'assets/logobus.png',

      ),
    );
  }
}
