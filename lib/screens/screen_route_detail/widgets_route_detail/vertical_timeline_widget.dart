import 'package:flutter/material.dart';
import 'package:timelines_plus/timelines_plus.dart';

class VerticalTimelineWidget extends StatefulWidget {
  const VerticalTimelineWidget({super.key});

  @override
  State<VerticalTimelineWidget> createState() => _VerticalTimelineWidgetState();
}

class _VerticalTimelineWidgetState extends State<VerticalTimelineWidget> {
  @override
  Widget build(BuildContext context) {
    return TimelineTheme(
        data: TimelineThemeData(), child: OutlinedDotIndicator());
  }
}
