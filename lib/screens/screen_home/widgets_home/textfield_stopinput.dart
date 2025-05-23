import 'package:flutter/material.dart';
import 'package:KineshmaApp/screens/screen_home/widgets_home/routes_color.dart';
import 'package:KineshmaApp/screens/screen_home/widgets_home/route_card.dart';
import 'package:KineshmaApp/screens/screen_home/widgets_home/text_home_page.dart';
import 'package:KineshmaApp/screens/screen_home/widgets_home/stop_dropdown.dart';
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
  List<Widget> _routeWidgets = [];
  List<Stop> _allStops = [];
  Stop? _selectedStop;

  @override
  void initState() {
    super.initState();
    _loadStops();
  }

  Future<void> _loadStops() async {
    final stops = await widget.apiStops.getStopsList();
    setState(() {
      _allStops = stops;
    });
  }

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

  void _searchRoute(Stop? selectedStop) async {
    setState(() {
      _selectedStop = selectedStop;
    });

    if (selectedStop == null ) {
      setState(() => _routeWidgets = [const Text('Введите свою остановку в поле выше')]);
      return;
    }

    final routes = await widget.apiStops.getRoutesByStop(selectedStop.id);
    if (routes.isEmpty) {
      setState(() => _routeWidgets = [const Text('Маршруты не найдены')]);
      return;
    }

    final allCards = <Map<String, dynamic>>[];

    for (final route in routes) {
      final baseColor = routeColors[route.routeShortName] ?? Colors.grey;

      void addDirection(List<BusStation> direction, Color color) {
        final index = direction.indexWhere((s) => s.stopId == selectedStop.id);
        if (index != -1) {
          final nextArrival = _getNextArrivalTime(direction[index].arrivalTimes);
          allCards.add({
            'route': route,
            'direction': direction,
            'color': color,
            'stopId': selectedStop.id,
            'nextArrival': nextArrival,
          });
        }
      }

      addDirection(route.forward, baseColor);
      addDirection(route.backward, darkenColor(baseColor));
    }

    // Sort by next arrival time
    allCards.sort((a, b) => a['nextArrival'].compareTo(b['nextArrival']));

    // Create widgets
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
return GestureDetector(
  onTap: (){FocusScope.of(context).unfocus();},
     child:  Column(
      children: [
        StopDropdown(
          stops: _allStops,
          selectedStop: _selectedStop,
          onChanged: _searchRoute,
          width: screenWidth * 0.85,
        ),
        const SizedBox(height: 50),
        const TextMarshrut(),
        const SizedBox(height: 10),
        Column(children: _routeWidgets),
      ],
    ),);
  }
}