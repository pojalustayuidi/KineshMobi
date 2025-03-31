import 'package:KineshmaApp/screens/screen_Home/Widgets/textgoodmorning.dart';
import 'package:flutter/material.dart';


class ScreenSavedRasp extends StatefulWidget {
  const ScreenSavedRasp({super.key});

  @override
  State<ScreenSavedRasp> createState() =>
      _ScreenSavedRasp();
}

class _ScreenSavedRasp extends State<ScreenSavedRasp> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [WelcomeText()],
      ));
  }}
