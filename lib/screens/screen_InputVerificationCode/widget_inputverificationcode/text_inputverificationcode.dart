
import 'package:flutter/material.dart';

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

class ReceiveDontCodetText extends StatefulWidget {
  const ReceiveDontCodetText({super.key});

  @override
  State<ReceiveDontCodetText> createState() => _ReceiveDontCodetTextState();
}

class _ReceiveDontCodetTextState extends State<ReceiveDontCodetText> {
  String message = '';
  bool codeResent = false;

  void CodeResent() {
    setState(() {
      message = "Мы отправили код повторно";
      codeResent = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      if (!codeResent) ...[
        Text(
          "Не пришел код?",
          style: TextStyle(color: Colors.black),
        ),
        TextButton(
          onPressed: CodeResent,
          child: Text('Отправить повторно',
              style: TextStyle(
                  color: Color(0xFF2E6659),
                  fontFamily: 'TTSmalls-SemiBold',
                  fontSize: 18)),
        ),
      ] else
        Text(
              "Мы отправили код повторно",
              style: TextStyle(color: Color(0xFF098A2B3)),
            ),
          ]
        );
  }
}
