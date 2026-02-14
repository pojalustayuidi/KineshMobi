import 'package:KineshmaApp/screens/screen_home/utils_home/time_utils.dart';
import 'package:KineshmaApp/screens/screen_route_detail/screen_route_detail.dart';
import 'package:KineshmaApp/services/data/models/bus_station.dart';
import 'package:KineshmaApp/services/data/models/route_destination.dart';
import 'package:flutter/material.dart';

import '../../../main_widget/arrival_badge.dart';

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
    if (stopIndex == -1) return const SizedBox();

    if (!isForward) {
      adjustedDirection = adjustedDirection.reversed.toList();
      stopIndex =
          adjustedDirection.indexWhere((s) => s.stopId == widget.stopId);
    }

    adjustedDirection[stopIndex].name.toUpperCase();
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
      child: Container(
        width: MediaQuery.of(context).size.width * 0.9,
        margin: const EdgeInsets.symmetric(vertical: 2),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          color: Colors.white,
          elevation: 3,
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [  const SizedBox(width: 10),
                Container(
                  width: 42,
                  height: 42,
                  decoration: BoxDecoration(
                    color: widget.color,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: widget.color.withOpacity(0.3),
                        blurRadius: 6,
                        offset: const Offset(0, 4),
                      )
                    ],
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    widget.route.routeShortName,
                    style: const TextStyle(
                      fontSize: 20,
                      fontFamily: 'Franklin_Gothic_Medium',
                      fontWeight: FontWeight.w900,
                      color: Colors.black,
                    ),
                  ),
                ),


                const SizedBox(width: 10),

                Expanded(
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.133,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          end,
                          style: const TextStyle(
                            fontSize: 14,
                            fontFamily: 'Franklin_Gothic_Medium',
                            fontWeight: FontWeight.w900,
                            color: Colors.black,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),

                        Text(
                          keyStops.isNotEmpty
                              ? keyStops
                              : 'Нет промежуточных остановок',
                          style: const TextStyle(
                            fontSize: 10,
                            fontFamily: 'Franklin_Gothic_Medium',
                            color: Color(0xFF666666),
                            fontWeight: FontWeight.w400,
                            height: 1.2,
                          ),
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(width: 8),
                ArrivalBadge(nextTime: nextTime),
              ],
            ),
          ),
        ),
      ),
    );
  }
}