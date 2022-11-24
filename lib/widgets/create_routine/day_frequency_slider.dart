import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:habitstats/enums/frequency_enum.dart';
import 'package:habitstats/extensions/frequency_enum_extensions.dart';
import 'package:habitstats/providers/create_routine_controller.dart';

class DayFrequencySlider extends ConsumerWidget {
  const DayFrequencySlider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dayFrequency = ref.watch(createRoutineControllerProvider).dayFrequency;

    return Column(
      children: [
        Row(
          children: [
            Text(
              'How often: ',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const Spacer(),
            Text(
              FrequencyEnum.values[dayFrequency + -1].uiText,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Theme.of(context).colorScheme.secondary),
            ),
          ],
        ),
        Slider(
          value: dayFrequency.toDouble(),
          onChanged: ref.read(createRoutineControllerProvider.notifier).updateDayFrequency,
          max: 5,
          min: 1,
          divisions: 4,
        ),
      ],
    );
  }
}
