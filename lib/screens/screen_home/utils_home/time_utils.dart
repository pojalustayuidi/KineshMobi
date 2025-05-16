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
      nextTime = '$hour:${minute.toString().padLeft(2, '0')}';
    }
  }
  return nextTime;
}