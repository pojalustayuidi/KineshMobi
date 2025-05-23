import 'package:flutter/material.dart';

import '../../main_widget/temporary_widget.dart';


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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [TemporaryWidget(),],
        ),
      ));
  }}
