import 'package:flutter/material.dart';

class TextDontHaveAccount extends StatelessWidget {
  const TextDontHaveAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'У вас нет аккаунта?',
          style: TextStyle(
              fontSize: 12, height: 1.50, fontWeight: FontWeight.w400),
        ),
        SizedBox(
          width: 1,
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pushNamed('/');
          },
          child: Text('Зарегистрироваться',
              style: TextStyle(
                  color: Color(0xFF2E6659),
                  fontFamily: 'TTSmalls-SemiBold',
                  fontSize: 18)),
        ),
      ],
    );
  }
}

class TextLogin extends StatelessWidget {
  const TextLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: Text(
            'Вход',
            style: TextStyle(
                color: Color(0xFF2E6659),
                fontSize: 36,
                fontWeight: FontWeight.w700),
          ),
        )
      ],
    );
  }
}
