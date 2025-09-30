import 'package:flutter/material.dart';

class ArrivalInfo extends StatelessWidget {
  final String currentTime;

  const ArrivalInfo({
    super.key,
    required this.currentTime,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      'Приедет: $currentTime',
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
