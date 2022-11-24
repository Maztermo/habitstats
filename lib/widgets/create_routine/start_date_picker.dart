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
    return Row(
      children: [
        Text(
          'Start date: ',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        const Spacer(),
        Text(
          nextDueDateTime.isToday ? 'Today' : dateFormatted,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Theme.of(context).colorScheme.secondary),
        ),
        IconButton(
          onPressed: () {
            ref.read(createRoutineControllerProvider.notifier).pickNextDueDateTime(context);
            ref.read(createRoutineControllerProvider.notifier).validateForm();
          },
          icon: Icon(
            Icons.edit,
            color: Theme.of(context).colorScheme.secondary,
          ),
        ),
      ],
    );
  }
}
