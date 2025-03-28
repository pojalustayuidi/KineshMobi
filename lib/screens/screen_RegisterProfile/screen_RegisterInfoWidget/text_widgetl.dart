import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  const TextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
    children: [
      Text(
        'Заполните информацию о себе',
        style: TextStyle(
            fontFamily: 'Poppins-Regular',
            fontSize: 20,
            fontWeight: FontWeight.w600),
      ),
      SizedBox(),
      Padding(
        padding: const EdgeInsets.only(right: 16,left: 16),
        child: Text(textAlign: TextAlign.center,
          'Прежде чем использовать это приложение, пожалуйста, сначала введите свою информацию',
          style: TextStyle(
            color: Color(0xFF667085),
              fontFamily: 'Poppins-Regular',
              fontSize: 14,
              fontWeight: FontWeight.w400),
        ),
      ),
      SizedBox(
        width: 1,
      ),
    ],
    );
  }
}
