import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:habitstats/providers/create_routine_controller.dart';
import 'package:habitstats/widgets/create_routine/custom_text_form_field.dart';
import 'package:habitstats/widgets/create_routine/day_frequency_slider.dart';
import 'package:habitstats/widgets/create_routine/difficulty_slider.dart';
import 'package:habitstats/widgets/create_routine/start_date_picker.dart';
import 'package:habitstats/widgets/create_routine/validation_container.dart';
import 'package:habitstats/widgets/flat_action_button.dart';

class CreateRoutineView extends ConsumerStatefulWidget {
  static const routeId = 'create-routine';

  const CreateRoutineView({super.key});

  @override
  ConsumerState<CreateRoutineView> createState() => _CreateRoutineViewState();
}

class _CreateRoutineViewState extends ConsumerState<CreateRoutineView> {
  @override
  Widget build(BuildContext context) {
    final formKey = ref.watch(createRoutineControllerProvider).formKey;
    final everythingOk = ref.watch(createRoutineControllerProvider).everythingOk;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(title: const Text('Create new routine')),
      body: Form(
        key: formKey,
        onWillPop: () => ref.read(createRoutineControllerProvider.notifier).confirmCancelDraftDialog(context),
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
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(32.0),
              child: Column(
                children: [
                  ValidationContainer(
                    title: 'Title',
                    isValid: ref.watch(createRoutineControllerProvider).titleController.text.trim().isNotEmpty,
                    widget: CustomTextFormField(textController: ref.watch(createRoutineControllerProvider).titleController),
                  ),
                  const SizedBox(height: 30),
                  ValidationContainer(
                    title: 'Description',
                    isValid: ref.watch(createRoutineControllerProvider).descriptionController.text.trim().isNotEmpty,
                    widget: CustomTextFormField(textController: ref.watch(createRoutineControllerProvider).descriptionController),
                  ),
                  const SizedBox(height: 30),
                  ValidationContainer(
                    title: 'Starting from',
                    isValid: ref.watch(createRoutineControllerProvider).nextDueDateTime != null,
                    widget: const StartTimePicker(),
                  ),
                  const SizedBox(height: 30),
                  ValidationContainer(
                    title: 'How often?',
                    isValid: ref.watch(createRoutineControllerProvider).dayFrequency != null,
                    widget: const DayFrequencySlider(),
                  ),
                  const SizedBox(height: 30),
                  ValidationContainer(
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
      floatingActionButton: FlatActionButton(
        onTap: everythingOk
            ? () async {
                await ref.read(createRoutineControllerProvider.notifier).createRoutine(ref);
                if (mounted) Navigator.of(context).pop();
              }
            : null,
      ),
    );
  }
}
