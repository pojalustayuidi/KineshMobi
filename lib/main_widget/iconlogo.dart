import 'package:flutter/material.dart';

class IconsLogo extends StatelessWidget {
  const IconsLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Column(
          children: [
            Image.asset(
              'assets/logoapp.png',
              scale: 0.8,
            )
          ],
        ),
      ),
    );
  }
}
