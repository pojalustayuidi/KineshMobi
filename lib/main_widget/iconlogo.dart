import 'package:flutter/material.dart';

class IconsLogo extends StatelessWidget {
  const IconsLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Column(
          children: [
            SizedBox(width: 400,height: 70,
              child: Image.asset(
                'assets/apppppppppp.png',
                scale: 0.1,fit: BoxFit.fitWidth,
              ),
            )
          ],
        ),
      ),
    );
  }
}
