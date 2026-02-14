import 'package:flutter/material.dart';

import '../screens/screen_home/utils_home/time_utils.dart';

class ArrivalBadge extends StatelessWidget {
  final String nextTime;
  const ArrivalBadge({
    super.key,
    required this.nextTime,
  });

  (Color, Color) _getColors(String time) {
    if (time == 'Сейчас' || time.contains('<1')) {
      return (
      const Color(0xFFFF9800),
      Colors.white,
      );
    }

    int minutes = 0;
    final regex = RegExp(r'(\d+)');
    final match = regex.firstMatch(time);
    if (match != null) {
      minutes = int.tryParse(match.group(1) ?? '0') ?? 0;
    }

    final hasHours = time.contains('ч') || time.contains('час');

    if (minutes >= 1 && minutes <= 3) {
      return (
      const Color(0xFF4CAF50),
      Colors.white,
      );
    }
    else if (minutes >= 4 && minutes <= 7) {
      return (
      const Color(0xFFE8F5E9),
      const Color(0xFF2E7D32),
      );
    }
    else if (minutes >= 8 && minutes <= 15) {
      return (
      const Color(0xFFE3F2FD),
      const Color(0xFF1565C0),
      );
    }
    else if (minutes >= 16 && minutes <= 30) {
      return (
      const Color(0xFFFAFAFA),
      const Color(0xFF616161),
      );
    }
    else if (minutes >= 31 && minutes <= 59) {
      return (
      const Color(0xFFF5F5F5),
      const Color(0xFF757575),
      );
    }
    else if (hasHours || minutes >= 60) {
      return (
      const Color(0xFFEEEEEE),
      const Color(0xFF9E9E9E),
      );
    }

    return (
    const Color(0xFFF5F5F5),
    const Color(0xFF757575),
    );
  }

  @override
  Widget build(BuildContext context) {
    final displayTime = getTimeDifference(nextTime);
    final (backgroundColor, textColor) = _getColors(displayTime);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 6,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Text(
        displayTime.toUpperCase(),
        style: TextStyle(
          fontSize: 16,
          fontFamily: 'Franklin_Gothic_Medium',
          fontWeight: FontWeight.w700,
          color: textColor,
        ),
      ),
    );
  }
}