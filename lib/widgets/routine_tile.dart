import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:habitstats/models/routine.dart';

class RoutineTile extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(routine.title ?? 'missing title'),
        subtitle: Text(routine.description ?? 'missing description'),
        trailing: Icon(
          Icons.circle,
          color: setColorByDifficulty(routine.difficulty),
        ),
      ),
    );
  }
}
