import 'package:flutter/material.dart';

class Gendertext extends StatelessWidget {
  const Gendertext({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: Row(
        children: [
          Text(
            'Пол',
            style: TextStyle(
                color: Color(0xFF344054),
                fontFamily: 'Poppins-Regular',
                fontSize: 14,
                fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
