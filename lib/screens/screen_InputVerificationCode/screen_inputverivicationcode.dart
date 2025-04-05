import 'package:KineshmaApp/screens/screen_InputVerificationCode/widget_inputverificationcode/buttonsic.dart';
import 'package:KineshmaApp/screens/screen_InputVerificationCode/widget_inputverificationcode/otptextfield.dart';
import 'package:KineshmaApp/screens/screen_InputVerificationCode/widget_inputverificationcode/text_inputverificationcode.dart';
import 'package:flutter/material.dart';

class ScreenInputVerificationUI extends StatefulWidget {
  final String phoneNumber;
  const ScreenInputVerificationUI({super.key, required this.phoneNumber});

  @override
  State<ScreenInputVerificationUI> createState() =>
      _ScreenInputVerificationUI();
}

class _ScreenInputVerificationUI extends State<ScreenInputVerificationUI> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 24,
        ),
        InputVerification(phonenumber: widget.phoneNumber,),
        SizedBox(
          height: 44,
        ),
        OTPTextField(),
        SizedBox(height: 44,),
        ButtonSec(),SizedBox(height: 44,),ReceiveDontCodetText()
      ],
    );
  }
}

class ScreenInputVerification extends StatelessWidget {
  final String phoneNumber;
  const  ScreenInputVerification({super.key,required this.phoneNumber, });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenInputVerificationUI(
        phoneNumber: phoneNumber,
      ),
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
