// import 'dart:math';
// import 'package:flutter/material.dart';
// import 'continuebutton.dart';
// import 'textphone.dart';
// import 'email_form_field.dart';
// class Rectangle extends StatelessWidget {
//   final TextEditingController usernameController;
//   final TextEditingController passwordController;
//   final VoidCallback onSubmit;
//   final bool isLoading;
//
//   const Rectangle({
//     super.key,
//     required this.usernameController,
//     required this.onSubmit,
//     required this.isLoading,
//     required this.passwordController,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     final screenSize = MediaQuery.of(context).size;
//     final padding = max(16.0, screenSize.width * 0.07);
//     final bottomPadding = max(16.0, screenSize.height * 0.010);
//     double screenWidth = MediaQuery.of(context).size.width;
//
//     return SafeArea(
//       child: Center(
//         child: Container(
//           color: Color(0xFFDADADA),
//           width: screenWidth * 0.90,
//           padding: EdgeInsets.all(padding),
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               TextUp(),
//               SizedBox(height: 8),
//               Text(
//                 "Придумайте Логин и пароль",
//                 style: TextStyle(
//                   fontSize: 14,
//                   fontWeight: FontWeight.w500,
//                 ),
//               ),
//               SizedBox(height: 16),
//               EmailForm(
//                 usernameController: usernameController,
//                 passwordController: passwordController,
//               ),
//               SizedBox(height: 16),
//               ContinueButton(
//                 text: 'Зарегистрироваться',
//                 onPressed: onSubmit,
//                 isLoading: isLoading,
//               ),
//               SizedBox(height: bottomPadding),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }