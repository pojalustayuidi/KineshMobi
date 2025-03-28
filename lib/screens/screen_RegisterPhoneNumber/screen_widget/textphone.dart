import 'package:flutter/material.dart';

class TextPhone extends StatelessWidget {
  const TextPhone({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'У вас уже есть аккаунт?',
          style: TextStyle(
              fontFamily: 'Poppins-Regular',
              fontSize: 12,
              height: 1.50,
              fontWeight: FontWeight.w400),
        ),
        SizedBox(
          width: 1,
        ),
        TextButton(
          onPressed: () {},
          child: Text('Войти',
              style: TextStyle(
                  color:  Color(0xFF2E6659),
                  fontFamily: 'TTSmalls-SemiBold',
                  fontSize: 18)),
        ),
      ],
    );
  }
}

class TextUp extends StatelessWidget {
  const TextUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Text(
          'Регистрация',
          style: TextStyle(
              fontFamily: 'poppins-semibold',
              color: Color(0xFF2E6659),
              fontSize: 36,
              fontWeight: FontWeight.w700),
        )
      ],
    );
  }
}
