import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:habitstats/extensions/date_time_extensions.dart';
import 'package:habitstats/models/routine.dart';
import 'package:habitstats/providers/routines_controller.dart';

class RoutineTile extends ConsumerWidget {
  final Routine routine;

  const RoutineTile({
    required this.routine,
    super.key,
  });

  Color setColorByDifficulty(difficulty) {
    switch (difficulty) {
      case 1:
        return Colors.green[200]!;
      case 2:
        return Colors.green[400]!;
      case 3:
        return Colors.yellow[600]!;
      case 4:
        return Colors.orange[600]!;
      case 5:
        return Colors.red[600]!;

      default:
        return Colors.grey[600]!;
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      child: ListTile(
        title: Text('${routine.title} - ${routine.nextDueDateTime.inHowManyDays}'),
        subtitle: Text('Done ${routine.routineCompletedDateTimes.length} times - ${routine.description}'),
        trailing: Icon(
          Icons.circle,
          color: setColorByDifficulty(routine.difficulty),
        ),
        onTap: () => ref.read(routinesController.notifier).completedRoutine(oldRoutine: routine),
      ),
    );
  }
}
