import 'package:habitstats/enums/difficulty_enum.dart';

extension DifficultyEnumExtension on DifficultyEnum {
  DifficultyEnum getFromDifficulty(int difficulty) {
    switch (difficulty) {
      case 1:
        return DifficultyEnum.easy;

      case 2:
        return DifficultyEnum.lightWork;

      case 3:
        return DifficultyEnum.medium;

      case 4:
        return DifficultyEnum.prettyHard;

      case 5:
        return DifficultyEnum.hard;

      default:
        return DifficultyEnum.easy;
    }
  }

  String get uiText {
    switch (this) {
      case DifficultyEnum.easy:
        return 'Easy';
      case DifficultyEnum.lightWork:
        return 'Light Work';
      case DifficultyEnum.medium:
        return 'Medium';
      case DifficultyEnum.prettyHard:
        return 'Pretty Hard';
      case DifficultyEnum.hard:
        return 'Hard';
    }
  }
}
