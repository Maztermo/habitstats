extension DateTimeExtension on DateTime {
  DateTime get todayAsUtc {
    final now = DateTime.now();
    final todayAsUtc = DateTime.utc(now.year, now.month, now.day);
    return todayAsUtc;
  }

  String get presentableDateString {
    return '$day. $month $year';
  }

  bool get isToday {
    return (year == todayAsUtc.year && month == todayAsUtc.month && day == todayAsUtc.day);
  }

  String get inHowManyDays {
    final from = DateTime.now();
    final to = this;

    if (isToday) return 'today';

    final daysLeft = (to.difference(from).inHours / 24).ceil();

    if (daysLeft == 1) return 'tomorrow';

    return 'in $daysLeft days';
  }

  bool isTheSameDayAs(DateTime otherDate) {
    return day == otherDate.day && month == otherDate.month && year == otherDate.year;
  }
}
