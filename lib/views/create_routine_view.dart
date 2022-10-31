import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:habitstats/providers/create_routine_controller.dart';

class CreateRoutineView extends ConsumerStatefulWidget {
  static const routeId = 'create-routine';

  const CreateRoutineView({super.key});

  @override
  ConsumerState<CreateRoutineView> createState() => _CreateRoutineViewState();
}

class _CreateRoutineViewState extends ConsumerState<CreateRoutineView> {
  @override
  Widget build(
    BuildContext context,
  ) {
    final formKey = ref.watch(createRoutineControllerProvider).formKey;
    final titleController = ref.watch(createRoutineControllerProvider).titleController;
    final descriptionController = ref.watch(createRoutineControllerProvider).descriptionController;
    final difficulty = ref.watch(createRoutineControllerProvider).difficulty;
    final startDateTime = ref.watch(createRoutineControllerProvider).startDateTime;
    final dayFrequency = ref.watch(createRoutineControllerProvider).dayFrequency;
    final everythingOk = ref.watch(createRoutineControllerProvider).everythingOk;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(title: const Text('Create new routine')),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Form(
          autovalidateMode: AutovalidateMode.always,
          key: formKey,
          onWillPop: null, // TODO: "Are you sure you want to discard draft" message
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              children: [
                CreateRoutineTextFormField(title: 'Title', textController: titleController),
                const SizedBox(height: 30),
                CreateRoutineTextFormField(title: 'Description', textController: descriptionController),
                const SizedBox(height: 30),
                CreateRoutineStartTimeSelecter(title: 'Starting from', startDateTime: startDateTime),
                const SizedBox(height: 30),
                CreateRoutineDayFrequencySlider(title: 'How often?', dayFrequency: dayFrequency),
                const SizedBox(height: 30),
                CreateRoutineDifficultySlider(title: 'How hard is it?', difficulty: difficulty),
                const SizedBox(height: 30),
              ],
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

class CreateRoutineStartTimeSelecter extends ConsumerWidget {
  const CreateRoutineStartTimeSelecter({
    Key? key,
    required this.title,
    required this.startDateTime,
  }) : super(key: key);

  final String title;
  final DateTime? startDateTime;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      height: 120,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 32),
      decoration: BoxDecoration(
        color: startDateTime == null ? Colors.grey[300] : Colors.green[200],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.headline5,
          ),
          (startDateTime == null)
              ? ElevatedButton(
                  onPressed: () {
                    ref.read(createRoutineControllerProvider.notifier).setStartDateTime(context);
                    ref.read(createRoutineControllerProvider.notifier).validateForm();
                  },
                  child: const Text('Select'),
                )
              : Column(
                  children: [
                    Text('${startDateTime!.day}.${startDateTime!.month}.${startDateTime!.year}'),
                    ElevatedButton(
                        onPressed: () {
                          ref.read(createRoutineControllerProvider.notifier).setStartDateTime(context);
                          ref.read(createRoutineControllerProvider.notifier).validateForm();
                        },
                        child: const Text('Select another date'))
                  ],
                )
        ],
      ),
    );
  }
}

class CreateRoutineDayFrequencySlider extends ConsumerWidget {
  const CreateRoutineDayFrequencySlider({
    Key? key,
    required this.title,
    required this.dayFrequency,
  }) : super(key: key);

  final int? dayFrequency;
  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      height: 120,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 32),
      decoration: BoxDecoration(
        color: dayFrequency == null ? Colors.grey[300] : Colors.green[200],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.headline5,
          ),
          (dayFrequency == null)
              ? ElevatedButton(
                  onPressed: () {
                    ref.read(createRoutineControllerProvider.notifier).updateDayFrequency(1);
                    ref.read(createRoutineControllerProvider.notifier).validateForm();
                  },
                  child: const Text('Select'),
                )
              : Slider(
                  value: dayFrequency!.toDouble(),
                  onChanged: ref.read(createRoutineControllerProvider.notifier).updateDayFrequency,
                  max: 5,
                  min: 1,
                  divisions: 4,
                  label: dayFrequency.toString(),
                ),
        ],
      ),
    );
  }
}

class CreateRoutineDifficultySlider extends ConsumerWidget {
  const CreateRoutineDifficultySlider({
    Key? key,
    required this.title,
    required this.difficulty,
  }) : super(key: key);

  final int? difficulty;
  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      height: 120,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 32),
      decoration: BoxDecoration(
        color: difficulty == null ? Colors.grey[300] : Colors.green[200],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.headline5,
          ),
          (difficulty == null)
              ? ElevatedButton(
                  onPressed: () {
                    ref.read(createRoutineControllerProvider.notifier).updateDifficulty(1);
                    ref.read(createRoutineControllerProvider.notifier).validateForm();
                  },
                  child: const Text('Select'),
                )
              : Slider(
                  value: difficulty!.toDouble(),
                  onChanged: ref.read(createRoutineControllerProvider.notifier).updateDifficulty,
                  max: 5,
                  min: 1,
                  divisions: 4,
                  label: difficulty.toString(),
                )
        ],
      ),
    );
  }
}

class CreateRoutineTextFormField extends ConsumerWidget {
  final String title;
  final TextEditingController textController;

  const CreateRoutineTextFormField({
    required this.title,
    required this.textController,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      height: 120,
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 48),
      decoration: BoxDecoration(
        color: textController.text.trim().isEmpty ? Colors.grey[300] : Colors.green[200],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.headline5,
          ),
          TextFormField(
            controller: textController,
            onChanged: (_) => ref.read(createRoutineControllerProvider.notifier).validateForm(),
          ),
        ],
      ),
    );
  }
}
