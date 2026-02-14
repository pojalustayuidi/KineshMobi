import 'package:flutter/material.dart';

class RouteDirectionText extends StatelessWidget {
  final String end;

  const RouteDirectionText({
    super.key,
    required this.end,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      '$end',
      style: const TextStyle(
        fontSize: 12,
        fontFamily: 'Century_Gothic',
        fontWeight: FontWeight.w400,
        color: Colors.black,
      ),
      maxLines: 3,
      overflow: TextOverflow.ellipsis,
    );
  }
}
