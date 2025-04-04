import 'package:flutter/material.dart';

import '../screen_RegisterPhoneNumber/screen_widget/iconlogo.dart';
import 'Widgets/textgoodmorning.dart';

class ScreenHomeContent extends StatelessWidget {
  const ScreenHomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [SizedBox(height: 16,),
            IconsLogo(),
            WelcomeText()
            ],
          ),
        ),
      ),
    );
  }
}

