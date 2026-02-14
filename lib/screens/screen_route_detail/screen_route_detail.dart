import 'dart:async';
import 'package:flutter/material.dart';
import 'package:KineshmaApp/main_widget/arrival_badge.dart';
import 'package:KineshmaApp/screens/screen_route_detail/widgets_route_detail/bus_route_timeline.dart';
import 'package:KineshmaApp/screens/screen_route_detail/widgets_route_detail/route_header_widget.dart';
import 'package:KineshmaApp/services/data/models/bus_station.dart';
import 'package:KineshmaApp/services/data/models/route_destination.dart';
import '../screen_home/utils_home/time_utils.dart';

class ScreenRouteDetail extends StatefulWidget {
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
  State<ScreenRouteDetail> createState() => _ScreenRouteDetailState();
}

class _ScreenRouteDetailState extends State<ScreenRouteDetail> {
  late List<BusStation> direction;
  late Map<int, String> stopTimes;
  late List<String> stopNames;
  late int currentTimelineIndex;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    prepareStops();
    currentTimelineIndex = calculateCurrentIndex();
    timer = Timer.periodic(const Duration(seconds: 30), (_) {
      setState(() {
        currentTimelineIndex = calculateCurrentIndex();
      });
    });
  }

  void prepareStops() {
    direction = widget.isForward ? widget.route.forward : widget.route.backward;

    int stopIndex = direction.indexWhere((s) => s.stopId == widget.stopId);
    if (!widget.isForward) {
      direction = direction.reversed.toList();
      stopIndex = direction.indexWhere((s) => s.stopId == widget.stopId);
    }

    final currentStopTimes = direction[stopIndex].arrivalTimes;
    final currentTimeRaw = findNextArrivalTime(currentStopTimes) ??
        (currentStopTimes.isNotEmpty ? currentStopTimes[0] : 'Нет времени');
    final currentTime = formatTimeWithoutSeconds(currentTimeRaw);

    stopTimes = <int, String>{};
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

    final allStops = direction
        .asMap()
        .entries
        .where((entry) => entry.key >= stopIndex)
        .map((entry) => MapEntry(entry.key, entry.value))
        .toList();

    stopNames = allStops.map((entry) => entry.value.name).toList();
  }

  int calculateCurrentIndex() {
    final now = TimeOfDay.now();
    int currentIndex = 0;

    for (var entry in stopTimes.entries) {
      final parts = entry.value.split(':');
      if (parts.length < 2) continue;
      final hour = int.tryParse(parts[0]) ?? 0;
      final minute = int.tryParse(parts[1]) ?? 0;
      final stopTime = TimeOfDay(hour: hour, minute: minute);

      if (stopTime.hour > now.hour ||
          (stopTime.hour == now.hour && stopTime.minute > now.minute)) {
        break;
      }
      currentIndex = entry.key;
    }

    return currentIndex;
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final currentStop = direction[currentTimelineIndex].name;
    final endStop = direction.last.name;
    final nextTime = stopTimes[currentTimelineIndex] ?? 'Нет времени';
    final remainingStopsCount = direction.length - 1 - currentTimelineIndex;

    return Scaffold(
      appBar: AppBar(title: Text('$currentStop - $endStop')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RouteHeader(
              routeName: widget.route.routeShortName,
              currentStop: currentStop,
              endStop: endStop,
              color: widget.color,

            ),
            const SizedBox(height: 8),
           // ArrivalBadge(nextTime: nextTime),
            const SizedBox(height: 8),
            BusRouteTimeline(
              stops: stopNames,
              stopTimes: stopTimes,
              currentIndex: currentTimelineIndex,
            ),
            const SizedBox(height: 16),
            Text(
              'Осталось остановок: $remainingStopsCount',
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
