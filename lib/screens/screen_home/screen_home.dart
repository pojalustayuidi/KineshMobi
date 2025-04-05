import 'package:KineshmaApp/screens/screen_home/widgets_home/textgoodmorning.dart';
import 'package:flutter/material.dart';

import '../screen_register_phone_number/screen_widget/iconlogo.dart';



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

