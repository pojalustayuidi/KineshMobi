import 'package:KineshmaApp/screens/screen_Home/Widgets/textgoodmorning.dart';
import 'package:flutter/material.dart';

class ScreenMap extends StatefulWidget {
  const ScreenMap({super.key});

  @override
  State<ScreenMap> createState() =>
      _ScreenMap();
}

class _ScreenMap extends State<ScreenMap> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(


      body: SafeArea(
        child: Column(
          children: [WelcomeText(),Container(color: Colors.yellow, height: 300,width: 300,)],
        ),
      ),
    );
  }}
