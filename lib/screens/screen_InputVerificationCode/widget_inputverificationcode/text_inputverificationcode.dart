import 'package:flutter/material.dart';
import 'package:intl_phone_field/phone_number.dart';

class InputVerification extends StatelessWidget {
  final String phonenumber;

  const InputVerification({required this.phonenumber});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            "Введите SMS-Код",
            style: TextStyle(
                fontSize: 20,
                height: 1.50,
                fontWeight: FontWeight.w600,
                fontFamily: 'Poppins-Regular'),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 14, right: 16, left: 16),
            child: Text(
              textAlign: TextAlign.center,
              "Мы отправили SMS-Код на ваш номер телефона  $phonenumber",
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Poppins-Regular',
                  height: 1.43),
            ),
          ),
        ],
      ),
    );
  }
}

class ReceiveDontCodetText extends StatelessWidget {
  const ReceiveDontCodetText({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Не пришел код?",
          style: TextStyle(color: Colors.black),
        ),
        TextButton(
          onPressed: () {},
          child: Text('Отправить повторно',
              style: TextStyle(
                  color: Color(0xFF2E6659),
                  fontFamily: 'TTSmalls-SemiBold',
                  fontSize: 18)),
        ),
      ],
    );
  }
}
