import 'package:KineshmaApp/screens/screen_home/widgets_home/routes_color.dart';
import 'package:KineshmaApp/screens/screen_home/widgets_home/text_home_page.dart';
import 'package:KineshmaApp/services/data/api_stops.dart';
import 'package:KineshmaApp/services/data/models/stop.dart';
import 'package:flutter/material.dart';

import '../utils_home/darken_color_utils.dart';
import '../utils_home/time_utils.dart';

class TextfieldStopinput extends StatefulWidget {
  final ApiStops apiStops;

  const TextfieldStopinput({super.key, required this.apiStops});

  @override
  State<TextfieldStopinput> createState() => _TextfieldStopinputState();
}

class _TextfieldStopinputState extends State<TextfieldStopinput> {
  final TextEditingController _controller = TextEditingController();
  List<Widget> _routeWidgets = [];

  void _searchRoute(String query) async {
    if (query.isEmpty) {
      setState(() {
        _routeWidgets = [];
      });
      return;
    }

    final stops = await widget.apiStops.getStopsList();
    final matchingStop = stops.firstWhere(
          (stop) => stop.name.toLowerCase() == query.toLowerCase(),
      orElse: () => Stop(name: '', id: -1),
    );

    if (matchingStop.id == -1) {
      setState(() {
        _routeWidgets = [const Text('Остановка не найдена')];
      });
      return;
    }

    final routes = await widget.apiStops.getRoutesByStop(matchingStop.id);
    if (routes.isEmpty) {
      setState(() {
        _routeWidgets = [const Text('Маршруты не найдены')];
      });
      return;
    }

    final routeWidgets = <Widget>[];

    for (final route in routes) {
      final baseColor = routeColors[route.routeShortName] ?? Colors.grey;

      if (route.forward.any((station) => station.stopId == matchingStop.id)) {
        final stopIndex = route.forward.indexWhere((station) => station.stopId == matchingStop.id);
        final stop = route.forward[stopIndex];
        final nextStop = stopIndex + 1 < route.forward.length
            ? route.forward[stopIndex + 1].name
            : 'Конец маршрута';
        final start = stop.name;
        final end = route.forward.last.name;

        final nextTime = findNextArrivalTime(stop.arrivalTimes) ?? 'Нет ближайших автобусов';

        routeWidgets.add(
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: baseColor,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    route.routeShortName,
                    style: const TextStyle(
                      color: Color(0xFF4F378A),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '$start -> $nextStop -> $end',
                        style: const TextStyle(
                          color: Color(0xFF1D1B20),
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        'Ближайший автобус: $nextTime',
                        style: const TextStyle(
                          color: Color(0xFF667085),
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const Divider(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      }

      if (route.backward.any((station) => station.stopId == matchingStop.id)) {
        final stopIndex = route.backward.indexWhere((station) => station.stopId == matchingStop.id);
        final stop = route.backward[stopIndex];
        final nextStop = stopIndex - 1 >= 0
            ? route.backward[stopIndex - 1].name
            : 'Конец маршрута';
        final start = stop.name;
        final end = route.backward.first.name;

        final nextTime = findNextArrivalTime(stop.arrivalTimes) ?? 'Нет ближайших автобусов';
        final backwardColor = darkenColor(baseColor);

        routeWidgets.add(
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: backwardColor,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    route.routeShortName,
                    style: const TextStyle(
                      color: Color(0xFF4F378A),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '$start -> $nextStop -> $end',
                        style: const TextStyle(
                          color: Color(0xFF1D1B20),
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        'Ближайший автобус: $nextTime',
                        style: const TextStyle(
                          color: Color(0xFF667085),
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const Divider(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      }
    }

    setState(() {
      _routeWidgets = routeWidgets.isNotEmpty
          ? routeWidgets
          : [const Text('Маршруты не найдены')];
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Column(
      children: [
        SizedBox(
          width: screenWidth * 0.85,
          child: TextField(
            controller: _controller,
            decoration: const InputDecoration(
              hintText: 'Ваша остановка',
              hintStyle: TextStyle(color: Colors.grey),
              labelText: 'Введите остановку',
              border: OutlineInputBorder(),
            ),
            onChanged: _searchRoute,
          ),
        ),
        const SizedBox(height: 50),
        const TextMarshrut(),
        const SizedBox(height: 10),
        Column(children: _routeWidgets),
      ],
    );
  }
}
