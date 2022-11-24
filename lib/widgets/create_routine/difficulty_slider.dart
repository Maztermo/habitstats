import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:habitstats/enums/difficulty_enum.dart';
import 'package:habitstats/extensions/difficulty_enum_extensions.dart';
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
        Row(
          children: [
            Text(
              'How difficult: ',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const Spacer(),
            Text(
              DifficultyEnum.values[difficulty + -1].uiText,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Theme.of(context).colorScheme.secondary),
            ),
          ],
        ),
        Slider(
          value: difficulty.toDouble(),
          onChanged: ref.read(createRoutineControllerProvider.notifier).updateDifficulty,
          max: 5,
          min: 1,
          divisions: 4,
        ),
      ],
    );
  }
}
