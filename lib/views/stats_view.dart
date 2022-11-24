import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:habitstats/models/routine.dart';
import 'package:habitstats/providers/routines_controller.dart';

class StatsView extends ConsumerWidget {
  const StatsView({super.key});

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
        Row(
          children: [
            Container(
              color: Theme.of(context).colorScheme.primary,
              height: 20,
              width: 20,
            ),
            Container(
              color: Theme.of(context).colorScheme.secondary,
              height: 20,
              width: 20,
            ),
            Container(
              color: Theme.of(context).colorScheme.tertiary,
              height: 20,
              width: 20,
            ),
          ],
        ),
      ],
    );
  }
}
