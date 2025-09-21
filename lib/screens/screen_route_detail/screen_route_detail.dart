import 'package:flutter/material.dart';
import 'package:KineshmaApp/screens/screen_home/utils_home/time_utils.dart';
import 'package:KineshmaApp/services/data/models/bus_station.dart';
import 'package:KineshmaApp/services/data/models/route_destination.dart';

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

  String? findNextTimeAfter(List<String> times, String previousTime) {
    final previousMinutes = _timeToMinutes(previousTime);
    String? nextTime;
    int minDiff = 24 * 60;

    for (final time in times) {
      final minutes = _timeToMinutes(time);
      final diff = minutes - previousMinutes;
      if (diff <= 0) continue;

      if (diff < minDiff) {
        minDiff = diff;
        nextTime = _formatTimeWithoutSeconds(time);
      }
    }
    return nextTime;
  }

  int _timeToMinutes(String time) {
    final formattedTime = _formatTimeWithoutSeconds(time);
    final parts = formattedTime.split(":");
    final hour = int.tryParse(parts[0]) ?? 0;
    final minute = int.tryParse(parts[1]) ?? 0;
    return hour * 60 + minute;
  }

  String _formatTimeWithoutSeconds(String time) {
    final parts = time.split(":");
    if (parts.length >= 2) {
      return '${parts[0]}:${parts[1]}';
    }
    return time;
  }

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
    final currentTime = _formatTimeWithoutSeconds(currentTimeRaw);

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
              ? _formatTimeWithoutSeconds(nextStopTimes[0])
              : 'Нет времени');
      stopTimes[i] = nextTime;
    }

    final endTime = stopTimes[direction.length - 1] ?? 'Нет времени';
    final remainingStopsCount = direction.length - 1 - stopIndex;

    return Scaffold(
      appBar: AppBar(
        title: Text('$currentStop - $endStop'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
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
                        route.routeShortName,
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
              const SizedBox(height: 8),
              Text(
                'Приедет: $currentTime',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 8),
              ExpansionTile(
                title: Text(
                  '$remainingStopsCount остановок',
                  style: const TextStyle(fontSize: 14),
                ),
                children: allStops.map((entry) {
                  final stopTime = stopTimes[entry.key] ?? 'Нет времени';
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 6.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          entry.value.name,
                          style: const TextStyle(fontSize: 16),
                        ),
                        Text(
                          stopTime,
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
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
      ),
    );
  }
}