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
int _timeToMinutes(String time) {
  final formattedTime = formatTimeWithoutSeconds(time);
  final parts = formattedTime.split(":");
  final hour = int.tryParse(parts[0]) ?? 0;
  final minute = int.tryParse(parts[1]) ?? 0;
  return hour * 60 + minute;
}

String formatTimeWithoutSeconds(String time) {
  final parts = time.split(":");
  if (parts.length >= 2) {
    return '${parts[0]}:${parts[1]}';
  }
  return time;
}
String? findNextTimeAfter(List<String> times, String previousTime) {
  final previousMinutes = _timeToMinutes(previousTime);
  String? nextTime;
  int minDiff = 24 * 60;

  for (final time in times) {
    final minutes = _timeToMinutes(time);
    final diff = minutes - previousMinutes;
    if (diff <= 0) continue;

    if (diff < minDiff) {
      minDiff = diff;
      nextTime = formatTimeWithoutSeconds(time);
    }
  }
  return nextTime;
}