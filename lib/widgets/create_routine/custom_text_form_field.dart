import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:habitstats/providers/create_routine_controller.dart';

class CustomTextFormFieldRow extends ConsumerWidget {
  final TextEditingController textController;
  final String title;

  const CustomTextFormFieldRow({
    required this.textController,
    required this.title,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      children: [
        Text(
          '$title:',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        const SizedBox(width: 8),
        Expanded(
          child: TextFormField(
            textAlign: TextAlign.end,
            decoration: InputDecoration(
              isDense: true,
              contentPadding: EdgeInsets.zero,
            ),
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Theme.of(context).colorScheme.secondary),
            controller: textController,
            onChanged: (_) => ref.read(createRoutineControllerProvider.notifier).validateForm(),
          ),
        ),
      ],
    );
  }
}
