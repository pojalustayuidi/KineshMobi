

import 'bus_station.dart';

class RouteDestation {
  final List<BusStation> forward;
  final List<BusStation> backward;
  final int routeId;
  final String routeShortName;

  RouteDestation({
    required this.forward,
    required this.backward,
    required this.routeId,
    required this.routeShortName,
  });

  factory RouteDestation.fromJson(Map<String, dynamic> json) {
    return RouteDestation(
        forward: (json['forward'] as List)
            .map((e) => BusStation.fromJson(e as Map<String, dynamic>))
            .toList(),
        backward: (json['backward'] as List)
            .map((e) => BusStation.fromJson(e as Map<String, dynamic>))
            .toList(),
        routeId: json['route_id'] as int,
        routeShortName: json['route_short_name'] as String);
  }
  Map<String, dynamic> toJson(){
    return {
      'forward' : forward.map((e) => e.toJson()).toList(),
      'backward' : backward.map((e)=> e.toJson()).toList(),
      'route_id' : routeId,
      'route_short_name' : routeShortName,
    };
  }
}
