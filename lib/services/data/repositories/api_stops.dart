
import 'package:dio/dio.dart';

import '../models/route_destination.dart';
import '../models/stop.dart';


class ApiStops {

  final Dio _dio;
  ApiStops()
      : _dio = Dio(BaseOptions(
  baseUrl: 'https://wheremybus.fluttersquad.dev/api/v1',
  connectTimeout: const Duration(seconds: 5),
  receiveTimeout: const Duration(seconds: 3),
  ));
  Future <List<Stop>> getStopsList() async {
    try {
      final response = await _dio.get('/stops');
      final List<dynamic> stopsJson = response.data;
      return stopsJson.map((json) => Stop.fromJson(json)).toList();
    } catch (e) {
      print('Ошибка $e');
      return [];
    }
  }
  Future<List<RouteDestation>> getRoutesByStop(int stopId) async{
    try{
      final response = await _dio.get('/stops/$stopId/routes');
      final List<dynamic> routesJson = response.data;
    return routesJson.map((json) => RouteDestation.fromJson(json)).toList();
    } catch (e){
      print('Ошибка при получение остановки $e, $stopId');
      return [];
    }
  }
}