import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:habitstats/models/routine.dart';
import 'package:habitstats/providers/routines_controller.dart';
import 'package:habitstats/widgets/routine_tile.dart';

class UpcomingView extends ConsumerWidget {
  const UpcomingView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<Routine> routines = ref.watch(routinesController).routines;
    return Padding(
      padding: const EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
      child: Column(
        children: [
          Text(
            'Motivational words here',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          Expanded(
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: routines.length,
              itemBuilder: ((context, index) {
                final routine = routines[index];
                return RoutineTile(routine: routine);
              }),
            ),
          ),
        ],
      ),
    );
  }
}
