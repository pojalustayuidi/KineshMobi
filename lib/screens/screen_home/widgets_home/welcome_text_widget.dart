import 'package:flutter/material.dart';

class WelcomeText extends StatelessWidget {

  const WelcomeText(
      {super.key,});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, bottom: 10),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Доброе утро',
              style: TextStyle(
                  color: Color(0xFF667085),
                  fontSize: 14,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 4),
            Text(
              'Ты крутой!',
              style: TextStyle(
                  color: Color(0xFF344E41),
                  fontSize: 16,
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 12),
            Text(
              'Введите или выберите из предложенного списка свою остановку ',
              style: TextStyle(fontWeight: FontWeight.w400,color: Color(0xFF667085)),
            )
          ]),
    );
  }
}
