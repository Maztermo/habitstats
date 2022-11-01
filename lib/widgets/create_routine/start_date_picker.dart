import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:habitstats/providers/create_routine_controller.dart';

class StartTimePicker extends ConsumerWidget {
  const StartTimePicker({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final startDateTime = ref.watch(createRoutineControllerProvider).startDateTime;
    return (startDateTime == null)
        ? ElevatedButton(
            onPressed: () {
              ref.read(createRoutineControllerProvider.notifier).pickStartDateTime(context);
              ref.read(createRoutineControllerProvider.notifier).validateForm();
            },
            child: const Text('Select'),
          )
        : Column(
            children: [
              Text('${startDateTime.day}.${startDateTime.month}.${startDateTime.year}'),
              ElevatedButton(
                onPressed: () {
                  ref.read(createRoutineControllerProvider.notifier).pickStartDateTime(context);
                  ref.read(createRoutineControllerProvider.notifier).validateForm();
                },
                child: const Text('Select another date'),
              )
            ],
          );
  }
}
