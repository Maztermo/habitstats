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
}
