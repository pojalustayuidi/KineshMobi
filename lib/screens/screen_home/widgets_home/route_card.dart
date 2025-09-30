import 'package:KineshmaApp/screens/screen_home/utils_home/time_utils.dart';
import 'package:KineshmaApp/screens/screen_route_detail/screen_route_detail.dart';
import 'package:KineshmaApp/services/data/models/bus_station.dart';
import 'package:KineshmaApp/services/data/models/route_destination.dart';
import 'package:flutter/material.dart';

import '../../../main_widget/arrival_badge.dart';
import '../../../main_widget/route_direction_text.dart';

class RouteCard extends StatefulWidget {
  final RouteDestation route;
  final List<BusStation> direction;
  final Color color;
  final int stopId;
  final String? nextArrival;
  const RouteCard({
    super.key,
    required this.route,
    required this.direction,
    required this.color,
    required this.stopId, this.nextArrival,
  });

  @override
  State<RouteCard> createState() => _RouteCardState();
}

class _RouteCardState extends State<RouteCard> {
  @override
  Widget build(BuildContext context) {
    List<BusStation> adjustedDirection = List.from(widget.direction);
    final isForward = widget.direction == widget.route.forward;

    int stopIndex =
        adjustedDirection.indexWhere((s) => s.stopId == widget.stopId);
    if (stopIndex == -1) return SizedBox();

    if (!isForward) {
      adjustedDirection = adjustedDirection.reversed.toList();
      stopIndex =
          adjustedDirection.indexWhere((s) => s.stopId == widget.stopId);
    }

    final start = adjustedDirection[stopIndex].name.toUpperCase();
    final end = adjustedDirection.last.name.toUpperCase();
    final stop = adjustedDirection[stopIndex];
    final nextTime = findNextArrivalTime(stop.arrivalTimes) ??
        'Не найдено ближайших автобусов';

    final keyStops = adjustedDirection
        .asMap()
        .entries
        .where((entry) {
          final index = entry.key;
          return index > stopIndex;
        })
        .map((entry) => entry.value.name)
        .take(3)
        .join(', ');

    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => ScreenRouteDetail(
              route: widget.route,
              isForward: isForward,
              stopId: widget.stopId,
              color: widget.color,
            ),
          ),
        );
      },
      child: SafeArea(
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          color: Color(0xFFFFFFFF),
          elevation: 2,
          margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: widget.color,
                    shape: BoxShape.circle,
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    widget.route.routeShortName,
                    style: TextStyle(
                      fontSize: 32,
                      fontFamily: 'Franklin_Gothic_Medium',
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: RouteDirectionText(
                              start: start.toUpperCase(),
                              end: end.toUpperCase(),
                            ),
                          ),
                          // Иконка сердца
                          // GestureDetector(
                          //   child: Icon(
                          //     Icons.favorite_border_outlined,
                          //     size: 20,
                          //     color: Colors.grey,
                          //   ),
                          // ),
                        ],
                      ),
                      SizedBox(height: 4),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Text(
                                keyStops.isNotEmpty
                                    ? keyStops.toUpperCase()
                                    : 'Нет промежуточных остановок',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontFamily: 'Franklin_Gothic_Medium',
                                  color: Colors.grey,
                                ),
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            ArrivalBadge(nextTime: nextTime),
                          ]),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
