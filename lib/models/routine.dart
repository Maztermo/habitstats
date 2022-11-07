import 'package:isar/isar.dart';

part 'routine.g.dart';

@Collection()
class Routine {
  Id id = Isar.autoIncrement;

  @Index(type: IndexType.value)
  late String title;
  late String description;

  late int difficulty;
  late int dayFrequency;

  @Index(type: IndexType.value)
  late DateTime nextDueDateTime;
  late List<DateTime> routineCompletedDateTimes;

  //String category;
  //late DateTime lastDateTime;
}
