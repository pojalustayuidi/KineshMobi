import 'package:flutter/material.dart';

class ContainergradientText extends StatelessWidget {
  const ContainergradientText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Image.asset(
            'assets/Rectangle15.png',
            scale: 0.8,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 25, left: 21),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Доброе утро',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                ),
                Text(
                  'Ты крут!',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
