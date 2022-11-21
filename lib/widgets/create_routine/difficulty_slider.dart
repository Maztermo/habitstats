import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:habitstats/enums/difficulty_enum.dart';
import 'package:habitstats/providers/create_routine_controller.dart';

class DifficultySlider extends ConsumerWidget {
  const DifficultySlider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final difficulty = ref.watch(createRoutineControllerProvider).difficulty;
    return Column(
      children: [
        Text(DifficultyEnum.values[difficulty + -1].name),
        Slider(
          value: difficulty.toDouble(),
          onChanged: ref.read(createRoutineControllerProvider.notifier).updateDifficulty,
          max: 5,
          min: 1,
          divisions: 4,
          label: difficulty.toString(),
        ),
      ],
    );
  }
}
