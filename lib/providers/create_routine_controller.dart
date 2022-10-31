import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:habitstats/providers/create_routine_state.dart';
import 'package:habitstats/providers/routines_controller.dart';
import 'package:habitstats/services/db_service.dart';

final createRoutineControllerProvider = StateNotifierProvider<CreateRoutineController, CreateRoutineState>(
  (ref) => CreateRoutineController(
      // Initial setup
      CreateRoutineState(
    formKey: GlobalKey<FormState>(),
    titleController: TextEditingController(),
    descriptionController: TextEditingController(),
    difficulty: null,
    dayFrequency: null,
    selectedCategory: '',
    startDateTime: null,
    titleOk: false,
    descriptionOk: false,
    difficultyOk: false,
    dayFrequencyOk: false,
    startDateTimeOk: false,
    everythingOk: false,
  )),
);

class CreateRoutineController extends StateNotifier<CreateRoutineState> {
  CreateRoutineController(
    CreateRoutineState state,
  ) : super(state) {
    initialAsyncSetup();
  }

  Future<void> initialAsyncSetup() async {
    // put async stuff here if necessary
  }

  validateForm() {
    final titleOk = state.titleController.text.trim().isNotEmpty;
    final descriptionOk = state.descriptionController.text.trim().isNotEmpty;
    final dayFrequencyOk = state.dayFrequency != null;
    final startDateTimeOk = state.startDateTime != null;
    final difficultyOk = state.difficulty != null;
    final everythingOk = (titleOk && descriptionOk && difficultyOk && dayFrequencyOk && startDateTimeOk);

    state = state.copyWith(
      titleOk: titleOk,
      descriptionOk: descriptionOk,
      difficultyOk: difficultyOk,
      dayFrequencyOk: dayFrequencyOk,
      startDateTimeOk: startDateTimeOk,
      everythingOk: everythingOk,
    );
  }

  resetForm() {
    state.titleController.clear();
    state.descriptionController.clear();
    state = state.copyWith(
      difficulty: 1,
    );
  }

  updateDifficulty(double difficulty) {
    final flooredDifficulty = difficulty.round();
    state = state.copyWith(difficulty: flooredDifficulty);
  }

  updateDayFrequency(double difficulty) {
    final flooredFrequency = difficulty.round();
    state = state.copyWith(dayFrequency: flooredFrequency);
  }

  Future<void> createRoutine(WidgetRef ref) async {
    final title = state.titleController.text.trim();
    final description = state.descriptionController.text.trim();
    final difficulty = state.difficulty;

    await DataBaseService.instance.createAndSaveRoutine(title, description, difficulty);
    await ref.read(routinesController.notifier).updateRoutines();
  }

  Future<void> setStartDateTime(context) async {
    final today = DateTime.now();
    final earliest = today.subtract(const Duration(days: 365));
    final latest = today.add(const Duration(days: 365));

    final startDateTime = await showDatePicker(
      context: context,
      initialDate: today,
      firstDate: earliest,
      lastDate: latest,
    );

    state = state.copyWith(startDateTime: startDateTime);
  }
}
