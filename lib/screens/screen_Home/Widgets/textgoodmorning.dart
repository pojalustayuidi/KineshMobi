import 'package:flutter/material.dart';

class WelcomeText extends StatelessWidget {
  const WelcomeText({super.key});

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
        'Ольга Ивановна',
        style: TextStyle(
            color: Color(0xFF344E41),
            fontFamily: 'Poppins-Regular',
            fontSize: 16,
            fontWeight: FontWeight.w600),
      ),
      SizedBox(height: 4),
      Text(
        'Введите остановку или выберите из предложенного списка свою ',
        style: TextStyle(
            color: Color(0xFF667085),
            fontFamily: 'Poppins-Regular',
            fontSize: 14,
            fontWeight: FontWeight.w400),
      )
    ]);
  }
}
