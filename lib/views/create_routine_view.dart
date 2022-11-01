import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:habitstats/providers/create_routine_controller.dart';
import 'package:habitstats/widgets/create_routine/custom_text_form_field.dart';
import 'package:habitstats/widgets/create_routine/day_frequency_slider.dart';
import 'package:habitstats/widgets/create_routine/difficulty_slider.dart';
import 'package:habitstats/widgets/create_routine/start_date_picker.dart';
import 'package:habitstats/widgets/create_routine/valid_or_not_container.dart';

class CreateRoutineView extends ConsumerStatefulWidget {
  static const routeId = 'create-routine';

  const CreateRoutineView({super.key});

  @override
  ConsumerState<CreateRoutineView> createState() => _CreateRoutineViewState();
}

class _CreateRoutineViewState extends ConsumerState<CreateRoutineView> {
  Future<bool> _confirmCancelDraftDialog() async {
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

  @override
  Widget build(BuildContext context) {
    final formKey = ref.watch(createRoutineControllerProvider).formKey;
    final everythingOk = ref.watch(createRoutineControllerProvider).everythingOk;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(title: const Text('Create new routine')),
      body: Form(
        key: formKey,
        onWillPop: () => _confirmCancelDraftDialog(),
        child: GestureDetector(
          onTap: () {
            // Detect tap outside of primaryFocus => dismiss keyboard
            FocusScopeNode currentFocus = FocusScope.of(context);
            if (!currentFocus.hasPrimaryFocus) {
              currentFocus.unfocus();
            }
          },
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(32.0),
              child: Column(
                children: [
                  ValidOrNotContainer(
                    title: 'Title',
                    isValid: ref.watch(createRoutineControllerProvider).titleController.text.trim().isNotEmpty,
                    widget: CustomTextFormField(textController: ref.watch(createRoutineControllerProvider).titleController),
                  ),
                  const SizedBox(height: 30),
                  ValidOrNotContainer(
                    title: 'Description',
                    isValid: ref.watch(createRoutineControllerProvider).descriptionController.text.trim().isNotEmpty,
                    widget: CustomTextFormField(textController: ref.watch(createRoutineControllerProvider).descriptionController),
                  ),
                  const SizedBox(height: 30),
                  ValidOrNotContainer(
                    title: 'Starting from',
                    isValid: ref.watch(createRoutineControllerProvider).startDateTime != null,
                    widget: const StartTimePicker(),
                  ),
                  const SizedBox(height: 30),
                  ValidOrNotContainer(
                    title: 'How often?',
                    isValid: ref.watch(createRoutineControllerProvider).dayFrequency != null,
                    widget: const DayFrequencySlider(),
                  ),
                  const SizedBox(height: 30),
                  ValidOrNotContainer(
                      title: 'How hard is it?',
                      isValid: ref.watch(createRoutineControllerProvider).difficulty != null,
                      widget: const DifficultySlider()),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 0,
        backgroundColor: everythingOk ? Colors.blue : Colors.grey[600]!.withAlpha(150),
        onPressed: everythingOk
            ? () async {
                await ref.read(createRoutineControllerProvider.notifier).createRoutine(ref);
                if (mounted) Navigator.of(context).pop();
              }
            : null,
        child: const Icon(Icons.add),
      ),
    );
  }
}
