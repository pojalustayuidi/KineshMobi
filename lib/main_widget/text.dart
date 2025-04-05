
import 'package:flutter/material.dart';
class TextEmail extends StatelessWidget {
  const TextEmail({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [SizedBox(height: 53,),
          Text(
            'Ольга Ивановна',
            style: TextStyle(
              color: Color(0xFF344E41),
                fontSize: 16,
                fontWeight: FontWeight.w600),
          ),
          Text(
            'Olga@gmail.com',
            style:TextStyle(
                color: Colors.black,
                fontFamily: 'Poppins-Regular',
                fontSize: 14,
                fontWeight: FontWeight.w600),
          ),
        ]
    );
  }}