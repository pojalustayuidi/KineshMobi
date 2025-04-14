import 'package:KineshmaApp/screens/screen_home/widgets_home/welcome_text_widget.dart';
import 'package:flutter/material.dart';
import '../screen_register_phone_number/screen_widget/iconlogo.dart';

class ScreenHomeContent extends StatefulWidget {

  const ScreenHomeContent({super.key,});

  @override
  State<ScreenHomeContent> createState() => _ScreenHomeContentState();
}

class _ScreenHomeContentState extends State<ScreenHomeContent> {



  @override
  Widget build(BuildContext context) {
        return Scaffold(
          body: SingleChildScrollView(
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 16),
                  const IconsLogo(),
                  WelcomeText(),
                ],
              ),
            ),

          ),
    );

}}