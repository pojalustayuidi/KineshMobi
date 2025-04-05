import 'package:flutter/material.dart';

class ImageSettings extends StatelessWidget {
  const ImageSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Column(
          children: [
            SizedBox(
              height: 40,
            ),
            Image.asset(
              'assets/Rectangle15.png',
              scale: 0.8,
            )
          ],
        ),
      ),
    );
  }
}
