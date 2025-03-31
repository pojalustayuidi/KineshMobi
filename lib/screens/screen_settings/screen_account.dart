import 'package:KineshmaApp/MainWidget/imageprofile.dart';
import 'package:KineshmaApp/MainWidget/text.dart';
import 'package:flutter/material.dart';


class ScreenSettings extends StatefulWidget {
  const ScreenSettings({super.key});

  @override
  State<ScreenSettings> createState() =>
      _ScreenSettings();
}

class _ScreenSettings extends State<ScreenSettings> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(


        body: Stack(
          children: [ImageSettings(),TextEmail(),],
        ),),
    );
  }}
