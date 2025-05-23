import 'package:flutter/material.dart';

class TemporaryWidget extends StatelessWidget {
  const TemporaryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Image.asset(
            'assets/sign.png',
            scale: 7,
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            'Это страница на разработке',
            style: TextStyle(fontSize: 25),
          ),
          Text('Приносим свои извенения за временные неудобства',
              style: TextStyle(fontSize: 16), textAlign: TextAlign.center),
        ],
      ),
    );
  }
}
