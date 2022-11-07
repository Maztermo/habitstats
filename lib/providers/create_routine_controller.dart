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
    nextDueDateTime: null,
    titleOk: false,
    descriptionOk: false,
    difficultyOk: false,
    dayFrequencyOk: false,
    nextDueDateTimeOk: false,
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
    final nextDueDateTimeOk = state.nextDueDateTime != null;
    final difficultyOk = state.difficulty != null;
    final everythingOk = (titleOk && descriptionOk && difficultyOk && dayFrequencyOk && nextDueDateTimeOk);

    state = state.copyWith(
      titleOk: titleOk,
      descriptionOk: descriptionOk,
      difficultyOk: difficultyOk,
      dayFrequencyOk: dayFrequencyOk,
      nextDueDateTimeOk: nextDueDateTimeOk,
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

  updateDayFrequency(double dayFrequency) {
    final flooredFrequency = dayFrequency.round();
    state = state.copyWith(dayFrequency: flooredFrequency);
  }

  Future<bool> confirmCancelDraftDialog(BuildContext context) async {
    return await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Draft will be deleted'),
            content: const Text('Are you sure you want to go back to the homepage without adding the routine?'),
            actions: [
              TextButton(onPressed: () => Navigator.of(context).pop(true), child: const Text('Yes, delete and go back')),
              TextButton(onPressed: () => Navigator.of(context).pop(false), child: const Text('No, continue editing')),
            ],
          ),
        ) ??
        false;
  }

  Future<void> createRoutine(WidgetRef ref) async {
    final title = state.titleController.text.trim();
    final description = state.descriptionController.text.trim();
    final difficulty = state.difficulty;
    final dayFrequency = state.dayFrequency;
    final nextDueDateTime = state.nextDueDateTime;

    await DataBaseService.instance.createAndSaveRoutine(
      title,
      description,
      difficulty,
      dayFrequency,
      nextDueDateTime,
    );

    await ref.read(routinesController.notifier).updateRoutines();
  }

  Future<void> pickNextDueDateTime(context) async {
    final today = DateTime.now();
    final earliest = today.subtract(const Duration(days: 365));
    final latest = today.add(const Duration(days: 365));

    final nextDueDateTime = await showDatePicker(
      context: context,
      initialDate: today,
      firstDate: earliest,
      lastDate: latest,
    );

    state = state.copyWith(nextDueDateTime: nextDueDateTime);
  }
}
