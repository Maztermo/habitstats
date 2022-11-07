import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:habitstats/models/routine.dart';
import 'package:habitstats/providers/routines_state.dart';
import 'package:habitstats/services/db_service.dart';

final routinesController = StateNotifierProvider<RoutinesController, RoutinesState>(
  (ref) => RoutinesController(
      // Initial setup
      const RoutinesState(
    routines: [], // Could maybe be set sync?
  )),
);

class RoutinesController extends StateNotifier<RoutinesState> {
  RoutinesController(
    RoutinesState state,
  ) : super(state) {
    initialAsyncSetup();
  }

  Future<void> initialAsyncSetup() async {
    await updateRoutines();
  }

  Future<void> updateRoutines() async {
    final routines = await DataBaseService.instance.allRoutines;
    state = state.copyWith(routines: routines);
  }

  void completedRoutine({required Routine oldRoutine}) async {
    final newRoutine = Routine()
      ..id = oldRoutine.id
      ..title = oldRoutine.title
      ..description = oldRoutine.description
      ..difficulty = oldRoutine.difficulty
      ..dayFrequency = oldRoutine.dayFrequency
      ..nextDueDateTime = oldRoutine.nextDueDateTime.add(Duration(days: oldRoutine.dayFrequency))
      ..routineCompletedDateTimes = oldRoutine.routineCompletedDateTimes;

    newRoutine.routineCompletedDateTimes.add(DateTime.now().toUtc());
    await DataBaseService.instance.updateRoutine(newRoutine: newRoutine);
    await updateRoutines();
  }

  void deleteFirstTask() async {
    final oldRoutine = state.routines.first;

    await DataBaseService.instance.deleteRoutine(routine: oldRoutine);
    await updateRoutines();
  }
}
