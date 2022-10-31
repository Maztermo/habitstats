import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:habitstats/models/routine.dart';

@immutable
class RoutinesState extends Equatable {
  final List<Routine> routines;

  const RoutinesState({
    required this.routines,
  });

  RoutinesState copyWith({
    final List<Routine>? routines,
  }) =>
      RoutinesState(
        routines: routines ?? this.routines,
      );

  @override
  List<Object?> get props => [
        routines,
      ];
}
