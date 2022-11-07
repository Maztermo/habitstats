import 'package:habitstats/enums/how_often.dart';

extension HowOftenExtension on HowOften {
  int get days {
    switch (this) {
      case HowOften.everyday:
        return 1;
      case HowOften.everySecondDay:
        return 2;
      case HowOften.everyWeek:
        return 7;
      case HowOften.everySecondWeek:
        return 14;
      case HowOften.everyFourthWeek:
        return 28;
    }
  }

  HowOften getFromDayFrequency(int dayFrequency) {
    switch (dayFrequency) {
      case 1:
        return HowOften.everyday;
      case 2:
        return HowOften.everySecondDay;
      case 3:
        return HowOften.everyWeek;
      case 4:
        return HowOften.everySecondWeek;
      case 5:
        return HowOften.everyFourthWeek;
      default:
        return HowOften.everyday;
    }
  }
}
