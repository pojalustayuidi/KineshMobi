import 'package:flutter/material.dart';
import 'package:timelines_plus/timelines_plus.dart';
class BusRouteTimeline extends StatelessWidget {
  final List<String> stops;
  final Map<int, String> stopTimes;
  final int currentIndex;

  const BusRouteTimeline({
    super.key,
    required this.stops,
    required this.stopTimes,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    return FixedTimeline.tileBuilder(
      theme: TimelineThemeData(
        nodePosition: 0,
        connectorTheme: const ConnectorThemeData(
          color: Colors.grey,
          thickness: 2.0,
        ),
        indicatorTheme: const IndicatorThemeData(
          size: 18.0,
        ),
      ),
      builder: TimelineTileBuilder.connected(
        itemCount: stops.length,
        contentsBuilder: (context, index) {
          final time = stopTimes[index] ?? '';
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  stops[index],
                  style: TextStyle(
                    fontSize: 16,
                    color: index == currentIndex ? Colors.black : Colors.grey[700],
                    fontWeight:
                    index == currentIndex ? FontWeight.bold : FontWeight.normal,
                  ),
                ),
                if (time.isNotEmpty)
                  Text(
                    time,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[600],
                    ),
                  ),
              ],
            ),
          );
        },
        connectorBuilder: (context, index, type) {
          return const SolidLineConnector();
        },
        indicatorBuilder: (context, index) {
          return DotIndicator(
            size: 20,
            color: index == currentIndex ? Colors.green : Colors.grey,
            child: index == currentIndex
                ? const Icon(Icons.directions_bus, size: 14, color: Colors.white)
                : null,
          );
        },
      ),
    );
  }
}
