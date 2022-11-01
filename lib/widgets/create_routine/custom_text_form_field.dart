import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:habitstats/providers/create_routine_controller.dart';

class CustomTextFormField extends ConsumerWidget {
  final TextEditingController textController;

  const CustomTextFormField({
    required this.textController,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TextFormField(
      controller: textController,
      onChanged: (_) => ref.read(createRoutineControllerProvider.notifier).validateForm(),
    );
  }
}
