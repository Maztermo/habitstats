import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:habitstats/extensions/date_time_extensions.dart';
import 'package:habitstats/providers/create_routine_controller.dart';

class StartTimePicker extends ConsumerWidget {
  const StartTimePicker({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nextDueDateTime = ref.watch(createRoutineControllerProvider).nextDueDateTime;
    final dateFormatted = '${nextDueDateTime.day}.${nextDueDateTime.month}.${nextDueDateTime.year}';
    return Column(
      children: [
        Text(nextDueDateTime.isToday ? 'Today' : dateFormatted),
        ElevatedButton(
          onPressed: () {
            ref.read(createRoutineControllerProvider.notifier).pickNextDueDateTime(context);
            ref.read(createRoutineControllerProvider.notifier).validateForm();
          },
          child: const Text('Select another date'),
        )
      ],
    );
  }
}
