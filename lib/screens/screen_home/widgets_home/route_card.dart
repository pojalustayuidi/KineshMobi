import 'package:KineshmaApp/screens/screen_home/utils_home/time_utils.dart';
import 'package:KineshmaApp/screens/screen_route_detail/screen_route_detail.dart';
import 'package:KineshmaApp/services/data/models/bus_station.dart';
import 'package:KineshmaApp/services/data/models/route_destination.dart';
import 'package:flutter/material.dart';

class RouteCard extends StatefulWidget {
  final RouteDestation route;
  final List<BusStation> direction;
  final Color color;
  final int stopId;

  const RouteCard({
    super.key,
    required this.route,
    required this.direction,
    required this.color,
    required this.stopId,
  });

  @override
  State<RouteCard> createState() => _RouteCardState();
}

class _RouteCardState extends State<RouteCard> {





  @override
  Widget build(BuildContext context) {
    List<BusStation> adjustedDirection = List.from(widget.direction);
    final isForward = widget.direction == widget.route.forward;

    int stopIndex = adjustedDirection.indexWhere((s) => s.stopId == widget.stopId);
    if (stopIndex == -1) return SizedBox();

    if (!isForward) {
      adjustedDirection = adjustedDirection.reversed.toList();
      stopIndex = adjustedDirection.indexWhere((s) => s.stopId == widget.stopId);
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
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: widget.color,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
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
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Flexible(
                            child: RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: '$start – $end',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: 'Century_Gothic',
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black,
                                    ),
                                  ),
                                  WidgetSpan(
                                    child: Padding(
                                      padding: EdgeInsets.only(left: 5.0),
                                      child: GestureDetector(
                                        child: Icon(Icons.heart_broken),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 4),
                      Text(
                        keyStops.isNotEmpty
                            ? keyStops.toUpperCase()
                            : 'Нет промежуточных остановок',
                        style: TextStyle(
                          fontSize: 12,
                          fontFamily: 'Franklin_Gothic_Medium',
                          color: Colors.grey,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 4),
                      Row(
                        children: [
                          Text(
                            'БУДЕТ В',
                            style: TextStyle(
                              fontSize: 20,
                              fontFamily: 'Century_Gothic',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 5),
                          Text(
                            nextTime,
                            style: TextStyle(
                              color: Color(0xFF234840),
                              fontSize: 23,
                              fontFamily: 'Century_Gothic',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Divider(),
        ],
      ),
    );
  }
}