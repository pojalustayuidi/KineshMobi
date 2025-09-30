import 'package:KineshmaApp/screens/screen_route_detail/widgets_route_detail/arrival_info_widget.dart';
import 'package:KineshmaApp/screens/screen_route_detail/widgets_route_detail/route_header_widget.dart';
import 'package:KineshmaApp/screens/screen_route_detail/widgets_route_detail/vertical_timeline_widget.dart';
import 'package:flutter/material.dart';
import 'package:KineshmaApp/services/data/models/bus_station.dart';
import 'package:KineshmaApp/services/data/models/route_destination.dart';
import '../screen_home/utils_home/time_utils.dart';
import 'widgets_route_detail/stop_tile_widget.dart';

class ScreenRouteDetail extends StatelessWidget {
  final RouteDestation route;
  final bool isForward;
  final int stopId;
  final Color color;

  const ScreenRouteDetail({
    super.key,
    required this.route,
    required this.isForward,
    required this.stopId,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    List<BusStation> direction = isForward ? route.forward : route.backward;
    int stopIndex = direction.indexWhere((s) => s.stopId == stopId);

    if (!isForward) {
      direction = direction.reversed.toList();
      stopIndex = direction.indexWhere((s) => s.stopId == stopId);
    }

    final currentStop = direction[stopIndex].name;
    final endStop = direction.last.name;

    final currentStopTimes = direction[stopIndex].arrivalTimes;
    final currentTimeRaw = findNextArrivalTime(currentStopTimes) ??
        (currentStopTimes.isNotEmpty ? currentStopTimes[0] : 'Нет времени');
    final currentTime = formatTimeWithoutSeconds(currentTimeRaw);

    final allStops = direction
        .asMap()
        .entries
        .where((entry) => entry.key >= stopIndex)
        .map((entry) => MapEntry(entry.key, entry.value))
        .toList();

    final stopTimes = <int, String>{};
    stopTimes[stopIndex] = currentTime;

    for (int i = stopIndex + 1; i < direction.length; i++) {
      final previousTime = stopTimes[i - 1] ?? currentTime;
      final nextStopTimes = direction[i].arrivalTimes;
      final nextTime = findNextTimeAfter(nextStopTimes, previousTime) ??
          (nextStopTimes.isNotEmpty
              ? formatTimeWithoutSeconds(nextStopTimes[0])
              : 'Нет времени');
      stopTimes[i] = nextTime;
    }

    final endTime = stopTimes[direction.length - 1] ?? 'Нет времени';
    final remainingStopsCount = direction.length - 1 - stopIndex;

    return Scaffold(
      appBar: AppBar(title: Text('$currentStop - $endStop')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const VerticalTimelineWidget(),
            RouteHeader(
              routeName: route.routeShortName,
              currentStop: currentStop,
              endStop: endStop,
              color: color,
            ),
            const SizedBox(height: 8),
            ArrivalInfo(currentTime: currentTime),
            const SizedBox(height: 8),
            ExpansionTile(
              title: Text('$remainingStopsCount остановок'),
              children: allStops.map((entry) {
                final stopTime = stopTimes[entry.key] ?? 'Нет времени';
                return StopTile(
                  stopName: entry.value.name,
                  stopTime: stopTime,
                );
              }).toList(),
            ),
            const SizedBox(height: 8),
            Text(
              '${endStop.toUpperCase()}: $endTime',
              style: const TextStyle(
                fontSize: 18,
                fontFamily: 'Century_Gothic',
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

