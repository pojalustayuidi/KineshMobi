

import 'package:KineshmaApp/screens/screen_home/widgets_home/textfield_stopinput.dart';
import 'package:KineshmaApp/screens/screen_register_phone_number/screen_widget/iconlogo.dart';
import 'package:KineshmaApp/services/data/api_stops.dart';
import 'package:flutter/material.dart';

class ScreenHomeContent extends StatefulWidget {
  const ScreenHomeContent({super.key});

  @override
  State<ScreenHomeContent> createState() => _ScreenHomeContentState();
}

class _ScreenHomeContentState extends State<ScreenHomeContent> {
  final apiStops = ApiStops();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [SizedBox(height: 50,),IconsLogo(), SizedBox(height: 50,),
              TextfieldStopinput(apiStops: apiStops,)
            ],
          ),
        ),
      ),

    );
  }
}
