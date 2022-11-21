import 'package:habitstats/enums/frequency_enum.dart';

extension FrequencyEnumExtension on FrequencyEnum {
  int get days {
    switch (this) {
      case FrequencyEnum.everyday:
        return 1;
      case FrequencyEnum.everySecondDay:
        return 2;
      case FrequencyEnum.everyWeek:
        return 7;
      case FrequencyEnum.everySecondWeek:
        return 14;
      case FrequencyEnum.everyFourthWeek:
        return 28;
    }
  }

  FrequencyEnum getFromDayFrequency(int dayFrequency) {
    switch (dayFrequency) {
      case 1:
        return FrequencyEnum.everyday;
      case 2:
        return FrequencyEnum.everySecondDay;
      case 3:
        return FrequencyEnum.everyWeek;
      case 4:
        return FrequencyEnum.everySecondWeek;
      case 5:
        return FrequencyEnum.everyFourthWeek;
      default:
        return FrequencyEnum.everyday;
    }
  }
}
