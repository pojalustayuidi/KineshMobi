import 'package:KineshmaApp/services/data/api_stops.dart';
import 'package:KineshmaApp/services/data/models/stop.dart';
import 'package:flutter/material.dart';

class TextfieldStopinput extends StatefulWidget {
  final ApiStops apiStops;

  const TextfieldStopinput({super.key, required this.apiStops});

  @override
  State<TextfieldStopinput> createState() => _TextfieldStopinputState();
}

class _TextfieldStopinputState extends State<TextfieldStopinput> {
  final TextEditingController _controller = TextEditingController();
  List<Widget> _routeWidget = [];
  final Map<String, Color> _routeColors = {
    '1': Color(0xFF0059FF), // 1
    '2': Color(0xFFD9C218), // 2
    '3': Color(0xFF50CB6F), // 3
    '3-a': Color(0xFF46C365), // 3-a
    '4': Color(0xFFFF0000), //4
    '5': Color(0xFFC92B2E), // 5
    '6': Color(0xFF505DCB), // 6
    '7': Color(0xFFAB9A58), // 7
    '8': Color(0xFF23F8E3), // 8
    '9': Color(0xFFD9C218), // 9
    '10': Color(0xFFD9C218), // 10
    '11': Color(0xFF474017), // 11
    '12': Color(0xFF99D918), // 12
    '13': Color(0xFFD9C218), // 13
    '14': Color(0xFFD9C218), // 14
  };
  Color darkenColor(Color color,[double amount = 0.1]){
    final hsl = HSLColor.fromColor(color);
    final hslDark = hsl.withLightness((hsl.lightness - amount).clamp(0.0, 1.0));
    return hslDark.toColor();
  }

  String? findNextArrivalTime(List<String> arrivalTimes) {
    final now = DateTime.now();
    final currentTime = now.hour * 60 + now.minute;
    String? nextTime;
    int minDifference = 24 * 60;
    for (final time in arrivalTimes) {
      final parts = time.split(":");
      final hour = int.parse(parts[0]);
      final minute = int.parse(parts[1]);
      final arrivalMinutes = hour * 60 + minute;
      int difference = arrivalMinutes - currentTime;
      if (difference < 0) {
        difference += 24 * 60;
      }
      if (difference < minDifference && difference >= 0) {
        minDifference = difference;
        nextTime = time;
      }
    }
    return nextTime;
  }

  void _searchRoute(String query) async {
    final stops = await widget.apiStops.getStopsList();
    final matchingStop = stops.firstWhere(
      (stop) => stop.name.toLowerCase() == query.toLowerCase(),
      orElse: () => Stop(name: '', id: -1),
    );

    if (matchingStop.id != -1) {
      final routes = await widget.apiStops.getRoutesByStop(matchingStop.id);
      if (routes.isNotEmpty) {
        // Формируем список всех маршрутов, проходящих через остановку
        final routeWidgets = <Widget>[];
        for (final route in routes) {
          final baseColor = _routeColors[route.routeShortName] ??  Colors.grey;
          if (route.forward
              .any((station) => station.stopId == matchingStop.id)) {
            final start = route.forward.first.name;
            final end = route.forward.last.name;
            final stop = route.forward
                .firstWhere((station) => station.stopId == matchingStop.id);
            final nextTime = findNextArrivalTime(stop.arrivalTimes) ??
                'Нет ближайших автобусов';
            final forwardColor = baseColor;
            routeWidgets.add(Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      color: forwardColor,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(
                        route.routeShortName,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('$start -> $end'),
                        Text('Ближайший автобус $nextTime')
                      ],
                    ),
                  ),
                ],
              ),
            ));
          }
          // Проверяем направление backward
          if (route.backward
              .any((station) => station.stopId == matchingStop.id)) {
            final start = route.backward.first.name;
            final end = route.backward.last.name;
            final stop = route.backward
                .firstWhere((station) => station.stopId == matchingStop.id);
            final nextTime = findNextArrivalTime(stop.arrivalTimes) ??
                'Нет ближайших рейсов';
            final backwardColor = darkenColor(baseColor);
            routeWidgets.add(Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  Container(
                    height: 30,
                    width: 30,
                    decoration:
                        BoxDecoration(shape: BoxShape.circle, color: backwardColor),
                    child: Center(
                      child: Text(route.routeShortName),
                    ),
                  ),
                  Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                        Text('$start -> $end'),
                        Text('Ближайший автобус $nextTime')
                                            ],
                                          ),
                      ))
                ],
              ),
            ));
          }
        }

        setState(() {
          if (routeWidgets.isNotEmpty) {
            _routeWidget = routeWidgets;
          } else {
            _routeWidget = [const Text("Маршруты не найдены")];
          }
        });
      } else {
        setState(() {
          _routeWidget = [const Text('Маршруты не найдены')];
        });
      }
    } else {
      setState(() {
        _routeWidget = [const Text('Остановка не найдена')];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          TextField(
            controller: _controller,
            decoration: const InputDecoration(
              labelText: 'Введите остановку',
              border: OutlineInputBorder(),
            ),
            onChanged: _searchRoute,
          ),
          const SizedBox(height: 16),
          Column(
            children: _routeWidget,
          )
        ],
      ),
    );
  }
}
