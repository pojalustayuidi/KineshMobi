class BusStation {
  final List<String> arrivalTimes;
  final String name;
  final int sequence;
  final int stopId;

  BusStation(
      {required this.arrivalTimes,
      required this.name,
      required this.sequence,
      required this.stopId});

  factory BusStation.fromJson(Map<String, dynamic> json) {
    return BusStation(
        arrivalTimes: List<String>.from(json['arrival_times']),
        name: json['name'] as String,
        sequence: json['sequence'] as int ,
        stopId: json['stop_id'] as int);
  }

  Map<String, dynamic> toJson() {
    return {
      'arrival_times': arrivalTimes,
      'name': name,
      'sequence': sequence,
      'stop_id': stopId,
    };
  }
}
