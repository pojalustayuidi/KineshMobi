// import 'package:KineshmaApp/screens/screen_input_verification_code/widget_inputverificationcode/buttonsic.dart';
// import 'package:KineshmaApp/screens/screen_input_verification_code/widget_inputverificationcode/text_inputverificationcode.dart';
// import 'package:KineshmaApp/services/firebase_service/email_verification_service.dart';
// import 'package:flutter/material.dart';
//
// import 'widget_inputverificationcode/code_form.dart';
//
// class ScreenInputVerificationUI extends StatefulWidget {
//   final String email;
//
//   const ScreenInputVerificationUI({super.key, required this.email});
//
//   @override
//   State<ScreenInputVerificationUI> createState() =>
//       _ScreenInputVerificationUI();
// }
//
// class _ScreenInputVerificationUI extends State<ScreenInputVerificationUI> {
//   final _codeController = TextEditingController();
//   bool _isLoading = false;
//   String _message = " ";
//
//   Future<void> _verifyCode() async {
//     setState(() {
//       _isLoading = true;
//       _message = " ";
//     });
//     try {
//       bool isVerifed = await EmailVerificationService.verifyCode(
//           widget.email, _codeController.text);
//       if (isVerifed) {
//         setState(() {
//           _message = "Код потвержден успешно";
//         });
//       } else {
//         setState(() {
//           _message = "Неверный код";
//         });
//       }
//     } catch (e) {
//       setState(() {
//         _message = "Ошибка";
//       });
//     } finally {
//       setState(() {
//         _isLoading = false;
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         SizedBox(
//           height: 24,
//         ),
//         InputVerification(),
//         SizedBox(
//           height: 44,
//         ),
//         CodeForm(controller: _codeController,),
//         SizedBox(
//           height: 44,
//         ),
//         _isLoading
//         ? const CircularProgressIndicator()
//         : ButtonSec(onPressed: _verifyCode,),
//         SizedBox(
//           height: 44,
//         ),
//         ReceiveDontCodetText()
//       ],
//     );
//   }
// }
//
// class ScreenInputVerification extends StatelessWidget {
//   const ScreenInputVerification({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: ScreenInputVerificationUI(
//         email: '',
//       ),
//       appBar: AppBar(
//         bottom: PreferredSize(
//             preferredSize: Size.fromHeight(2.0),
//             child: Container(
//               color: Colors.grey,
//               height: 1.0,
//             )),
//       ),
//     );
//   }
// }
