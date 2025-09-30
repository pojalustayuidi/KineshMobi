import 'package:flutter/material.dart';

class ArrivalBadge extends StatelessWidget {
  final String nextTime;

  const ArrivalBadge({
    super.key,
    required this.nextTime,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xFFE8F5E8),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 2,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'БУДЕТ В',
            style: TextStyle(
              fontSize: 14,
              fontFamily: 'Century_Gothic',
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(width: 6),
          Text(
            nextTime,
            style: const TextStyle(
              color: Color(0xFF234840),
              fontSize: 20,
              fontFamily: 'Century_Gothic',
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
