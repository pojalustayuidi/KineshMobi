import 'package:flutter/material.dart';
import 'package:KineshmaApp/screens/screen_home/widgets_home/routes_color.dart';
import 'package:KineshmaApp/screens/screen_home/widgets_home/route_card.dart';
import 'package:KineshmaApp/screens/screen_home/widgets_home/text_home_page.dart';
import 'package:KineshmaApp/services/data/repositories/api_stops.dart';
import 'package:KineshmaApp/services/data/models/stop.dart';
import 'package:KineshmaApp/services/data/models/bus_station.dart';
import '../utils_home/darken_color_utils.dart';

class TextfieldStopinput extends StatefulWidget {
  final ApiStops apiStops;

  const TextfieldStopinput({super.key, required this.apiStops});

  @override
  State<TextfieldStopinput> createState() => _TextfieldStopinputState();
}

class _TextfieldStopinputState extends State<TextfieldStopinput> {
  final TextEditingController _controller = TextEditingController();
  List<Widget> _routeWidgets = [];

  // Вспомогательная функция для получения ближайшего времени прибытия
  String _getNextArrivalTime(List<String> arrivalTimes) {
    final now = DateTime.now();
    final currentTime = '${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}';

    final sortedTimes = arrivalTimes..sort();
    for (final time in sortedTimes) {
      if (time.compareTo(currentTime) >= 0) {
        return time;
      }
    }
    return '23:59';
  }

  void _searchRoute(String query) async {
    if (query.isEmpty) {
      setState(() => _routeWidgets = []);
      return;
    }

    final stops = await widget.apiStops.getStopsList();
    final matchingStop = stops.firstWhere(
          (stop) => stop.name.toLowerCase() == query.toLowerCase(),
      orElse: () => Stop(name: '', id: -1),
    );

    if (matchingStop.id == -1) {
      setState(() => _routeWidgets = [const Text('Остановка не найдена')]);
      return;
    }

    final routes = await widget.apiStops.getRoutesByStop(matchingStop.id);
    if (routes.isEmpty) {
      setState(() => _routeWidgets = [const Text('Маршруты не найдены')]);
      return;
    }

    // Общий список для всех маршрутов
    final allCards = <Map<String, dynamic>>[];

    for (final route in routes) {
      final baseColor = routeColors[route.routeShortName] ?? Colors.grey;

      void addDirection(List<BusStation> direction, Color color) {
        final index = direction.indexWhere((s) => s.stopId == matchingStop.id);
        if (index != -1) {
          final nextArrival = _getNextArrivalTime(direction[index].arrivalTimes);
          allCards.add({
            'route': route,
            'direction': direction,
            'color': color,
            'stopId': matchingStop.id,
            'nextArrival': nextArrival,
          });
        }
      }

      addDirection(route.forward, baseColor);
      addDirection(route.backward, darkenColor(baseColor));
    }

    // Сортировка по ближайшему времени прибытия
    allCards.sort((a, b) => a['nextArrival'].compareTo(b['nextArrival']));

    // Формируем виджеты
    final widgets = allCards.map<Widget>((card) => RouteCard(
      route: card['route'],
      direction: card['direction'],
      color: card['color'],
      stopId: card['stopId'],
    )).toList();

    setState(() => _routeWidgets = widgets.isNotEmpty ? widgets : [const Text('Маршруты не найдены')]);
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