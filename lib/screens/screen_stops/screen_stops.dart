import 'package:flutter/material.dart';

import '../../main_widget/temporary_widget.dart';


class ScreenStops extends StatefulWidget {
  const ScreenStops({super.key});

  @override
  State<ScreenStops> createState() =>
      _ScreenStops();
}

class _ScreenStops extends State<ScreenStops> {

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
