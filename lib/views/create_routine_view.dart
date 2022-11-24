import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:habitstats/providers/create_routine_controller.dart';
import 'package:habitstats/widgets/create_routine/custom_text_form_field.dart';
import 'package:habitstats/widgets/create_routine/day_frequency_slider.dart';
import 'package:habitstats/widgets/create_routine/difficulty_slider.dart';
import 'package:habitstats/widgets/create_routine/start_date_picker.dart';
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
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('register your new routine'),
      ),
      body: Form(
        key: formKey,
        onWillPop: () => ref.read(createRoutineControllerProvider.notifier).confirmOrCancelDraftDialog(context),
        child: GestureDetector(
          onTap: () {
            // Detect tap outside of primaryFocus => dismiss keyboard
            FocusScopeNode currentFocus = FocusScope.of(context);
            if (!currentFocus.hasPrimaryFocus) {
              currentFocus.unfocus();
            }
          },
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(48.0),
            child: Column(
              children: [
                CustomTextFormFieldRow(
                  title: 'Title',
                  textController: ref.watch(createRoutineControllerProvider).titleController,
                ),
                const SizedBox(height: 16),
                CustomTextFormFieldRow(
                  title: 'Description',
                  textController: ref.watch(createRoutineControllerProvider).descriptionController,
                ),
                const SizedBox(height: 16),
                const DayFrequencySlider(),
                const DifficultySlider(),
                const StartTimePicker(),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FlatActionButton(
        iconData: Icons.done,
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
