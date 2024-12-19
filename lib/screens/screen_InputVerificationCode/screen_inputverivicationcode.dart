import 'package:KineshmaApp/screen1_Widget/iconlogo.dart';
import 'package:KineshmaApp/screen_inputverWidget/otptextfield.dart';
import 'package:KineshmaApp/screen_inputverWidget/text_inputverificationcode.dart';
import 'package:flutter/material.dart';

class ScreenInputVerificationUI extends StatefulWidget {
  const ScreenInputVerificationUI({super.key});

  @override
  State<ScreenInputVerificationUI> createState() =>
      _ScreenInputVerificationUI();
}

class _ScreenInputVerificationUI extends State<ScreenInputVerificationUI> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [SizedBox(height: 24,),InputVerification(), SizedBox(height: 48,), OTPTextField()],
    );
  }
}

class ScreenInputVerification extends StatelessWidget {
  const ScreenInputVerification({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenInputVerificationUI(),
      appBar: AppBar(
        bottom: PreferredSize(
            preferredSize: Size.fromHeight(2.0),
            child: Container(
              color: Colors.grey,
              height: 1.0,
            )),
      ),
    );
  }
}
