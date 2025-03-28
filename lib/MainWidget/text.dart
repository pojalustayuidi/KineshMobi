
import 'package:flutter/material.dart';
class TextEmail extends StatelessWidget {
  const TextEmail({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          Text(
            'Ольга Ивановна',
            style: TextStyle(
              color: Colors.white,
                fontFamily: 'Poppins-Regular',
                fontSize: 20,
                fontWeight: FontWeight.w600),
          ),
          Text(
            'Olga@gmail.com',
            style: TextStyle(
                color: Colors.white,
                fontFamily: 'Poppins-Regular',
                fontSize: 20,
                fontWeight: FontWeight.w600),
          ),
        ]
    );
  }}