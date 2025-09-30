import 'package:flutter/material.dart';

class RouteHeader extends StatelessWidget {
  final String routeName;
  final String currentStop;
  final String endStop;
  final Color color;

  const RouteHeader({
    super.key,
    required this.routeName,
    required this.currentStop,
    required this.endStop,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '${currentStop.toUpperCase()} - ${endStop.toUpperCase()}',
          style: const TextStyle(
            fontFamily: 'Century_Gothic',
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Container(
              width: 60,
              height: 30,
              color: color,
              child: Center(
                child: Text(
                  routeName,
                  style: const TextStyle(
                    fontSize: 23,
                    fontFamily: 'Franklin_Gothic_Medium',
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 10),
            const Text(
              'АВТОБУС',
              style: TextStyle(
                fontSize: 16,
                fontFamily: 'Franklin_Gothic_Medium',
              ),
            ),
          ],
        ),
      ],
    );
  }
}
