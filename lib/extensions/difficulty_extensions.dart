import 'package:flutter/material.dart';

extension DifficultyExtension on int {
  Color get difficultyColor {
    switch (this) {
      case 1:
        return Colors.green[200]!;
      case 2:
        return const Color.fromARGB(255, 102, 187, 173);
      case 3:
        return const Color.fromARGB(255, 234, 206, 85);
      case 4:
        return const Color.fromARGB(255, 234, 152, 52);
      case 5:
        return const Color.fromARGB(255, 194, 69, 67);

      default:
        return Colors.grey[600]!;
    }
  }
}
