import 'package:flutter/material.dart';

class WelcomeText extends StatelessWidget {
  final String firstName;
  final String lastName;

  const WelcomeText(
      {super.key, required this.firstName, required this.lastName});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Text(
        'Доброе утро',
        style: TextStyle(
            color: Color(0xFF667085),
            fontFamily: 'Poppins-Regular',
            fontSize: 14,
            fontWeight: FontWeight.w500),
      ),
      SizedBox(height: 4),
      Text(
        '$firstName, $lastName',
        style: TextStyle(
            color: Color(0xFF344E41),
            fontFamily: 'Poppins-Regular',
            fontSize: 16,
            fontWeight: FontWeight.w600),
      ),
      SizedBox(height: 4),

    ]);
  }
}
