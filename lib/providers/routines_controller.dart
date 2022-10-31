import 'package:flutter_riverpod/flutter_riverpod.dart';
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
}
