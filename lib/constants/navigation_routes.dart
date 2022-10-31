import 'package:flutter/material.dart';
import 'package:habitstats/views/create_routine_view.dart';

final Map<String, Widget Function(BuildContext)> navigationRoutes = {
  CreateRoutineView.routeId: (ctx) => const CreateRoutineView(),
};
