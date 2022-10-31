import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
class CreateRoutineState extends Equatable {
  final GlobalKey<FormState> formKey;
  final TextEditingController titleController;
  final TextEditingController descriptionController;
  final int? difficulty; // starts as null
  final int? dayFrequency;
  final String selectedCategory;
  final DateTime? startDateTime; // starts as null
  // bools
  final bool titleOk;
  final bool descriptionOk;
  final bool difficultyOk;
  final bool dayFrequencyOk;
  final bool startDateTimeOk;
  final bool everythingOk;

  const CreateRoutineState({
    required this.formKey,
    required this.titleController,
    required this.descriptionController,
    required this.difficulty,
    required this.dayFrequency,
    required this.selectedCategory,
    required this.startDateTime,
    // bools
    required this.titleOk,
    required this.descriptionOk,
    required this.difficultyOk,
    required this.dayFrequencyOk,
    required this.startDateTimeOk,
    required this.everythingOk,
  });

  CreateRoutineState copyWith({
    final GlobalKey<FormState>? formKey,
    final TextEditingController? titleController,
    final TextEditingController? descriptionController,
    final int? difficulty,
    final int? dayFrequency,
    final String? selectedCategory,
    final DateTime? startDateTime,
    // bools
    final bool? titleOk,
    final bool? descriptionOk,
    final bool? difficultyOk,
    final bool? dayFrequencyOk,
    final bool? startDateTimeOk,
    final bool? everythingOk,
  }) =>
      CreateRoutineState(
        formKey: formKey ?? this.formKey,
        titleController: titleController ?? this.titleController,
        descriptionController: descriptionController ?? this.descriptionController,
        difficulty: difficulty ?? this.difficulty,
        dayFrequency: dayFrequency ?? this.dayFrequency,
        selectedCategory: selectedCategory ?? this.selectedCategory,
        startDateTime: startDateTime ?? this.startDateTime,
        // bools
        titleOk: titleOk ?? this.titleOk,
        descriptionOk: descriptionOk ?? this.descriptionOk,
        difficultyOk: difficultyOk ?? this.difficultyOk,
        dayFrequencyOk: dayFrequencyOk ?? this.dayFrequencyOk,
        startDateTimeOk: startDateTimeOk ?? this.startDateTimeOk,
        everythingOk: everythingOk ?? this.everythingOk,
      );

  @override
  List<Object?> get props => [
        formKey,
        titleController,
        descriptionController,
        difficulty,
        dayFrequency,
        selectedCategory,
        startDateTime,
        // bools
        titleOk,
        descriptionOk,
        difficultyOk,
        dayFrequencyOk,
        startDateTimeOk,
        everythingOk,
      ];
}
