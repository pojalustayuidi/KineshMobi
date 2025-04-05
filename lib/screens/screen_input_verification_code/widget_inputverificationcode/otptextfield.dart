import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class OTPTextField extends StatelessWidget {
  const OTPTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        OtpTextField(
          fieldWidth: 50,
          borderColor: Colors.black,
          showFieldAsBox: true,
          fillColor: Colors.red,
          focusedBorderColor: Colors.red,
          borderRadius: BorderRadius.circular(6),
    onSubmit: (String verificationCode) {

    }
    )
      ],
    );
  }
}
