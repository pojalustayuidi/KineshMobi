import 'package:flutter/material.dart';

class RectangleBaseWidget extends StatelessWidget {
  const RectangleBaseWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16), color: Colors.grey,
      ),
    );
  }
}
