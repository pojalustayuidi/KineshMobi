import 'package:KineshmaApp/services/data/models/route_destination.dart';
import 'package:flutter/material.dart';
import 'bus_station.dart';
class RouteCardData {
  final RouteDestation route;
  final List<BusStation> direction;
  final Color color;
  final int stopId;
  final DateTime? nextArrival;

  RouteCardData({
    required this.route,
    required this.direction,
    required this.color,
    required this.stopId,
    required this.nextArrival,
  });
}
