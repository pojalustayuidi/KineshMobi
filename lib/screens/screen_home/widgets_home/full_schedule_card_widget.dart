import 'package:flutter/material.dart';
import '../../../services/data/models/bus_station.dart';
import 'package:KineshmaApp/services/data/models/route_destination.dart';

class FullScheduleCard extends StatelessWidget {
  final RouteDestation route;

  const FullScheduleCard({super.key, required this.route});

  List<String> _getNextThreeTimes(List<String> times) {
    final now = DateTime.now();
    final currentTime =
        '${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}';

    final sorted = List<String>.from(times)..sort();
    final upcoming = sorted.where((t) => t.compareTo(currentTime) >= 0).toList();

    if (upcoming.length >= 3) {
      return upcoming.take(3).toList();
    } else {
      return upcoming;
    }
  }

  Widget _buildDirection(String title, List<BusStation> stations) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        const SizedBox(height: 6),
        ...stations.map((station) {
          final times = _getNextThreeTimes(station.arrivalTimes);
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(child: Text(station.name)),
                Text(times.isNotEmpty ? times.join(', ') : '—'),
              ],
            ),
          );
        }),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Маршрут ${route.routeShortName}",
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const Divider(),
            _buildDirection("Прямое направление", route.forward),
            const SizedBox(height: 12),
            _buildDirection("Обратное направление", route.backward),
          ],
        ),
      ),
    );
  }
}
