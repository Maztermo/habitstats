import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:habitstats/providers/create_routine_controller.dart';

class DifficultySlider extends ConsumerWidget {
  const DifficultySlider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final difficulty = ref.watch(createRoutineControllerProvider).difficulty;
    return (difficulty == null)
        ? ElevatedButton(
            onPressed: () {
              ref.read(createRoutineControllerProvider.notifier).updateDifficulty(1);
              ref.read(createRoutineControllerProvider.notifier).validateForm();
            },
            child: const Text('Select'),
          )
        : Slider(
            value: difficulty.toDouble(),
            onChanged: ref.read(createRoutineControllerProvider.notifier).updateDifficulty,
            max: 5,
            min: 1,
            divisions: 4,
            label: difficulty.toString(),
          );
  }
}
