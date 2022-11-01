extension DateTimeExtension on DateTime {
  String get presentableDateString {
    return '$day. $month $year';
  }

  bool isTheSameDayAs(DateTime otherDate) {
    return day == otherDate.day && month == otherDate.month && year == otherDate.year;
  }

  String get inHowManyDays {
    final from = DateTime.now();
    final to = this;
    final theSameDay = isTheSameDayAs(from);

    if (theSameDay) return 'today';

    final daysLeft = (to.difference(from).inHours / 24).round();

    if (daysLeft == 0) return 'tomorrow';
    if (daysLeft == 1) return 'in $daysLeft day';
    return 'in $daysLeft days';
  }
}
