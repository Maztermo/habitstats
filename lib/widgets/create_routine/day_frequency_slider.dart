import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:habitstats/providers/create_routine_controller.dart';

class DayFrequencySlider extends ConsumerWidget {
  const DayFrequencySlider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dayFrequency = ref.watch(createRoutineControllerProvider).dayFrequency;
    return (dayFrequency == null)
        ? ElevatedButton(
            onPressed: () {
              ref.read(createRoutineControllerProvider.notifier).updateDayFrequency(1);
              ref.read(createRoutineControllerProvider.notifier).validateForm();
            },
            child: const Text('Select'),
          )
        : Slider(
            value: dayFrequency.toDouble(),
            onChanged: ref.read(createRoutineControllerProvider.notifier).updateDayFrequency,
            max: 5,
            min: 1,
            divisions: 4,
            label: dayFrequency.toString(),
          );
  }
}
