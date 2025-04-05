import 'package:flutter/material.dart';

import '../../screen_input_verification_code/screen_inputverivicationcode.dart';

// import 'Dialog/dialog_already_registred.dart';

class ContinueButton extends StatefulWidget {
  final String phoneNumber;

  const ContinueButton({super.key, required this.phoneNumber});

  @override
  State<ContinueButton> createState() => _ContinueButtonState();
}

class _ContinueButtonState extends State<ContinueButton> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Center(
      child: SizedBox(
        width: screenWidth * 0.85,
        height: screenHeight * 0.055,
        child: ElevatedButton(
          onPressed: () {
            // Navigator.of(context).pushNamed('/InputVerificationCode');
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => ScreenInputVerification(
                      phoneNumber: widget.phoneNumber,
                    )));
          },
          style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFF344E41),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16))),
          child: Text(
            'Зарегистрироваться',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}

// void _ShowDialog(BuildContext context, String phoneNumber) {
//   showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return Dialogalready(phoneNumber: phoneNumber);
//       });
// }
