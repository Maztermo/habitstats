import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:habitstats/extensions/date_time_extensions.dart';
import 'package:habitstats/extensions/difficulty_extensions.dart';
import 'package:habitstats/models/routine.dart';
import 'package:habitstats/providers/routines_controller.dart';

class RoutineTile extends ConsumerWidget {
  final Routine routine;

  const RoutineTile({
    required this.routine,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        title: Text(
          '${routine.nextDueDateTime.inHowManyDays} - ${routine.title}',
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: Text('Done ${routine.routineCompletedDateTimes.length} times - ${routine.description}'),
        trailing: Icon(
          Icons.circle,
          color: routine.difficulty.difficultyColor,
        ),
        onTap: () => ref.read(routinesController.notifier).completedRoutine(oldRoutine: routine),
      ),
    );
  }
}
