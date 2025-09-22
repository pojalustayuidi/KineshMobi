import 'package:KineshmaApp/screens/screen_home/widgets_home/full_schedule_card_widget.dart';
import 'package:KineshmaApp/screens/screen_home/widgets_home/stop_auto_complete_field.dart';
import 'package:KineshmaApp/screens/screen_home/widgets_home/tabs_schedule.dart';
import 'package:flutter/material.dart';
import 'package:KineshmaApp/screens/screen_home/widgets_home/routes_color.dart';
import 'package:KineshmaApp/screens/screen_home/widgets_home/route_card.dart';
import 'package:KineshmaApp/services/data/repositories/api_stops.dart';
import 'package:KineshmaApp/services/data/models/stop.dart';
import 'package:KineshmaApp/services/data/models/bus_station.dart';
import '../utils_home/darken_color_utils.dart';
import 'message_display_widget.dart';

class StopRoutesPanel extends StatefulWidget {
  final ApiStops apiStops;

  const StopRoutesPanel({super.key, required this.apiStops});

  @override
  State<StopRoutesPanel> createState() => _StopRoutesPanelState();
}

class _StopRoutesPanelState extends State<StopRoutesPanel> {
  List<Widget> _nearestWidgets = [];
  List<Widget> _fullScheduleWidgets = [];
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
    final currentTime =
        '${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}';
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
      _nearestWidgets = [];
      _fullScheduleWidgets = [];
    });

    if (selectedStop == null) {
      setState(() {
        _nearestWidgets = [const Text('Введите свою остановку в поле выше')];
        _fullScheduleWidgets = [const Text('Введите свою остановку в поле выше')];
      });
      return;
    }

    final routes = await widget.apiStops.getRoutesByStop(selectedStop.id);

    if (routes.isEmpty) {
      setState(() {
        _nearestWidgets = [const Text('Маршруты не найдены')];
        _fullScheduleWidgets = [const Text('Маршруты не найдены')];
      });
      return;
    }

    final nearestCards = <Map<String, dynamic>>[];
    final fullCards = <Widget>[];

    for (final route in routes) {
      final baseColor = routeColors[route.routeShortName] ?? Colors.grey;

      void addDirection(List<BusStation> direction, Color color) {
        final index = direction.indexWhere((s) => s.stopId == selectedStop.id);
        if (index != -1) {
          final nextArrival = _getNextArrivalTime(direction[index].arrivalTimes);
          nearestCards.add({
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

      // Полное расписание
      fullCards.add(FullScheduleCard(route: route));
    }

    nearestCards.sort((a, b) => a['nextArrival'].compareTo(b['nextArrival']));

    setState(() {
      _nearestWidgets = nearestCards.isNotEmpty
          ? nearestCards
          .map((card) => RouteCard(
        route: card['route'],
        direction: card['direction'],
        color: card['color'],
        stopId: card['stopId'],
      ))
          .toList()
          : [const MessageDisplay(message: 'Маршруты не найдены')];

      _fullScheduleWidgets = fullCards.isNotEmpty
          ? fullCards
          : [const MessageDisplay(message: 'Маршруты не найдены')];
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              StopAutocompleteField(
                stops: _allStops,
                selectedStop: _selectedStop,
                onChanged: _searchRoute,
                width: screenWidth * 0.85,
              ),
              const SizedBox(height: 16),
              TabsSchedules(
                nearestWidget: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [..._nearestWidgets],
                ),
                fullScheduleWidget: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [..._fullScheduleWidgets,SizedBox(width: 50,) ],
                ),
              ),
           ],
          ),
        ),
      ),
    );
  }
}

