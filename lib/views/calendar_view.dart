import 'package:flutter/material.dart';
import 'package:habitstats/extensions/date_time_extensions.dart';
import 'package:habitstats/widgets/day.dart';
import 'package:habitstats/widgets/month.dart';
import 'package:paged_vertical_calendar/paged_vertical_calendar.dart';

class CalendarView extends StatelessWidget {
  const CalendarView({super.key});

  @override
  Widget build(BuildContext context) {
    final today = DateTime.now().toUtc();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: PagedVerticalCalendar(
        addAutomaticKeepAlives: true,
        startWeekWithSunday: false,
        dayBuilder: (context, date) => Day(
          date: date,
          isToday: date.isTheSameDayAs(today),
        ),
        monthBuilder: (context, month, year) => Month(month: month, year: year),
        onDayPressed: null,
        invisibleMonthsThreshold: 1,
        minDate: today.subtract(const Duration(days: 365)),
        maxDate: today.add(const Duration(days: 365)),
      ),
    );
  }
}
