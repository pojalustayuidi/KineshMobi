import 'package:flutter/material.dart';

class StopTile extends StatelessWidget {
  final String stopName;
  final String stopTime;

  const StopTile({
    super.key,
    required this.stopName,
    required this.stopTime,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 6.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(stopName, style: const TextStyle(fontSize: 16)),
          Text(stopTime,
              style: const TextStyle(fontSize: 16, color: Colors.grey)),
        ],
      ),
    );
  }
}
