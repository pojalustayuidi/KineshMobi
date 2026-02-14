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
String getTimeDifference(String arrivalTime) {
  // Проверяем, не является ли это уже расчетным временем
  if (arrivalTime.contains('минут') ||
      arrivalTime.contains('час') ||
      arrivalTime.contains('ч ') ||
      arrivalTime == 'Сейчас' ||
      arrivalTime == '<1 минуты') {
    return arrivalTime;
  }

  // Проверяем формат HH:MM
  if (!arrivalTime.contains(':') || arrivalTime.split(':').length != 2) {
    return arrivalTime;
  }

  try {
    final now = DateTime.now();
    final parts = arrivalTime.split(':');

    final hour = int.parse(parts[0]);
    final minute = int.parse(parts[1]);

    // Создаем время на сегодня
    final arrivalToday = DateTime(now.year, now.month, now.day, hour, minute);

    // Создаем время на завтра
    final arrivalTomorrow = arrivalToday.add(const Duration(days: 1));

    // Выбираем ближайшее будущее время
    final isToday = arrivalToday.isAfter(now.subtract(const Duration(minutes: 10)));
    final arrival = isToday ? arrivalToday : arrivalTomorrow;

    final difference = arrival.difference(now);
    final seconds = difference.inSeconds;

    // Если автобус только что уехал (до 5 минут назад)
    if (seconds <= -300) { // -5 минут
      // Это на завтра
      final arrivalRealTomorrow = arrivalTomorrow.add(const Duration(days: 0));
      final diffTomorrow = arrivalRealTomorrow.difference(now);
      return _formatDifference(diffTomorrow);
    }

    return _formatDifference(difference);
  } catch (e) {
    return arrivalTime;
  }
}

String _formatDifference(Duration difference) {
  final totalSeconds = difference.inSeconds;

  if (totalSeconds < 60) {
    return totalSeconds <= 30 ? 'Сейчас' : '<1 минуты';
  }

  final minutes = (totalSeconds / 60).ceil();

  if (minutes < 60) {
    if (minutes == 1) return '1 минута';
    if (minutes <= 4) return '$minutes минуты';
    return '$minutes минут';
  }

  final hours = minutes ~/ 60;
  final remainingMinutes = minutes % 60;

  if (remainingMinutes == 0) {
    return hours == 1 ? '1 час' : '$hours часов';
  } else if (remainingMinutes <= 4) {
    return '$hours ч $remainingMinutes минуты';
  } else {
    return '$hours ч $remainingMinutes минут';
  }
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