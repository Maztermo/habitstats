import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:habitstats/models/routine.dart';
import 'package:habitstats/providers/routines_controller.dart';
import 'package:habitstats/widgets/day.dart';
import 'package:habitstats/widgets/month.dart';
import 'package:habitstats/widgets/routine_tile.dart';
import 'package:paged_vertical_calendar/paged_vertical_calendar.dart';

class Page1 extends ConsumerWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<Routine> routines = ref.watch(routinesController).routines;
    return Padding(
      padding: const EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
      child: Column(
        children: [
          Text(
            'Motivational words here',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          Expanded(
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: routines.length,
              itemBuilder: ((context, index) {
                final routine = routines[index];
                return RoutineTile(routine: routine);
              }),
            ),
          ),
        ],
      ),
    );
  }
}

class Page2 extends StatelessWidget {
  const Page2({super.key});

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
          isToday: today.day == date.day && today.month == date.month && today.year == date.year, // move out this logic
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

class Page3 extends ConsumerWidget {
  const Page3({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<Routine> routines = ref.watch(routinesController).routines;
    return Column(
      children: [
        Text(
          'Routines: ${routines.length}',
          style: Theme.of(context).textTheme.headline4,
        ),
        Text(
          'Some other stat: ${routines.length}',
          style: Theme.of(context).textTheme.headline4,
        ),
      ],
    );
  }
}
