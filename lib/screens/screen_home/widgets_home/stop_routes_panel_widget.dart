import 'dart:async';

import 'package:KineshmaApp/screens/screen_home/widgets_home/full_schedule_card_widget.dart';
import 'package:KineshmaApp/screens/screen_home/widgets_home/selected_stop_header.dart';
import 'package:KineshmaApp/screens/screen_home/widgets_home/simple_stop_search_field.dart';
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
  Timer? timer;

  @override
  void initState() {
    super.initState();
    _loadStops();
    _startMinuteTimer();
  }

  void _startMinuteTimer() {
    final now = DateTime.now();
    final int secondsUntilNextMinute = 60 - now.second;
    final int msUntilNextMinute = secondsUntilNextMinute * 1000 - now.millisecond;

    Timer(Duration(milliseconds: msUntilNextMinute), () {
      _updateRoutes();
      timer = Timer.periodic(const Duration(minutes: 1), (_) {
        _updateRoutes();
      });
    });
  }

  void _updateRoutes() {
    _loadStops();
    if (_selectedStop != null) {
      _searchRoute(_selectedStop);
    }
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
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
        _nearestWidgets = [];
        _fullScheduleWidgets = [];
      });
      return;
    }

    final routes = await widget.apiStops.getRoutesByStop(selectedStop.id);

    if (routes.isEmpty) {
      setState(() {
        _nearestWidgets = [const MessageDisplay(message: 'Маршруты не найдены')];
        _fullScheduleWidgets = [const MessageDisplay(message: 'Маршруты не найдены')];
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
          final nextArrival =
          _getNextArrivalTime(direction[index].arrivalTimes);
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
        nextArrival: card['nextArrival'],
      ))
          .toList()
          : [const MessageDisplay(message: 'Маршруты не найдены')];

      _fullScheduleWidgets = fullCards.isNotEmpty
          ? fullCards
          : [const MessageDisplay(message: 'Маршруты не найдены')];
    });
  }

  // Метод для смены остановки
  void _changeStop() {
    setState(() {
      _selectedStop = null;
      _nearestWidgets = [];
      _fullScheduleWidgets = [];
    });
  }

  // Метод для очистки остановки
  void _clearStop() {
    setState(() {
      _selectedStop = null;
      _nearestWidgets = [];
      _fullScheduleWidgets = [];
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
              // Всегда показываем поле поиска (если не выбрана остановка)
              if (_selectedStop == null)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Красивая подсказка над полем поиска
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),
                      margin: const EdgeInsets.only(bottom: 16),
                      decoration: BoxDecoration(
                        color: Colors.blue[50],
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: Colors.blue[100]!,
                          width: 1,
                        ),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.info_outline,
                            color: Colors.blue[700],
                            size: 20,
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Найдите свою остановку',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontFamily: 'Franklin_Gothic_Medium',
                                    fontWeight: FontWeight.w600,
                                    color: Colors.blue[700],
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  'Начните вводить название остановки, чтобы увидеть расписание маршрутов',
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontFamily: 'Franklin_Gothic_Medium',
                                    color: Colors.grey[600],
                                    height: 1.4,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Поле поиска
                    SimpleStopSearchField(
                      stops: _allStops,
                      selectedStop: _selectedStop,
                      onChanged: _searchRoute,
                      width: screenWidth * 0.9,
                    ),
                  ],
                )
              else
              // Если остановка выбрана - показываем заголовок
                SelectedStopHeader(
                  selectedStop: _selectedStop!,
                  onTapChange: _changeStop,
                  onTapClear: _clearStop,
                ),

              const SizedBox(height: 16),

              // Показываем табы только если остановка выбрана
              if (_selectedStop != null)
                TabsSchedules(
                  nearestWidget: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [..._nearestWidgets],
                  ),
                  fullScheduleWidget: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ..._fullScheduleWidgets,
                      const SizedBox(width: 50),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}