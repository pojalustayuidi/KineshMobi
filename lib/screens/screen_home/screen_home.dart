import 'package:KineshmaApp/screens/screen_home/widgets_home/textgoodmorning.dart';
import 'package:flutter/material.dart';

import '../screen_register_phone_number/screen_widget/iconlogo.dart';
import 'package:firebase_core/firebase_core.dart';


class ScreenHomeContent extends StatelessWidget {
  const ScreenHomeContent({super.key});
void initFirebase() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
}
void initState(){
  initFirebase();
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      SingleChildScrollView(
        child: (
          SafeArea(
            child: Column(
              children: [SizedBox(height: 16,),
              IconsLogo(),
              WelcomeText(),
          ]),
        )
            ),
          ),
    );
  }
}

