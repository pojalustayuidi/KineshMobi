import 'package:flutter/material.dart';

import '../../../main_widget/route_direction_text.dart';

class RouteHeader extends StatefulWidget {
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
  State<RouteHeader> createState() => _RouteHeaderState();
}

class _RouteHeaderState extends State<RouteHeader> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            color: widget.color,
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Text(
              widget.routeName,
              style: const TextStyle(
                fontSize: 23,
                fontFamily: 'Franklin_Gothic_Medium',
                fontWeight: FontWeight.bold,
                color: Colors.black,
                overflow: TextOverflow.ellipsis,
              ),maxLines: 2,
            ),
          ),
        ),
        SizedBox(
          width: 24,
        ),
        RouteDirectionText(start: widget.currentStop, end: widget.endStop,),
        const SizedBox(height: 16),
      ],
    );
  }
}
